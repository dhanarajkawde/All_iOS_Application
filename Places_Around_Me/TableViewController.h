//
//  TableViewController.h
//  Places_Around_Me
//
//  Created by Felix-ITS 012 on 26/11/16.
//  Copyright © 2016 Felix-Jyoti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property(nonatomic,retain)NSMutableArray *original;
@property(nonatomic,retain)NSString *url,*temp;
@property(nonatomic,retain)NSMutableData *data;

@end
