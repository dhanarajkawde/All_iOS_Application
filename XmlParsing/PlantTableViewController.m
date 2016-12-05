//
//  PlantTableViewController.m
//  XmlParsing
//
//  Created by Student-002 on 07/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "PlantTableViewController.h"
#import "TableViewCell.h"
#import "Plant.h"

@interface PlantTableViewController ()

@end

@implementation PlantTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _plantarray=[[NSMutableArray alloc]init];
    
    NSString *str=@"http://www.w3schools.com/xml/plant_catalog.xml";
    NSURL *url=[NSURL URLWithString:str];
    _parsing=[[NSXMLParser alloc]initWithContentsOfURL:url];
    _parsing.delegate=self;
    [_parsing parse];
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    if([elementName isEqualToString:@"PLANT"])
    {
        _p=[[Plant alloc]init];
    }
    if([elementName isEqualToString:@"COMMON"])
    {
        _str=[[NSMutableString alloc]init];
    }
    if([elementName isEqualToString:@"BOTANICAL"])
    {
        _str=[[NSMutableString alloc]init];
    }
    if([elementName isEqualToString:@"ZONE"])
    {
       _str=[[NSMutableString alloc]init];
    }
    if([elementName isEqualToString:@"LIGHT"])
    {
       _str=[[NSMutableString alloc]init];
    }
    if([elementName isEqualToString:@"PRICE"])
    {
        
        _str=[[NSMutableString alloc]init];
    }

}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [_str appendString:string];
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if([elementName isEqualToString:@"COMMON"])
    {
        _p.common=_str;
        
    }
    if([elementName isEqualToString:@"BOTANICAL"])
    {
        _p.botanical=_str;

    }
    if([elementName isEqualToString:@"ZONE"])
    {
        _p.zone=_str;
    }
    if([elementName isEqualToString:@"LIGHT"])
    {
      _p.light=_str;
    }
    if([elementName isEqualToString:@"PRICE"])
    {
        _p.price=_str;
    }
    if([elementName isEqualToString:@"AVAILABILITY"])
    {
    _p.avaibility=_str;
    }
    if([elementName isEqualToString:@"PLANT"])
    {
        [_plantarray addObject:_p];
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
    return  _plantarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
      TableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    Plant *temp=[_plantarray objectAtIndex:indexPath.row];
    
    cell.COMMON.text=temp.common;
    cell.BOTANICAL.text=temp.botanical;
    cell.zonelabel.text=temp.zone;
    cell.pricelabel.text=temp.price;
    cell.lightLabel.text=temp.light;
    cell.avaibility.text=temp.avaibility;

    
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
