//
//  GameViewController.h
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/23.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

// タイマー（分）
@property (nonatomic, assign) float time;

// モード（胸ポケ:0,机:1）
@property (nonatomic, assign) int mode;

@end