//
//  FirstTableViewController.h
//  JsonAssignment
//
//  Created by Student-004 on 09/11/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewController : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>


@property(nonatomic,retain)NSMutableArray *array1,*array2;
@property(nonatomic,retain)NSMutableData *mydata;



@end
