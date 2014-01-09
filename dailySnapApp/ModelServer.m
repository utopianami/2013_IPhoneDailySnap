//
//  ModelServer.m
//  dailySnapApp
//
//  Created by YoungNam Lee on 13. 12. 15..
//  Copyright (c) 2013년 YoungNam Lee. All rights reserved.
//

#import "ModelServer.h"

@implementation ModelServer
{
    NSMutableArray* _itemArray;
    NSDictionary* _itemDictionary;
    ModelServer* _dataModel;
    NSMutableData * _responseData;
}

-(id)init
{
    self = [super init];
    if (self){
        _itemArray =[@[
                       @{@"text":@"text1", @"image":@"1.png"},
                       @{@"text":@"text2", @"image":@"2.png"},
                       @{@"text":@"text3", @"image":@"3.png"}
                       ]mutableCopy];

    

    _responseData = [[NSMutableData alloc]initWithCapacity:10];
    NSString *aURLString = @"http://0.0.0.0:7000/snap/json";

    NSURL *aURL = [NSURL URLWithString:aURLString];
    NSURLRequest *aRequest = [NSMutableURLRequest
                              requestWithURL:aURL];
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:aRequest delegate:self startImmediately:YES];
    }
    return self;
}
//
//-(void)reload
//{
//    _responseData = [[NSMutableData alloc]initWithCapacity:10];
//    NSString *aURLString = @"http://0.0.0.0:7000/json";
//    
//    NSURL *aURL = [NSURL URLWithString:aURLString];
//    NSURLRequest *aRequest = [NSMutableURLRequest
//                              requestWithURL:aURL];
//    NSURLConnection *connection = [[NSURLConnection alloc]
//                                   initWithRequest:aRequest delegate:self startImmediately:YES];
//}


-(NSDictionary*)objectAtiIndex:(NSInteger)index
{
    return _itemArray[index];
}

-(NSInteger)numberOfData
{
    return [_itemArray count];
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    
    NSDictionary * resultArray = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
    _itemArray = [resultArray objectForKey:@"result"];
    
    [_collectionController.collectionView reloadData];
}


-(BOOL) newPost:(NSString*)title withMini:(NSString*)text withImage:(NSData*)image
{
    NSDateFormatter *now = [[NSDateFormatter alloc] init];
    [now setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString* date = [now stringFromDate:[NSDate date]];
    
    NSString *aURLString = @"http://0.0.0.0:7000/snap/uploadM";
    NSURL *aURL = [NSURL URLWithString:aURLString];
    NSMutableURLRequest *aRequest = [NSMutableURLRequest requestWithURL:aURL];
    [aRequest setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [aRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"title"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n", title] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"mini"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n", text] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"snap\"; filename=\"%@.jpg\"\r\n",@"HI"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: image/jpg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData: [NSData dataWithData:image]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [aRequest setHTTPBody:body];
    
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:aRequest delegate:self startImmediately:YES];
    return NO;
}

@end
