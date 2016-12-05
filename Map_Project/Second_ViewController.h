//
//  Second_ViewController.h
//  Map_Project
//
//  Created by Student-13 on 24/10/16.
//  Copyright © 2016 Student-13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Second_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic,retain)NSString *tempView;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *descriptn;

@property(nonatomic,retain)NSString *tempName,*tempDescriptn;
@end
