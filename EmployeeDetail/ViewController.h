//
//  ViewController.h
//  EmployeeDetail
//
//  Created by Student-004 on 06/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)NSMutableArray *emparray;


@property (weak, nonatomic) IBOutlet UITableView *emptable;

- (IBAction)btn1:(id)sender;

- (IBAction)btn2:(id)sender;

- (IBAction)btn3:(id)sender;


@end

