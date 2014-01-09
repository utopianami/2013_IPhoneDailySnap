//
//  ViewLogin.m
//  dailySnapApp
//
//  Created by YoungNam Lee on 13. 12. 15..
//  Copyright (c) 2013년 YoungNam Lee. All rights reserved.
//

#import "ViewLogin.h"

@interface ViewLogin ()

@end

@implementation ViewLogin

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
