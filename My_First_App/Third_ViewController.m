//
//  Third_ViewController.m
//  My_First_App
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "Third_ViewController.h"
#import <sqlite3.h>

@interface Third_ViewController ()

@end

@implementation Third_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _thirdTf1.delegate=self;
    _thirdTf2.delegate=self;
    _thirdTf3.delegate=self;
    
   
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/MyFirstApp.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    sqlite3_stmt *mystmt;
    
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        
        NSString *query=[NSString stringWithFormat:@"select * from To_Do_List where name=\"%@\"",_s1];
        
        
        if(sqlite3_prepare(db, [query UTF8String], -1, &mystmt, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
                
                
                NSString *name=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,0)];
                
                NSString *dis=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,1)];
                
                NSString *date=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,2)];
                
                
                _thirdTf1.text=name;
                _thirdTf2.text=dis;
                _thirdTf3.text=date;
                
                
                
            }
            
            
        }
        else
        {
            NSLog(@"fail to execute query");
        }
        
    }
    
    sqlite3_close(db);
    
}




- (IBAction)updateBtn:(id)sender
{
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/MyFirstApp.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        NSString *query=[NSString stringWithFormat:@"update To_Do_List set description=\"%@\",Date=\"%@\"where name=\"%@\"",_thirdTf2.text,_thirdTf3.text,_thirdTf1.text];
        
        if(sqlite3_exec(db,[query UTF8String],NULL,NULL,NULL)==SQLITE_OK)
        {
            NSLog(@"updated");
        }
        else
        {
            NSLog(@"fail to update");
        }
    }
    
    sqlite3_close(db);
    
    [self.navigationController popViewControllerAnimated:YES];


}
@end
