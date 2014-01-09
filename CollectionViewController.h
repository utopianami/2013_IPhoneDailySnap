//
//  CollectionViewController.h
//  dailySnapApp
//
//  Created by YoungNam Lee on 13. 12. 15..
//  Copyright (c) 2013년 YoungNam Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CollectionViewController : UICollectionViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIActionSheetDelegate>
- (IBAction)camera:(id)sender;

@end
