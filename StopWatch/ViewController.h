//
//  ViewController.h
//  StopWatch
//
//  Created by Felix-ITS 012 on 15/11/16.
//  Copyright © 2016 Felix-Harish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    int a,b,c;
}

@property (strong, nonatomic) IBOutlet UIButton *start;
@property (strong, nonatomic) IBOutlet UIButton *stop;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;

- (IBAction)Start:(id)sender;

- (IBAction)Stop:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,retain)NSTimer *timer;

@property(nonatomic,retain)NSDate *startDate;

@property(nonatomic,retain)NSMutableArray *array;
@end

