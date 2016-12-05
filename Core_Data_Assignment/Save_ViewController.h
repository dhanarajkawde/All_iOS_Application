//
//  Save_ViewController.h
//  Core_Data_Assignment
//
//  Created by Mac on 17/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Save_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *empidLabel;

@property (weak, nonatomic) IBOutlet UITextField *empNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *empAddLabel;

@property (weak, nonatomic) IBOutlet UITextField *empPhoneLabel;

- (IBAction)saveBtn:(id)sender;








@end
