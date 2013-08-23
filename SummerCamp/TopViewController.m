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
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    ud = [NSUserDefaults standardUserDefaults];
    
    isMunepoke = [ud boolForKey:@"mode"];
    timer = [ud integerForKey:@"timer"];
    
    [self setButtonEnabled];
    
    self.timerLabel.text = [NSString stringWithFormat:@"%f",timer];
}

- (void)setButtonEnabled {
    
    // モードを登録
    [ud setBool:isMunepoke forKey:@"mode"];
    [ud synchronize];
    
    self.munepokeButton.enabled = !isMunepoke;
    self.deskButton.enabled = isMunepoke;
    
    self.munepokeButton.alpha = isMunepoke ? 0.0f : 1.0f;
    self.deskButton.alpha = !isMunepoke ? 0.0f : 1.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)munepoke:(id)sender {
    isMunepoke = YES;
    [self setButtonEnabled];
}

- (IBAction)desk:(id)sender {
    isMunepoke = NO;
    [self setButtonEnabled];
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
    
    // Minは0分にする
    if(timer == 0) {
        return;
    }
    
    timer--;
    [self setTimer];
}

- (void)setTimer {
    
    self.timerLabel.text = [NSString stringWithFormat:@"%f",timer];
    
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

@end