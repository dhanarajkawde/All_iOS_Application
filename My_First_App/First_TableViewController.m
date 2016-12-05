//
//  First_TableViewController.m
//  My_First_App
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "First_TableViewController.h"
#import "Second_ViewController.h"
#import "Third_ViewController.h"
#import <sqlite3.h>

@interface First_TableViewController ()

@end

@implementation First_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _tablearray=[[NSMutableArray alloc]init];
    
    
   // [self.tableView registerNib:[UINib nibWithNibName:@"New_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
   }



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_tablearray removeAllObjects];
    
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dbpath=[NSString stringWithFormat:@"%@/MyFirstApp.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    sqlite3_stmt *mystmt;
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        const char * query="select * from To_Do_List";
        
        if(sqlite3_prepare(db, query, -1, &mystmt, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
                
                
                NSString *temp=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,0)];
                
                [_tablearray addObject:temp];
            }
            
            
        }
        else
        {
            NSLog(@"fail to execute query");
        }
        
    }
    
    sqlite3_close(db);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _tablearray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
   cell.textLabel.text=[_tablearray objectAtIndex:indexPath.row];
   
   UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    addBtn.frame=CGRectMake(280, 5.0f, 80.0f, 44.0f);
    
    addBtn.backgroundColor=[UIColor greenColor];
    
    [addBtn setTitle:@"Delete" forState:UIControlStateNormal];
    
   [addBtn addTarget:self action:@selector(deleteRow:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:addBtn];
    
    return cell;
}


-(void)deleteRow:(UIButton *)sender
{
    CGPoint center= sender.center;
    CGPoint rootViewPoint = [sender.superview convertPoint:center toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:rootViewPoint];
    long g= indexPath.row;
    NSLog(@"idex path %ld",g);
    
    NSString *str=[_tablearray objectAtIndex:g];
    NSLog(@"%@",str);
    
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/MyFirstApp.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        
        NSString *query=[NSString stringWithFormat:@"delete from To_Do_List where name=\"%@\"",str];
        
        
        if(sqlite3_exec(db,[query UTF8String],NULL,NULL,NULL)==SQLITE_OK)
        {
            NSLog(@"deleted");
            
            [self.tableView reloadData];
            
            
        }
        else
        {
            NSLog(@"fail to delete");
        }
        
        
    }
    [self.tableView reloadData];

    
    sqlite3_close(db);
    
    [self.tableView reloadData];
    
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _gf=[_tablearray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"fvctotvc" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"fvctotvc"])
    {
       
        Third_ViewController *tc = [segue destinationViewController];
        
        tc.s1=_gf;
    }
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
