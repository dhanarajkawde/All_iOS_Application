//
//  Employee_TableViewController.m
//  Core_Data_Assignment
//
//  Created by Mac on 17/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "Employee_TableViewController.h"
#import "AppDelegate.h"
#import "Employee.h"
#import "Update_ViewController.h"

@interface Employee_TableViewController ()

@end

@implementation Employee_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _emparray=[[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animate
{
    [_emparray removeAllObjects];
    
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *appdelegate=(AppDelegate *)application.delegate;
    NSManagedObjectContext *conext=appdelegate.managedObjectContext;
    
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSArray *array=[conext executeFetchRequest:fetch error:nil];
    
    for(Employee *e in array)
    {
        [_emparray addObject:e.empname];
    }
    
    [self.tableView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _emparray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text=[_emparray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Update_ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"Update_ViewController"];
    [self.navigationController pushViewController:v animated:YES];
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
