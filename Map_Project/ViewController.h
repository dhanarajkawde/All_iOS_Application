//
//  ViewController.h
//  Map_Project
//
//  Created by Student-13 on 24/10/16.
//  Copyright © 2016 Student-13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>



@property(nonatomic,retain)MKMapView *map;

@property(nonatomic,retain)NSMutableArray *imagearray;

@property(nonatomic,retain)MKPointAnnotation *point1,*point2,*point3,*point4,*point5,*point6,*point7;
@property(nonatomic,retain)UIButton *click1,*click2,*click3,*click4,*click5,*click6,*click7;

@end

