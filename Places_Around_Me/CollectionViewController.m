//
//  CollectionViewController.m
//  Places_Around_Me
//
//  Created by Felix-ITS 012 on 26/11/16.
//  Copyright © 2016 Felix-Jyoti. All rights reserved.
//

#import "CollectionViewController.h"
#import "Cell_CollectionViewCell.h"
#import "TableViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _geocoder=[[CLGeocoder alloc]init];
    _lati=[[NSString alloc]init];
    _longi=[[NSString alloc]init];
    _place=[[NSString alloc]init];
    
    _namearray=[[NSMutableArray alloc]initWithObjects:@"hospital",@"bank",@"policestation",@"hotel",@"atm",@"coffeeshop", nil];
    
    _imagearray=[[NSMutableArray alloc]initWithObjects:@"hospital.jpeg",@"bank.jpeg",@"police.jpeg",@"hotel.png",@"atm.jpeg",@"coffee.jpeg", nil];
    
    NSString *address=@"Kothrud , Pune, Maharashtra, India, 411038";
    
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *mylatlong=[placemarks objectAtIndex:0];
        CLLocation *location=mylatlong.location;
        
        _longi=[NSString stringWithFormat: @"%f", location.coordinate.longitude];
        
        _lati=[NSString stringWithFormat: @"%f", location.coordinate.latitude];
   }];
  
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageview.image=[UIImage imageNamed:[_imagearray objectAtIndex:indexPath.row]];
    cell.nameLabel.text=[_namearray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item==0)
    {
        _place=@"hospital";
    
        NSString *url =[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&type=%@&key=AIzaSyBTPh6eJQdLel0dW3DLDDf-8n450m0CaFk",_lati,_longi,_place];
    
    TableViewController *table=[[TableViewController alloc]init];
    table.temp=url;
    [self.navigationController pushViewController:table animated:YES];
        
    }
    else if(indexPath.item==1)
    {
        _place=@"bank";
        
        NSString *url =[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&type=%@&key=AIzaSyBTPh6eJQdLel0dW3DLDDf-8n450m0CaFk",_lati,_longi,_place];
        
        TableViewController *table=[[TableViewController alloc]init];
        table.temp=url;
        [self.navigationController pushViewController:table animated:YES];
    }
    else if (indexPath.item==2)
    {
        _place=@"policestation";
        
        NSString *url =[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&type=%@&key=AIzaSyBTPh6eJQdLel0dW3DLDDf-8n450m0CaFk",_lati,_longi,_place];
        
        TableViewController *table=[[TableViewController alloc]init];
        table.temp=url;
        [self.navigationController pushViewController:table animated:YES];
    }
    else if (indexPath.item==3)
    {
        _place=@"hotel";
        
        NSString *url =[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&type=%@&key=AIzaSyBTPh6eJQdLel0dW3DLDDf-8n450m0CaFk",_lati,_longi,_place];
        
        TableViewController *table=[[TableViewController alloc]init];
        table.temp=url;
        [self.navigationController pushViewController:table animated:YES];
    }
    else if (indexPath.item==4)
    {
        _place=@"atm";
        
        NSString *url =[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&type=%@&key=AIzaSyBTPh6eJQdLel0dW3DLDDf-8n450m0CaFk",_lati,_longi,_place];
        
        TableViewController *table=[[TableViewController alloc]init];
        table.temp=url;
        [self.navigationController pushViewController:table animated:YES];
    }
    else
    {
        _place=@"coffeeshop";
        
        NSString *url =[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&type=%@&key=AIzaSyBTPh6eJQdLel0dW3DLDDf-8n450m0CaFk",_lati,_longi,_place];
        
        TableViewController *table=[[TableViewController alloc]init];
        table.temp=url;
        [self.navigationController pushViewController:table animated:YES];
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
