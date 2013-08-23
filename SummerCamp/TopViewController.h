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


- (IBAction)munepoke:(id)sender;
- (IBAction)desk:(id)sender;
- (IBAction)addTime:(id)sender;
- (IBAction)minusTime:(id)sender;

@end
