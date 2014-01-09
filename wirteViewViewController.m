//
//  wirteViewViewController.m
//  dailySnapApp
//
//  Created by YoungNam Lee on 14. 1. 7..
//  Copyright (c) 2014년 YoungNam Lee. All rights reserved.
//

#import "wirteViewViewController.h"
#import "ModelServer.h"

@interface wirteViewViewController ()

@end

@implementation wirteViewViewController
{
    ModelServer * _model;
    UIImage *_img;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _model = [[ModelServer alloc] init];
    _imageView.image = _img;
    

}
- (IBAction)save:(id)sender {
    NSData* imagedata = UIImageJPEGRepresentation(_imageView.image, 0.5);
    [_model newPost:_title2.text withMini:_mini.text withImage:imagedata];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)setImage:(UIImage*)image
{
    _img = image;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
