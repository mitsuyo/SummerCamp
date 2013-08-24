//
//  ViewController.h
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/22.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (weak, nonatomic) IBOutlet UIButton *munepokeButton;
@property (weak, nonatomic) IBOutlet UIButton *deskButton;

- (IBAction)munepoke:(id)sender;
- (IBAction)desk:(id)sender;
- (IBAction)addTime:(id)sender;
- (IBAction)minusTime:(id)sender;


//デフォルトの背景
@property (weak, nonatomic) IBOutlet UIImageView *backDef01;
@property (weak, nonatomic) IBOutlet UIImageView *backDef02;
@property (weak, nonatomic) IBOutlet UIImageView *backDef03;
@property (weak, nonatomic) IBOutlet UIImageView *backDef04;
@property (weak, nonatomic) IBOutlet UIImageView *backDef05;
@property (weak, nonatomic) IBOutlet UIImageView *backDef06;
@property (weak, nonatomic) IBOutlet UIImageView *backDef07;

//ポケットの背景
@property (weak, nonatomic) IBOutlet UIImageView *backPoke01;
@property (weak, nonatomic) IBOutlet UIImageView *backPoke02;
@property (weak, nonatomic) IBOutlet UIImageView *backPoke03;
@property (weak, nonatomic) IBOutlet UIImageView *backPoke04;
@property (weak, nonatomic) IBOutlet UIImageView *backPoke05;
@property (weak, nonatomic) IBOutlet UIImageView *backPoke06;
@property (weak, nonatomic) IBOutlet UIImageView *backPoke07;

//机の背景
@property (weak, nonatomic) IBOutlet UIImageView *backDesk01;
@property (weak, nonatomic) IBOutlet UIImageView *backDesk02;
@property (weak, nonatomic) IBOutlet UIImageView *backDesk03;
@property (weak, nonatomic) IBOutlet UIImageView *backDesk04;
@property (weak, nonatomic) IBOutlet UIImageView *backDesk05;
@property (weak, nonatomic) IBOutlet UIImageView *backDesk06;
@property (weak, nonatomic) IBOutlet UIImageView *backDesk07;


@end
