//
//  TableViewController.m
//  WhetherApp
//
//  Created by Student-004 on 28/11/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "whether.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _whetherarray=[[NSMutableArray alloc]init];
    
    

    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.forecast.io/forecast/2a7039e0cc713983c055cb9c8882d249/18.510567,73.817648"]];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
   {
       NSDictionary *outerdic= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
      NSDictionary *hourdic=[outerdic objectForKey:@"hourly"];
      NSArray *dataarray=[hourdic objectForKey:@"data"];
       for(NSDictionary *temp in dataarray)
       {
           NSString *str1=[temp objectForKey:@"summary"];
           NSString *str2=[[temp objectForKey:@"temperature"]description];
           NSString *str3=[[temp objectForKey:@"humidity"]description];
           NSString *str4=[[temp objectForKey:@"windSpeed"]description];
           NSString *str5=[[temp objectForKey:@"time"]description];
           double time=[[temp valueForKey:str5]doubleValue];
           NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
           NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
           [formatter setDateFormat:@"hh:mm aa"];
          NSString *tstr= [formatter dateFromString:str5];
           
           
           whether *wh=[[whether alloc]init];
           
           wh.summarystr=str1;
           wh.mintempstr=str2;
           wh.maxtempstr=tstr;
           wh.windstr=str4;
           wh.humiditystr=str3;
           
           [_whetherarray addObject:wh];
           
       }
       
       [self.tableView reloadData];
    }];
    
   
    [task resume];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _whetherarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    whether *temp=[_whetherarray objectAtIndex:indexPath.row];
    
    cell.summarylabel.text=temp.summarystr;
    cell.mintemplabel.text=temp.mintempstr;
    cell.maxtemplabel.text=temp.maxtempstr;
    cell.humiditylabel.text=temp.humiditystr;
    cell.windspeedlabel.text=temp.windstr;
    
    
    
    return cell;
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
