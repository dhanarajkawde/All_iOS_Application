//
//  ViewController.m
//  EmployeeDetail
//
//  Created by Student-004 on 06/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import "ViewController.h"
#import "Employee.h"
#import "EmployeeTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _emparray=[[NSMutableArray alloc]init];
    
    Employee *e1=[[Employee alloc]init];
    e1.empname=@"Akshay";
    e1.empdesig=@"B.E.";
    e1.empsal=@"5000";
    e1.empdept=@"Computer";
    e1.empimg=@"1";
    
    Employee *e2=[[Employee alloc]init];
    e2.empname=@"Rohit";
    e2.empdesig=@"B.E.";
    e2.empsal=@"7400";
    e2.empdept=@"E&TC";
    e2.empimg=@"2";

    Employee *e3=[[Employee alloc]init];
    e3.empname=@"Kunal";
    e3.empdesig=@"B.E.";
    e3.empsal=@"6000";
    e3.empdept=@"Mechanical";
    e3.empimg=@"3";

    [_emparray addObject:e1];
    [_emparray addObject:e2];
    [_emparray addObject:e3];
    
    [self.emptable registerNib:[UINib nibWithNibName:@"EmployeeTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _emparray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmployeeTableViewCell *cell=[_emptable dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Employee *temp=[_emparray objectAtIndex:indexPath.row];
    cell.lbl1.text=temp.empname;
    cell.lbl2.text=temp.empdesig;
    cell.lbl3.text=temp.empsal;
    cell.lbl4.text=temp.empdept;
    cell.imageView.image=[UIImage imageNamed:temp.empimg];
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1:(id)sender
{
    NSSortDescriptor *sorter=[NSSortDescriptor sortDescriptorWithKey:@"empname" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSArray *sortdescriptors=[_emparray sortedArrayUsingDescriptors:@[sorter]];
    
    _emparray=[[NSMutableArray alloc]initWithArray:sortdescriptors];
    
    [self.emptable reloadData];
    
    
    
    
}

- (IBAction)btn2:(id)sender {
    
    NSSortDescriptor *sorter=[NSSortDescriptor sortDescriptorWithKey:@"empdesig" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSArray *sortdescriptors=[_emparray sortedArrayUsingDescriptors:@[sorter]];
    
    _emparray=[[NSMutableArray alloc]initWithArray:sortdescriptors];
    
    [self.emptable reloadData];
    
    
}

- (IBAction)btn3:(id)sender
{
    
    NSSortDescriptor *sorter=[NSSortDescriptor sortDescriptorWithKey:@"empsal" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSArray *sortdescriptors=[_emparray sortedArrayUsingDescriptors:@[sorter]];
    
    _emparray=[[NSMutableArray alloc]initWithArray:sortdescriptors];
    
    [self.emptable reloadData];
    
    
    
}
@end
