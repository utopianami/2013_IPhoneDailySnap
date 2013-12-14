//
//  CollectionViewController.m
//  dailySnapApp
//
//  Created by YoungNam Lee on 13. 12. 15..
//  Copyright (c) 2013년 YoungNam Lee. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"


@interface CollectionViewController ()
{
    NSArray *arrayImage;
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
    arrayImage = [[NSArray alloc]initWithObjects:@"12.png",@"23.png", nil];
    [super viewDidLoad];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    [[cell collectionImageView]setImage:[UIImage imageNamed:[arrayImage objectAtIndex:indexPath.item]]];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrayImage count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
