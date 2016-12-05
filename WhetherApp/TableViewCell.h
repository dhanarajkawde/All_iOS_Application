//
//  TableViewCell.h
//  WhetherApp
//
//  Created by Student-004 on 28/11/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *mintemplabel;

@property (weak, nonatomic) IBOutlet UILabel *maxtemplabel;

@property (weak, nonatomic) IBOutlet UILabel *humiditylabel;

@property (weak, nonatomic) IBOutlet UILabel *windspeedlabel;
@property (weak, nonatomic) IBOutlet UILabel *summarylabel;

@end
