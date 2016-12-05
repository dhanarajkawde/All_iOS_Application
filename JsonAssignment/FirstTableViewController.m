//
//  FirstTableViewController.m
//  JsonAssignment
//
//  Created by Student-004 on 09/11/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array1=[[NSMutableArray alloc]init];
    _array2=[[NSMutableArray alloc]init];
    _mydata=[[NSMutableData alloc]init];
    
    NSString *str=@"https://api.github.com/repositories/19438/commits";
    NSURL *url=[NSURL URLWithString:str];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    [_mydata setLength:0];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mydata appendData:data];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
 
    
   NSArray *outerarray= [NSJSONSerialization JSONObjectWithData:_mydata options:NSJSONReadingAllowFragments error:nil];
    
    
    for(NSDictionary *temp in outerarray)
    {
    
    NSDictionary *innerdic1=[temp objectForKey:@"commit"];
    NSDictionary *innerdic2=[innerdic1 objectForKey:@"author"];
    NSDictionary *innerdic21=[innerdic1 objectForKey:@"tree"];
        
        
    NSString *str1=[innerdic2 objectForKey:@"name"];
    NSString *str2=[innerdic21 objectForKey:@"sha"];
    
    
    [_array1 addObject:str1];
    [_array2 addObject:str2];
    
    }
    
    [self.tableView reloadData];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _array1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text=[_array1 objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[_array2 objectAtIndex:indexPath.row];
    
    cell.textLabel.numberOfLines=4;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100;
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
