//
//  ModelServer.h
//  dailySnapApp
//
//  Created by YoungNam Lee on 13. 12. 15..
//  Copyright (c) 2013년 YoungNam Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelServer : NSObject <NSURLConnectionDataDelegate>

@property UICollectionViewController* collectionController;

-(NSDictionary*)objectAtiIndex:(NSInteger)index;
-(void)addItem:(NSDictionary*)item;
-(NSInteger)numberOfData;

@end
