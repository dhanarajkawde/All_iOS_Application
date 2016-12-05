//
//  Second_ViewController.m
//  Map_Project
//
//  Created by Student-13 on 24/10/16.
//  Copyright © 2016 Student-12. All rights reserved.
//

#import "Second_ViewController.h"

@interface Second_ViewController ()

@end

@implementation Second_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView.image=[UIImage imageNamed:_tempView];
    _name.text=_tempName;
    _descriptn.text=_tempDescriptn;
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
