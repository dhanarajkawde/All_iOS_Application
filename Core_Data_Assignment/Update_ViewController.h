//
//  Update_ViewController.h
//  Core_Data_Assignment
//
//  Created by Mac on 17/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Update_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *findLabel;

@property (weak, nonatomic) IBOutlet UITextField *label1;

@property (weak, nonatomic) IBOutlet UITextField *label2;

@property (weak, nonatomic) IBOutlet UITextField *label3;

- (IBAction)findBtn:(id)sender;

- (IBAction)updateBtn:(id)sender;


- (IBAction)deleteBtn:(id)sender;









@end
