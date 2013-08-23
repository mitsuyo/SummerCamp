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
    int timeSecond;
    int timeMinute;
    NSTimer *tm;
    float realTime;
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

//    realTime = self.time;
    realTime = 70;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    timeMinute = (int) realTime / 60;
    timeSecond = (int) realTime - timeMinute * 60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d : %02d", timeMinute, timeSecond];

    tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerCountDown:) userInfo:nil repeats:YES];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timerCountDown:(NSTimer*)timer
{
    realTime -= 1.0f;
    timeMinute = (int) realTime / 60;
    timeSecond = (int) realTime - timeMinute * 60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d : %02d", timeMinute, timeSecond];

    if(realTime == 0.0f)
    {
        [tm invalidate];
        realTime = self.time;
    }

    if(realTime < 60.0f)
    {
        if((int)realTime % 2 == 0)
        {
            self.view.backgroundColor = [UIColor yellowColor];
        }else{
            self.view.backgroundColor = [UIColor blackColor];
        }
    }

}

- (IBAction)wakeUp:(id)sender
{
    realTime = self.time + 1;
}

@end
