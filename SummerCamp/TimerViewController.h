//
//  GameViewController.h
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/23.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

// タイマー（秒）
@property (nonatomic, assign) float time;

// モード（胸ポケ:0,机:1）
@property (nonatomic, assign) int mode;

// 時間表示ラベル
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

// 起きてる！ボタン
@property (weak, nonatomic) IBOutlet UIButton *wakeButton;

- (IBAction)wakeUp:(id)sender;
//せり上がってくるview
@property (weak, nonatomic) IBOutlet UIView *secondGameView;
- (IBAction)tapNumberButton:(id)sender;
//問題ラベル
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *questionLabels;
//答えラベル
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *answerLabels;
@property (weak, nonatomic) IBOutlet UILabel *judgeTextLabel;

@end
