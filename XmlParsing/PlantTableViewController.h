//
//  PlantTableViewController.h
//  XmlParsing
//
//  Created by Student-002 on 07/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plant.h"

@interface PlantTableViewController : UITableViewController<NSXMLParserDelegate>

@property(nonatomic,retain)NSMutableArray *plantarray;
@property(nonatomic,retain)NSXMLParser *parsing;
@property(nonatomic,retain)NSMutableString *str;
@property(nonatomic,retain)Plant *p;

@end
