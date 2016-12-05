//
//  PrimeViewController.m
//  Application 1&2
//
//  Created by Mac on 23/09/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "PrimeViewController.h"

@interface PrimeViewController ()

@end

@implementation PrimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _tf=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 50)];
    _tf.textColor=[UIColor blackColor];
    _tf.borderStyle=UITextBorderStyleBezel;
    _tf.keyboardType=UIKeyboardTypeAlphabet;
    _tf.delegate=self;
    
    [self.view addSubview:_tf];
    
    
    _btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame=CGRectMake(30, 90, 150, 50);
    [_btn setTitle:@"Check Prime" forState:UIControlStateNormal];
    [_btn setTitle:@"Selected" forState:UIControlStateHighlighted];
    
    [_btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
     
    [self.view addSubview:_btn];
}

-(void)btnclick
{
    int i,n;
    int c=0;
    n=[_tf.text intValue];
   // prime=false;
    NSLog(@"NO is =%d",n);
    for (i=2; i<=n-1; i++)
    {
        if (n%i==0)
        {
            c=1;
            break;
        }
    }
    
        if(c==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Prime NUmber" message:@"It is Prime Number" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
                [alert show];
               
            }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Prime NUmber" message:@"It is not Prime Number" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
        [alert show];
    }
        
    }










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
