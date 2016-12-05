//
//  Update_ViewController.m
//  Core_Data_Assignment
//
//  Created by Mac on 17/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "Update_ViewController.h"
#import "AppDelegate.h"
#import "Employee.h"

@interface Update_ViewController ()

@end

@implementation Update_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findBtn:(id)sender
{
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *appdelegate=(AppDelegate *)application.delegate;
    NSManagedObjectContext *conext=appdelegate.managedObjectContext;
    
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    
    NSArray *array=[conext executeFetchRequest:fetch error:nil];
    for(Employee *e in array)
    {
        
        int a=[_findLabel.text intValue];
        NSInteger value = [e.empid integerValue];
        long b=(NSInteger )value;
        
        if(b==a)
        {
            
            _label1.text=e.empname;
            _label2.text=e.empaddress;
            _label3.text=[NSString stringWithFormat:@"%@",e.empphone];
            
        }
    }
    
}

- (IBAction)updateBtn:(id)sender
{
    
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *appdelegate=(AppDelegate *)application.delegate;
    NSManagedObjectContext *conext=appdelegate.managedObjectContext;
    
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];

    NSArray *array=[conext executeFetchRequest:fetch error:nil];
    
    for(Employee *e in array)
    {
        
        int a=[_findLabel.text intValue];
        NSInteger value = [e.empid integerValue];
        long b=(NSInteger )value;

        if(b==a)
        {
            e.empname=_label1.text;
            e.empaddress=_label2.text;
            e.empphone=[NSNumber numberWithInt:[_label3.text intValue]];
            
            [conext save:nil];
        }
        
    }

}

- (IBAction)deleteBtn:(id)sender
{
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *appdelegate=(AppDelegate *)application.delegate;
    NSManagedObjectContext *conext=appdelegate.managedObjectContext;
    
    
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSArray *array=[conext executeFetchRequest:fetch error:nil];
    
    //NSManagedObjectContext *nm=[array obj]
    
    for(Employee *e in array)
    {
        
        int a=[_findLabel.text intValue];
        NSInteger value = [e.empid integerValue];
        long b=(NSInteger )value;
        
        if(b==a)
        {
            [conext deleteObject:e];
            
            [conext save:nil];
        }
        
    }
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    

}
@end
