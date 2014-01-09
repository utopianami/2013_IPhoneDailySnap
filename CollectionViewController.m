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
#import "wirteViewViewController.h"
#import "detailViewController.h"

@interface CollectionViewController ()
{
    NSArray *arrayImage;
    ModelServer * _modelServer;
    UINavigationController *navigationController;
    NSIndexPath* ip;
    
    
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
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:240/259.0 green:96/259.0 blue:96/259.0 alpha:1.0]];
}

//-(void)viewWillAppear:(BOOL)animated
//{
////    [_modelServer reload];
//}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
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
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ip = indexPath;
    [self performSegueWithIdentifier:@"show" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDictionary * item3 = [_modelServer objectAtiIndex: ip.item];
    
    detailViewController * detail = [segue destinationViewController];
    [detail setItem:item3];
}



- (IBAction)camera:(id)sender
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"취소"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"사진 촬영", @"앨범에서 가져오기", nil];
    [actionsheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagepickerController = [[UIImagePickerController alloc] init];
    [imagepickerController setDelegate:self];
    [imagepickerController setAllowsEditing:YES];
    if(buttonIndex == 0){
        [imagepickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        [self presentModalViewController:imagepickerController animated:YES];
    }
    else if(buttonIndex == 1){
        [imagepickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        [self presentModalViewController:imagepickerController animated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    wirteViewViewController *view =[self.storyboard instantiateViewControllerWithIdentifier:@"wirteViewViewController"];
    [view setImage:image];

    [self.navigationController pushViewController:view animated:YES];
    [picker dismissModalViewControllerAnimated:YES];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

@end
