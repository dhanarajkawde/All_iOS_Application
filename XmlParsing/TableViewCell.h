//
//  TableViewCell.h
//  XmlParsing
//
//  Created by Student-002 on 07/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *COMMON;

@property (strong, nonatomic) IBOutlet UILabel *BOTANICAL;

@property (weak, nonatomic) IBOutlet UILabel *zonelabel;

@property (weak, nonatomic) IBOutlet UILabel *pricelabel;

@property (weak, nonatomic) IBOutlet UILabel *lightLabel;

@property (weak, nonatomic) IBOutlet UILabel *avaibility;



@end
