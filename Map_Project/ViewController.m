//
//  ViewController.m
//  Map_Project
//
//  Created by Student-13 on 24/10/16.
//  Copyright © 2016 Student-12. All rights reserved.
//

#import "ViewController.h"
#import "Second_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _click1=[[UIButton alloc]init];
    _click2=[[UIButton alloc]init];
    _click3=[[UIButton alloc]init];
    _click4=[[UIButton alloc]init];
    _click5=[[UIButton alloc]init];
    _click6=[[UIButton alloc]init];
    _click7=[[UIButton alloc]init];
    
    
    _map=[[MKMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _map.mapType=MKMapTypeHybrid;
    _map.delegate=self;
    
    [self.view addSubview:_map];
    
   
    _point1=[[MKPointAnnotation alloc]init];
    _point1.title=@"Great Pyramid Of Giza";
    _point1.subtitle=@"Egypt";
    CLLocationCoordinate2D location1;
    location1.latitude=29.9792;location1.longitude=31.1342;
    _point1.coordinate=location1;
    
    [_map addAnnotation:_point1];


    _point2=[[MKPointAnnotation alloc]init];
    _point2.title=@"Colosseum";
    _point2.subtitle=@"Rome";
    CLLocationCoordinate2D location2;
    location2.latitude=41.8902;location2.longitude=12.4922;
    _point2.coordinate=location2;
    
    [_map addAnnotation:_point2];
    
    
    _point3=[[MKPointAnnotation alloc]init];
    _point3.title=@"Great Wall Of China";
    _point3.subtitle=@"China";
    CLLocationCoordinate2D location3;
    location3.latitude=40.4319;location3.longitude=116.5704;
    _point1.coordinate=location3;
    
    [_map addAnnotation:_point3];
    
    
    _point4=[[MKPointAnnotation alloc]init];
    _point4.title=@"Hagia Sophia";
    _point4.subtitle=@"Spain";
    CLLocationCoordinate2D location4;
    location4.latitude=41.0086;location4.longitude=28.9802;
    _point4.coordinate=location4;
    
    [_map addAnnotation:_point4];
    
    
    _point5=[[MKPointAnnotation alloc]init];
    _point5.title=@"Stonehenge";
    _point5.subtitle=@"France";
    CLLocationCoordinate2D location5;
    location5.latitude=51.1789;location5.longitude=1.8262;
    _point5.coordinate=location5;
    
    [_map addAnnotation:_point5];
    
    
    _point6=[[MKPointAnnotation alloc]init];
    _point6.title=@"Macchu Picchu";
    _point6.subtitle=@"XYZ";
    CLLocationCoordinate2D location6;
    location6.latitude=13.1631;location6.longitude=72.5450;
    _point6.coordinate=location6;
    
    [_map addAnnotation:_point6];
    
    
    _point7=[[MKPointAnnotation alloc]init];
    _point7.title=@"Taj Mahal";
    _point7.subtitle=@"India";
    CLLocationCoordinate2D location7;
    location7.latitude=27.1750;location7.longitude=78.0422;
    _point7.coordinate=location7;
    
    [_map addAnnotation:_point7];
    
    
    _imagearray=[NSMutableArray arrayWithObjects:@"pyramid.jpg",@"colo.jpg",@"china.jpg",@"hagia.jpg",@"stone.jpg",@"macchu.jpg",@"taj.jpg", nil];
    
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pin=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    pin.pinTintColor=[UIColor blueColor];
    
    pin.canShowCallout=YES;
    
    if(annotation==_point1)
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:0]]];
        _click1=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click1 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView=_click1;
        pin.leftCalloutAccessoryView=i;
    }
    else if(annotation==_point2)
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:1]]];
        _click2=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click2 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView=_click2;
        pin.leftCalloutAccessoryView=i;
    }
    else if(annotation==_point3)
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:2]]];
        _click3=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click3 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView=_click3;
        pin.leftCalloutAccessoryView=i;
    }
    else if(annotation==_point4)
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:3]]];
        _click4=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click4 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView=_click4;
        pin.leftCalloutAccessoryView=i;
    }
    else if(annotation==_point5)
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:4]]];
        _click5=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click5 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.leftCalloutAccessoryView=i;
        pin.rightCalloutAccessoryView=_click5;
    }
    else if(annotation==_point6)
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:5]]];
        _click6=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click6 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView=_click6;
        pin.leftCalloutAccessoryView=i;
    }
    else
    {
        UIImageView *i=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imagearray objectAtIndex:6]]];
        _click7=[UIButton buttonWithType:UIButtonTypeInfoDark];
        
        [_click7 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView=_click7;
        pin.leftCalloutAccessoryView=i;
    }
    
    return pin;
}

-(void)btnclick:(UIButton *)sender
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Second_ViewController *s=[storyboard instantiateViewControllerWithIdentifier:@"fvctosvc"];
    
    //Second_ViewController *s=[self.storyboard instantiateViewControllerWithIdentifier:@"fvctosvc"];
    
    if(sender==_click1)
    {
        s.tempView=@"pyramid.jpg";
        s.tempName=@"Great Pyramid Of Giza";
        s.tempDescriptn=@"The Great Pyramid of Giza is the oldest and largest of the three pyramids in the Giza pyramid complex bordering what is now El Giza, Egypt. It is the oldest of the Seven Wonders of the Ancient World, and the only one to remain largely intact.";
        
        [self.navigationController pushViewController:s animated:YES];
    }
    else if (sender==_click2)
    {
        s.tempView=@"colo.jpg";
        s.tempName=@"Colosseum";
        s.tempDescriptn=@"The Colosseum's original Latin name was Amphitheatrum Flavium, often anglicized as Flavian Amphitheater. The building was constructed by emperors of the Flavian dynasty, following the reign of Nero. This name is still used in modern English, but generally the structure is better known as the Colosseum.eeeeeeeeefwefvvv vefefwefwfw";
        
        [self.navigationController pushViewController:s animated:YES];
    }
    else if (sender==_click3)
    {
        s.tempView=@"china.jpg";
        s.tempName=@"The Great Wall Of China";
        s.tempDescriptn=@"The Great Wall, one of the greatest wonders of the world, was listed as a World Heritage by UNESCO in 1987. Just like a gigantic dragon, it winds up and down across deserts, grasslands, mountains and plateaus, stretching approximately 13,170 miles (21,196 kilometers) from east to west of China.";
    }
    
    else if (sender==_click4)
    {
        s.tempView=@"hiagia.jpg";
        s.tempName=@"Hagia Sophia";
        s.tempDescriptn=@"Hagia Sophia (from the Greek: Ἁγία Σοφία, Byzantine Greek [aˈʝia soˈfia]), “Holy Wisdom”; Latin: Sancta Sophia or Sancta Sapientia; Turkish: Ayasofya) was a Greek Orthodox Christian patriarchal basilica (church), later an imperial mosque, and now a museum (Ayasofya Müzesi) in Istanbul, Turkey.";
        
        [self.navigationController pushViewController:s animated:YES];
    }
    
    else if (sender==_click5)
    {
        s.tempView=@"stone.jpg";
        s.tempName=@"Stonehenge";
        s.tempDescriptn=@"Stonehenge is one of the best known ancient wonders of the world. The 5,000 year old henge monument became a World Heritage Site in 1986. Despite numerous theories, no-one knows for certain the reason why Stonehenge was built.";
        
        [self.navigationController pushViewController:s animated:YES];
    }
    else if (sender==_click6)
    {
        s.tempView=@"macchu.jpg";
        s.tempName=@"Macchu Picchu";
        s.tempDescriptn=@"It is located in the Cusco Region, Urubamba Province, Machupicchu District in Peru, above the Sacred Valley, which is 80 kilometres (50 mi) northwest of Cuzco and through which the Urubamba River flows. Most archaeologists believe that Machu Picchu was built as an estate for the Inca emperor Pachacuti (1438–1472).";
        
        [self.navigationController pushViewController:s animated:YES];
    }
    else
    {
        s.tempView=@"taj.jpg";
        s.tempName=@"Taj Mahal";
        s.tempDescriptn=@"An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor Shah Jahan in memory of his favourite wife, the Taj Mahal is the jewel of Muslim art in India and one of the universally admired masterpieces of the world's heritage.";
        
        [self.navigationController pushViewController:s animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
