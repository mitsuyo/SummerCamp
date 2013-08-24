//
//  ViewController.m
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/22.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import "TopViewController.h"
#import "TimerViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController
{
    BOOL isMunepoke;
    float timer;
    
    NSUserDefaults *ud;
    
    int backgroundFlag;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    ud = [NSUserDefaults standardUserDefaults];
    
    isMunepoke = [ud boolForKey:@"mode"];
    timer = [ud integerForKey:@"timer"];
    
    [self setButtonEnabled];
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d分",(int)timer];
    
    backgroundFlag = 0;
     [self backGroundSet]; //背景セットへ
    
}

- (void)setButtonEnabled {
    
    // モードを登録
    [ud setBool:isMunepoke forKey:@"mode"];
    [ud synchronize];
    
//    self.munepokeButton.enabled = !isMunepoke;
//    self.deskButton.enabled = isMunepoke;
//    
//    self.munepokeButton.alpha = isMunepoke ? 0.0f : 1.0f;
//    self.deskButton.alpha = !isMunepoke ? 0.0f : 1.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)addTime:(id)sender {
    
    // とりあえず、Maxは30分にする
    if(timer == 30) {
        return;
    }
   
    timer++;
    [self setTimer];
}

- (IBAction)minusTime:(id)sender {
    
    // Minは3分にする
    if(timer == 3) {
        return;
    }
    
    timer--;
    [self setTimer];
}

- (void)setTimer {
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d分",(int)timer];
    
    // モードを登録
    [ud setInteger:timer forKey:@"timer"];
    [ud synchronize];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    TimerViewController * controller = [segue destinationViewController];
    controller.mode = isMunepoke;
    
    // 分を秒に変換
    controller.time = timer * 60;
}

- (IBAction)back:(UIStoryboardSegue *)sender
{
}

//胸ポケ押した。
- (IBAction)munepoke:(id)sender {
    isMunepoke = YES;
    [self setButtonEnabled];
    backgroundFlag = 1;
    [self backGroundSet]; //背景セットへ
}

//机モード押した。
- (IBAction)desk:(id)sender {
    isMunepoke = NO;
    [self setButtonEnabled];
    backgroundFlag = 2;
    [self backGroundSet]; //背景セットへ
}

-(void)backGroundSet{
    
    switch (backgroundFlag) {
        case 0:
            self.backDef01.frame = CGRectMake(self.backDef01.frame.origin.x, self.backDef01.frame.origin.y, self.backDef01.frame.size.width, self.backDef01.frame.size.height);
            self.backDef02.frame = CGRectMake(self.backDef02.frame.origin.x, self.backDef02.frame.origin.y, self.backDef02.frame.size.width, self.backDef02.frame.size.height);
            self.backDef03.frame = CGRectMake(self.backDef03.frame.origin.x, self.backDef03.frame.origin.y, self.backDef03.frame.size.width, self.backDef03.frame.size.height);
            self.backDef04.frame = CGRectMake(self.backDef04.frame.origin.x, self.backDef04.frame.origin.y, self.backDef04.frame.size.width, self.backDef04.frame.size.height);
            self.backDef05.frame = CGRectMake(self.backDef05.frame.origin.x, self.backDef05.frame.origin.y, self.backDef05.frame.size.width, self.backDef05.frame.size.height);
            self.backDef06.frame = CGRectMake(self.backDef06.frame.origin.x, self.backDef06.frame.origin.y, self.backDef06.frame.size.width, self.backDef06.frame.size.height);
            self.backDef07.frame = CGRectMake(self.backDef07.frame.origin.x, self.backDef07.frame.origin.y, self.backDef07.frame.size.width, self.backDef07.frame.size.height);
            break;
            
        case 1:
            self.backPoke01.frame = CGRectMake(-320, self.backPoke01.frame.origin.y, self.backPoke01.frame.size.width, self.backPoke01.frame.size.height);
            self.backPoke02.frame = CGRectMake(320, self.backPoke02.frame.origin.y, self.backPoke02.frame.size.width, self.backPoke02.frame.size.height);
            self.backPoke03.frame = CGRectMake(-320, self.backPoke03.frame.origin.y, self.backPoke03.frame.size.width, self.backPoke03.frame.size.height);
            self.backPoke04.frame = CGRectMake(320, self.backPoke04.frame.origin.y, self.backPoke04.frame.size.width, self.backPoke04.frame.size.height);
            self.backPoke05.frame = CGRectMake(-320, self.backPoke05.frame.origin.y, self.backPoke05.frame.size.width, self.backPoke05.frame.size.height);
            self.backPoke06.frame = CGRectMake(320, self.backPoke06.frame.origin.y, self.backPoke06.frame.size.width, self.backPoke06.frame.size.height);
            self.backPoke07.frame = CGRectMake(-320, self.backPoke07.frame.origin.y, self.backPoke07.frame.size.width, self.backPoke07.frame.size.height);
            
            self.backDef01.frame = CGRectMake(320, self.backDef01.frame.origin.y, self.backDef01.frame.size.width, self.backDef01.frame.size.height);
            self.backDef02.frame = CGRectMake(-320, self.backDef02.frame.origin.y, self.backDef02.frame.size.width, self.backDef02.frame.size.height);
            self.backDef03.frame = CGRectMake(320, self.backDef03.frame.origin.y, self.backDef03.frame.size.width, self.backDef03.frame.size.height);
            self.backDef04.frame = CGRectMake(-320, self.backDef04.frame.origin.y, self.backDef04.frame.size.width, self.backDef04.frame.size.height);
            self.backDef05.frame = CGRectMake(320, self.backDef05.frame.origin.y, self.backDef05.frame.size.width, self.backDef05.frame.size.height);
            self.backDef06.frame = CGRectMake(-320, self.backDef06.frame.origin.y, self.backDef06.frame.size.width, self.backDef06.frame.size.height);
            self.backDef07.frame = CGRectMake(320, self.backDef07.frame.origin.y, self.backDef07.frame.size.width, self.backDef07.frame.size.height);
            
            self.backDesk01.frame = CGRectMake(-320, self.backPoke01.frame.origin.y, self.backPoke01.frame.size.width, self.backPoke01.frame.size.height);
            self.backDesk02.frame = CGRectMake(320, self.backPoke02.frame.origin.y, self.backPoke02.frame.size.width, self.backPoke02.frame.size.height);
            self.backDesk03.frame = CGRectMake(-320, self.backPoke03.frame.origin.y, self.backPoke03.frame.size.width, self.backPoke03.frame.size.height);
            self.backDesk04.frame = CGRectMake(320, self.backPoke04.frame.origin.y, self.backPoke04.frame.size.width, self.backPoke04.frame.size.height);
            self.backDesk05.frame = CGRectMake(-320, self.backPoke05.frame.origin.y, self.backPoke05.frame.size.width, self.backPoke05.frame.size.height);
            self.backDesk06.frame = CGRectMake(320, self.backPoke06.frame.origin.y, self.backPoke06.frame.size.width, self.backPoke06.frame.size.height);
            self.backDesk07.frame = CGRectMake(-320, self.backPoke07.frame.origin.y, self.backPoke07.frame.size.width, self.backPoke07.frame.size.height);
            //ウィンドウ右にアニメーションして移動
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            self.backPoke01.frame = CGRectMake(0, self.backPoke01.frame.origin.y, self.backPoke01.frame.size.width, self.backPoke01.frame.size.height);
            self.backPoke02.frame = CGRectMake(0, self.backPoke02.frame.origin.y, self.backPoke02.frame.size.width, self.backPoke02.frame.size.height);
            self.backPoke03.frame = CGRectMake(0, self.backPoke03.frame.origin.y, self.backPoke03.frame.size.width, self.backPoke03.frame.size.height);
            self.backPoke04.frame = CGRectMake(0, self.backPoke04.frame.origin.y, self.backPoke04.frame.size.width, self.backPoke04.frame.size.height);
            self.backPoke05.frame = CGRectMake(0, self.backPoke05.frame.origin.y, self.backPoke05.frame.size.width, self.backPoke05.frame.size.height);
            self.backPoke06.frame = CGRectMake(0, self.backPoke06.frame.origin.y, self.backPoke06.frame.size.width, self.backPoke06.frame.size.height);
            self.backPoke07.frame = CGRectMake(0, self.backPoke07.frame.origin.y, self.backPoke07.frame.size.width, self.backPoke07.frame.size.height);
            
            [UIView commitAnimations];
            break;
            
        case 2:
            
            self.backDesk01.frame = CGRectMake(-320, self.backPoke01.frame.origin.y, self.backPoke01.frame.size.width, self.backPoke01.frame.size.height);
            self.backDesk02.frame = CGRectMake(320, self.backPoke02.frame.origin.y, self.backPoke02.frame.size.width, self.backPoke02.frame.size.height);
            self.backDesk03.frame = CGRectMake(-320, self.backPoke03.frame.origin.y, self.backPoke03.frame.size.width, self.backPoke03.frame.size.height);
            self.backDesk04.frame = CGRectMake(320, self.backPoke04.frame.origin.y, self.backPoke04.frame.size.width, self.backPoke04.frame.size.height);
            self.backDesk05.frame = CGRectMake(-320, self.backPoke05.frame.origin.y, self.backPoke05.frame.size.width, self.backPoke05.frame.size.height);
            self.backDesk06.frame = CGRectMake(320, self.backPoke06.frame.origin.y, self.backPoke06.frame.size.width, self.backPoke06.frame.size.height);
            self.backDesk07.frame = CGRectMake(-320, self.backPoke07.frame.origin.y, self.backPoke07.frame.size.width, self.backPoke07.frame.size.height);
            
            self.backDef01.frame = CGRectMake(320, self.backDef01.frame.origin.y, self.backDef01.frame.size.width, self.backDef01.frame.size.height);
            self.backDef02.frame = CGRectMake(-320, self.backDef02.frame.origin.y, self.backDef02.frame.size.width, self.backDef02.frame.size.height);
            self.backDef03.frame = CGRectMake(320, self.backDef03.frame.origin.y, self.backDef03.frame.size.width, self.backDef03.frame.size.height);
            self.backDef04.frame = CGRectMake(-320, self.backDef04.frame.origin.y, self.backDef04.frame.size.width, self.backDef04.frame.size.height);
            self.backDef05.frame = CGRectMake(320, self.backDef05.frame.origin.y, self.backDef05.frame.size.width, self.backDef05.frame.size.height);
            self.backDef06.frame = CGRectMake(-320, self.backDef06.frame.origin.y, self.backDef06.frame.size.width, self.backDef06.frame.size.height);
            self.backDef07.frame = CGRectMake(320, self.backDef07.frame.origin.y, self.backDef07.frame.size.width, self.backDef07.frame.size.height);
            
            self.backPoke01.frame = CGRectMake(-320, self.backPoke01.frame.origin.y, self.backPoke01.frame.size.width, self.backPoke01.frame.size.height);
            self.backPoke02.frame = CGRectMake(320, self.backPoke02.frame.origin.y, self.backPoke02.frame.size.width, self.backPoke02.frame.size.height);
            self.backPoke03.frame = CGRectMake(-320, self.backPoke03.frame.origin.y, self.backPoke03.frame.size.width, self.backPoke03.frame.size.height);
            self.backPoke04.frame = CGRectMake(320, self.backPoke04.frame.origin.y, self.backPoke04.frame.size.width, self.backPoke04.frame.size.height);
            self.backPoke05.frame = CGRectMake(-320, self.backPoke05.frame.origin.y, self.backPoke05.frame.size.width, self.backPoke05.frame.size.height);
            self.backPoke06.frame = CGRectMake(320, self.backPoke06.frame.origin.y, self.backPoke06.frame.size.width, self.backPoke06.frame.size.height);
            self.backPoke07.frame = CGRectMake(-320, self.backPoke07.frame.origin.y, self.backPoke07.frame.size.width, self.backPoke07.frame.size.height);
            
            //ウィンドウ右にアニメーションして移動
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            
            self.backDesk01.frame = CGRectMake(0, self.backPoke01.frame.origin.y, self.backPoke01.frame.size.width, self.backPoke01.frame.size.height);
            self.backDesk02.frame = CGRectMake(0, self.backPoke02.frame.origin.y, self.backPoke02.frame.size.width, self.backPoke02.frame.size.height);
            self.backDesk03.frame = CGRectMake(0, self.backPoke03.frame.origin.y, self.backPoke03.frame.size.width, self.backPoke03.frame.size.height);
            self.backDesk04.frame = CGRectMake(0, self.backPoke04.frame.origin.y, self.backPoke04.frame.size.width, self.backPoke04.frame.size.height);
            self.backDesk05.frame = CGRectMake(0, self.backPoke05.frame.origin.y, self.backPoke05.frame.size.width, self.backPoke05.frame.size.height);
            self.backDesk06.frame = CGRectMake(0, self.backPoke06.frame.origin.y, self.backPoke06.frame.size.width, self.backPoke06.frame.size.height);
            self.backDesk07.frame = CGRectMake(0, self.backPoke07.frame.origin.y, self.backPoke07.frame.size.width, self.backPoke07.frame.size.height);
            [UIView commitAnimations];
            break;
    }
    
}



@end