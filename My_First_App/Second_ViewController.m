//
//  Second_ViewController.m
//  My_First_App
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "Second_ViewController.h"
#import "First_TableViewController.h"
#import <sqlite3.h>

@interface Second_ViewController ()

@end

@implementation Second_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _nameTf.delegate=self;
    _descriptionTf.delegate=self;
    _dateTf.delegate=self;

    
    
    
    
    _datepicker.datePickerMode=UIDatePickerModeDate;
    
    [_datepicker addTarget:self action:@selector(dateselected) forControlEvents:UIControlEventValueChanged];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (IBAction)dateselectedr:(id)sender {
-(void)dateselected
{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"dd-MM-YYYY"];
    
    NSString *output= [format stringFromDate:_datepicker.date];
    
    _dateTf.text=output;
    
    
    NSLog(@"%@",output);
    
}

- (IBAction)saveBtn:(id)sender
{
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/MyFirstApp.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        
        NSString *insertquery=[NSString stringWithFormat:@"insert into To_Do_List values(\"%@\",\"%@\",\"%@\")",_nameTf.text,_descriptionTf.text,_dateTf.text];
        
        NSLog(@"%@",insertquery);
        
        if(sqlite3_exec(db,[insertquery UTF8String],NULL,NULL,NULL)==SQLITE_OK)
        {
            NSLog(@"record inserted");
        }
        else
        {
            NSLog(@"fail to insert record");
        }
        
    }
    
    
    sqlite3_close(db);
    
   
    
    [self.navigationController popViewControllerAnimated:YES];
    

}
@end
