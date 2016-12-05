//
//  ViewController.h
//  Tic_Tac_Toe
//
//  Created by Mac on 28/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{

//IBOutlet UIImage *oimage;
//IBOutlet UIImage *ximage;

IBOutlet UIImageView *s1;
IBOutlet UIImageView *s2;
IBOutlet UIImageView *s3;
IBOutlet UIImageView *s4;
IBOutlet UIImageView *s5;
IBOutlet UIImageView *s6;
IBOutlet UIImageView *s7;
IBOutlet UIImageView *s8;
IBOutlet UIImageView *s9;

UIImage *theImg;

IBOutlet UIButton *resetBtn;

//IBOutlet UIImageView *board;

IBOutlet UILabel *whoseTurn;

NSInteger player,numberOfPlayer;

    BOOL cell;
}
@property(nonatomic,retain)UIImage *ximage,*oimage,*theImg;
@property(nonatomic,retain)UIButton *resetBtn;
@property(nonatomic,retain)UIImageView *board,*s1,*s2,*s3,*s4,*s5,*s6,*s7,*s8,*s9;
@property(nonatomic,retain)UILabel *whoseTurn;

-(void)processlogic;
-(void)updatePlayerinfo;
-(BOOL)CheckForWin;
-(void)displayWinner;
-(void)resetboard;
- (IBAction)resetBtn:(id)sender;
@end

