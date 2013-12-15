//
//  CollectionViewController.m
//  dailySnapApp
//
//  Created by YoungNam Lee on 13. 12. 15..
//  Copyright (c) 2013년 YoungNam Lee. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"
#import "ModelServer.h"
#import "UIImageView+WebCache.h"

@interface CollectionViewController ()
{
    NSArray *arrayImage;
    ModelServer * _modelServer;
}

@end

@implementation CollectionViewController

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
    _modelServer = [[ModelServer alloc]init];
    _modelServer.collectionController = self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    //[[cell collectionImageView]setImage:[UIImage imageNamed:[arrayImage objectAtIndex:indexPath.item]]];
    NSDictionary* item = [_modelServer objectAtiIndex:indexPath.item];
    NSString* url = [item objectForKey:@"image"];
    [cell.collectionImageView setImageWithURL:[NSURL URLWithString:url]];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_modelServer numberOfData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"show" sender:self];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"show"]){
        NSLog(@"test");
    }
}

@end
