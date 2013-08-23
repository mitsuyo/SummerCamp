//
//  GameViewController.m
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/23.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController
{
    NSString *timeText;
    NSTimer *tm;
    int timeSecond;
    int timeMinute;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    timeText = [NSString stringWithFormat:@"%f", self.time];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.time = 10.0f;
    self.timeLabel.text = timeText;

    tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerCountDown:) userInfo:nil repeats:YES];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timerCountDown:(NSTimer*)timer
{
    self.time -= 1.0f;
    
    timeMinute = (int) self.time / 60;
    timeSecond = (int) self.time - timeMinute;

    
    if(self.time == 0.0f)
    {
        [tm invalidate];
    }

}

- (IBAction)wakeUp:(id)sender
{
    [tm invalidate];

}

@end
