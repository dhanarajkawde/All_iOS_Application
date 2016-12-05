//
//  Third_ViewController.h
//  My_First_App
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Third_ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *thirdTf1;
@property (weak, nonatomic) IBOutlet UITextField *thirdTf2;
@property (weak, nonatomic) IBOutlet UITextField *thirdTf3;
- (IBAction)updateBtn:(id)sender;

@property(nonatomic,retain)NSString *s1;
@property(nonatomic,retain)NSMutableArray *tt;

@end
