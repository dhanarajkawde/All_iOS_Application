//
//  CollectionViewController.h
//  Places_Around_Me
//
//  Created by Felix-ITS 012 on 26/11/16.
//  Copyright © 2016 Felix-Jyoti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CollectionViewController : UICollectionViewController


@property(nonatomic,retain)CLGeocoder *geocoder;
@property(nonatomic,retain)NSString *lati,*longi,*place;
@property(nonatomic,retain)NSMutableArray *namearray,*imagearray;


@end
