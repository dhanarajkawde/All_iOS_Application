//
//  PrimeViewController.h
//  Application 1&2
//
//  Created by Mac on 23/09/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrimeViewController : UIViewController<UITextFieldDelegate>
{
    BOOL prime;
}
@property(nonatomic,retain)UITextField *tf;

@property(nonatomic,retain)UIButton *btn;


@end
