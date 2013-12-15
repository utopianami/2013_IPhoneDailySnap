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
    NSString *aURLString = @"http://1.234.2.8/board.php";
    NSURL *aURL = [NSURL URLWithString:aURLString];
    NSURLRequest *aRequest = [NSMutableURLRequest
                              requestWithURL:aURL];
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:aRequest delegate:self startImmediately:YES];
    }
    return self;
}


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
    NSArray * resultArray = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",resultArray);
    _itemArray = resultArray;
    [_collectionController.collectionView reloadData];
}


@end
