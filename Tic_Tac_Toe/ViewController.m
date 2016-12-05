//
//  ViewController.m
//  Tic_Tac_Toe
//
//  Created by Mac on 28/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize s1,s2,s3,s4,s5,s6,s7,s8,s9,oimage,ximage,theImg,whoseTurn,board,resetBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    oimage=[UIImage imageNamed:@"circle.png"];
    ximage=[UIImage imageNamed:@"cross.png"];
    
    player=1;
    
    numberOfPlayer=0;
    
    whoseTurn.text=@"x can go";
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    switch(player)
    {
      case 1:
            theImg=ximage;
            break;
      case 2:
            theImg=oimage;
            break;
    }
    
    UITouch *touch=[[event allTouches]anyObject];
    cell=NO;
    
    if(CGRectContainsPoint([s1 frame], [touch locationInView:self.view])&(s1.image == NULL))
    {
        cell=YES;
        s1.image=theImg;
    }
    if(CGRectContainsPoint([s2 frame], [touch locationInView:self.view])&(s2.image == NULL))
    {
        cell=YES;
        s2.image=theImg;
    }
    if(CGRectContainsPoint([s3 frame], [touch locationInView:self.view])&(s3.image == NULL))
    {
        cell=YES;
        s3.image=theImg;
    }
    if(CGRectContainsPoint([s4 frame], [touch locationInView:self.view])&(s4.image == NULL))
    {
        cell=YES;
        s4.image=theImg;
    }
    if(CGRectContainsPoint([s5 frame], [touch locationInView:self.view])&(s5.image == NULL))
    {
        cell=YES;
        s5.image=theImg;
    }
    if(CGRectContainsPoint([s6 frame], [touch locationInView:self.view])&(s6.image == NULL))
    {
        cell=YES;
        s6.image=theImg;
    }
    if(CGRectContainsPoint([s7 frame], [touch locationInView:self.view])&(s7.image == NULL))
    {
        cell=YES;
        s7.image=theImg;
    }
    if(CGRectContainsPoint([s8 frame], [touch locationInView:self.view])&(s8.image == NULL))
    {
        cell=YES;
        s8.image=theImg;
    }
    if(CGRectContainsPoint([s9 frame], [touch locationInView:self.view])&(s9.image == NULL))
    {
        cell=YES;
        s9.image=theImg;
    }
    [self processlogic];
    
    if(cell)
    {
        [self updatePlayerinfo];
    }
}

-(void)processlogic
{
    if([self CheckForWin])
    {
        if(player==1)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Winner!!!" message:@"x won" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        else if(player==2)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Winner!!!" message:@"o won" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        if(numberOfPlayer==9)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"No Winner!!!" message:@"Sorry Play Again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
            [self resetboard];
        }
    }
}

-(BOOL)CheckForWin
{
    //horizontal
    if((s1.image==s2.image)&(s2.image==s3.image)&(s1.image!=NULL))
    {
        return YES;
    }
    if((s4.image==s5.image)&(s5.image==s6.image)&(s4.image!=NULL))
    {
        return YES;
    }
    if((s7.image==s8.image)&(s8.image==s9.image)&(s7.image!=NULL))
    {
        return YES;
    }
    
    //vertical
    if((s1.image==s4.image)&(s4.image==s7.image)&(s1.image!=NULL))
    {
        return YES;
    }
    if((s2.image==s5.image)&(s5.image==s8.image)&(s2.image!=NULL))
    {
        return YES;
    }
    if((s3.image==s6.image)&(s6.image==s9.image)&(s3.image!=NULL))
    {
        return YES;
    }
    
    //diagonal
    if((s1.image==s5.image)&(s5.image==s9.image)&(s1.image!=NULL))
    {
        return YES;
    }if((s3.image==s5.image)&(s5.image==s7.image)&(s3.image!=NULL))
    {
        return YES;
    }
    
    return NO;
}

-(void)displayWinner
{
    if([self CheckForWin]==YES)
    {
        if(player==1)
        {
            whoseTurn.text=@"x is the Winner!!!";
        }
        else
        {
            whoseTurn.text=@"o is the Winner!!!";
        }
    }
}

- (IBAction)resetBtn:(id)sender
{
    [self resetboard];
    
}

-(void)resetboard
{
    s1.image=NULL;
    s2.image=NULL;
    s3.image=NULL;
    s4.image=NULL;
    s5.image=NULL;
    s6.image=NULL;
    s7.image=NULL;
    s8.image=NULL;
    s9.image=NULL;
    
    player=1;
    
    whoseTurn.text=@"x can go";
    
    numberOfPlayer=0;
}

-(void)updatePlayerinfo
{
    numberOfPlayer++;
    
    if(numberOfPlayer==9)
    {
        [self resetboard];
    }
    if(player==1)
    {
        player=2;
        whoseTurn.text=@"o can go";
    }
    else
    {
        player=1;
        whoseTurn.text=@"x can go";
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
