//
//  CalculateViewController.h
//  Application 1&2
//
//  Created by Mac on 25/09/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculateViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

{
    int i,j,k,l;
}

@property(nonatomic,retain)UITableView *table;

@property(nonatomic,retain)UITextField *tf1,*tf2;

@property(nonatomic,retain)UIButton *btn;

@property(nonatomic,retain)NSMutableArray *nsarray;

@end
