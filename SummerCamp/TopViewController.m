//
//  ViewController.m
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/22.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController
{
    BOOL isMunepoke;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    isMunepoke = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)munepoke:(id)sender {
    isMunepoke = YES;
    
    ((UIButton *)sender).enabled = NO;
}

- (IBAction)desk:(id)sender {
    isMunepoke = NO;
    
    ((UIButton *)sender).enabled = NO;
}

- (IBAction)addTime:(id)sender {
    
}

- (IBAction)minusTime:(id)sender {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
