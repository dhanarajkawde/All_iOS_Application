//
//  Second_ViewController.h
//  My_First_App
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Second_ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTf;

@property (weak, nonatomic) IBOutlet UITextField *descriptionTf;

@property (weak, nonatomic) IBOutlet UITextField *dateTf;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;

//- (IBAction)dateselected:(id)sender;

- (IBAction)saveBtn:(id)sender;






@end
