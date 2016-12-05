//
//  CalculateViewController.m
//  Application 1&2
//
//  Created by Mac on 25/09/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "CalculateViewController.h"

@interface CalculateViewController ()

@end

@implementation CalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _tf1=[[UITextField alloc]initWithFrame:CGRectMake(10, 40, 100, 50)];
    _tf1.borderStyle=UITextBorderStyleBezel;
    _tf1.keyboardType=UIKeyboardTypeAlphabet;
    _tf1.delegate=self;
    
    [self.view addSubview:_tf1];
    
    _tf2=[[UITextField alloc]initWithFrame:CGRectMake(120, 40, 100, 50)];
    _tf2.borderStyle=UITextBorderStyleBezel;
    _tf2.keyboardType=UIKeyboardTypeAlphabet;
    _tf2.delegate=self;
    
    [self.view addSubview:_tf2];
    
    _btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame=CGRectMake(230, 40, 80, 50);
    [_btn setTitle:@"Calculate" forState:UIControlStateNormal];
    [_btn setTitle:@"Selected" forState:UIControlStateHighlighted];
    
    [_btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _table=[[UITableView alloc]initWithFrame:CGRectMake(10, 80, 300, 300) style:UITableViewStyleGrouped];
    _table.delegate=self;
    _table.dataSource=self;
    [self.view addSubview:_table];
    
   _nsarray=[[NSMutableArray alloc]init];
    
    
  
    
    
}

-(void)btnclick
{
    [_nsarray removeAllObjects];
    
    i=[_tf1.text intValue];
    j=[_tf2.text intValue];
    
    for (k=1; k<=j; k++)
    {
        l=i*k;
        
        NSString *item= [NSString stringWithFormat:@"%d  *  %d=%d",i,k,l];
        [_nsarray addObject:item];
        
    }
    [self.table reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return j;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //NSMutableArray *ns=[[NSMutableArray alloc]init];
    NSString *item=_nsarray[indexPath.row];
    
    cell.textLabel.text=item;
    
    return cell;
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

@end
