//
//  detailViewController.h
//  dailySnapApp
//
//  Created by YoungNam Lee on 14. 1. 7..
//  Copyright (c) 2014년 YoungNam Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *snapImage;
@property (weak, nonatomic) IBOutlet UILabel *snapTitle;
@property (weak, nonatomic) IBOutlet UITextView *snapMini;
-(void)setItem:(NSDictionary *)dic;
@end
