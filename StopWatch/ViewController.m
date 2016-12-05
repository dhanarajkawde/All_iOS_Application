//
//  ViewController.m
//  StopWatch
//
//  Created by Felix-ITS 012 on 15/11/16.
//  Copyright © 2016 Felix-Harish. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _array=[[NSMutableArray alloc]init];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender
{
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:1/5 target:self selector:@selector(TimerStart) userInfo:nil repeats:YES];
}

-(void)TimerStart
{
    
    _start.enabled=NO;
    a+=1;
    _label3.text=[NSString stringWithFormat:@"%d",a];
    
    if(a>=60)
    {
        b+=1;
        a=0;
        
        _label2.text=[NSString stringWithFormat:@"%d",b];
    }
    if(b>60)
    {
        c+=1;
        b=0;
        _label.text=[NSString stringWithFormat:@"%d",c];
    }
    
    
}

- (IBAction)Stop:(id)sender
{
    
    [_timer invalidate];
    
    
    NSMutableString *str=[[NSMutableString alloc]init];
    
    [str appendString:_label.text];
    [str appendString:@" Hours  "];
    [str appendString:_label2.text];
    [str appendString:@" Minutes  "];
    [str appendString:_label3.text];
    [str appendString:@" Seconds"];
    
    [_array insertObject:str atIndex:0];
    
    a=0;
    b=0;
    c=0;
    _label.text=@"00.";
    _label2.text=@"00.";
    _label3.text=@"00";
    
    _start.enabled=YES;
    
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    
    cell.textLabel.text=[_array objectAtIndex:indexPath.row];
 
    return cell;
}











@end
