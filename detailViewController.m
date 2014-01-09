//
//  detailViewController.m
//  dailySnapApp
//
//  Created by YoungNam Lee on 14. 1. 7..
//  Copyright (c) 2014년 YoungNam Lee. All rights reserved.
//

#import "detailViewController.h"
#import "UIImageView+WebCache.h"

@interface detailViewController ()

@end

@implementation detailViewController
{
    NSDictionary * item;
}

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
    _snapTitle.text = [item objectForKey:@"title"];
    _snapMini.text = [item objectForKey:@"mini"];
    [_snapImage setImageWithURL :[NSURL URLWithString:[item objectForKey:@"image"]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)setItem:(NSDictionary *)dic
{
    item = dic;
}

@end
