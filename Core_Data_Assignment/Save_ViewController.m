//
//  Save_ViewController.m
//  Core_Data_Assignment
//
//  Created by Mac on 17/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "Save_ViewController.h"
#import "AppDelegate.h"
#import "Employee.h"

@interface Save_ViewController ()

@end

@implementation Save_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveBtn:(id)sender
{
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *appdelegate=(AppDelegate *)application.delegate;
    NSManagedObjectContext *conext=appdelegate.managedObjectContext;
    
    
    Employee *e=[NSEntityDescription  insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:conext];
    
    e.empid=[NSNumber numberWithInt:[_empidLabel.text intValue]];
    e.empname=_empNameLabel.text;
    e.empaddress=_empAddLabel.text;
    e.empphone=[NSNumber numberWithInt:[_empPhoneLabel.text intValue]];
    
    
    [conext save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"record inserted");
    

}
@end
