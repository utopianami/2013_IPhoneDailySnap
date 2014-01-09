//
//  wirteViewViewController.h
//  dailySnapApp
//
//  Created by YoungNam Lee on 14. 1. 7..
//  Copyright (c) 2014년 YoungNam Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wirteViewViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *mini;
@property (weak, nonatomic) IBOutlet UITextField *title2;

- (void)setImage:(UIImage*)image;
@end    
