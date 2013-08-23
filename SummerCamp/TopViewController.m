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
    int  timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    isMunepoke = [ud boolForKey:@"mode"];
    timer = [ud integerForKey:@"timer"];
    
    [self setButtonEnabled];
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d",timer];
}

- (void)setButtonEnabled {
    self.munepokeButton.enabled = !isMunepoke;
    self.deskButton.enabled = isMunepoke;
    
    
    self.munepokeButton.alpha = isMunepoke ? 0.0f : 1.0f;
    self.deskButton.alpha = !isMunepoke ? 0.0f : 1.0f;
    
//    self.munepokeButton.titleLabel.textColor = isMunepoke ? [UIColor whiteColor] : [UIColor blackColor];
//    self.deskButton.titleLabel.textColor = isMunepoke ? [UIColor blackColor] : [UIColor whiteColor];
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
    
    if(timer == 30) {
        return;
    }
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d",++timer];
}

- (IBAction)minusTime:(id)sender {
    
    if(timer == 0) {
        return;
    }

    self.timerLabel.text = [NSString stringWithFormat:@"%d",--timer];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    TimerViewController * controller = [segue destinationViewController];
    controller.mode = isMunepoke;
    controller.time = timer;
}

@end
