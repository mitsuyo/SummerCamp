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
    
    //ゲームのクリックされた回数をカウントする。
    int count;
    //ゲームの正解か不正解かをジャッジする。
    BOOL judgeFlag;
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

    //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■　ここからゲームview
    count = 0;
    judgeFlag = YES;
    self.judgeTextLabel.hidden = YES;
    self.secondGameView.frame = CGRectMake(0, 460, 320, 460);
    self.secondGameView.alpha = 0.0;
    _answerLabels = [_answerLabels sortedArrayUsingComparator:^(UILabel *item1,UILabel *item2) {
        return item1.tag - item2.tag;
    }];
    _questionLabels = [_questionLabels sortedArrayUsingComparator:^(UILabel *item1,UILabel *item2) {
        return item1.tag - item2.tag;
    }];

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

//タイマーメソッドの実行
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



    if(realTime < 65.0f)
    {
        if((int)realTime % 2 == 0)
        {
            self.view.backgroundColor = [UIColor yellowColor];
        }else{
            self.view.backgroundColor = [UIColor blackColor];
        }
        if(realTime == 60){
            [self gameStart];
        }
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)wakeUp:(id)sender
{
    realTime = self.time + 1;
}

//数字をタップしたときのメソッド
- (IBAction)tapNumberButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.judgeTextLabel.hidden = YES;
    if(count == 0){
        for(int i = 0; i < 6; i++){
            ((UILabel *)_answerLabels[i]).text = [NSString stringWithFormat:@""];
            ((UILabel *)_answerLabels[i]).alpha = 1.0;
        }
    }
    for(int i = 1; i < 10; i++)
    {
        if(button.tag == i)
        {
            //answerLabelsにボタンの数字を入力する。
        ((UILabel *)_answerLabels[count]).text = [NSString stringWithFormat:@"%d",button.tag];
        }
    }
    //問題と答えが不正解ならjudgeFlagをNOにする。
    if(![(((UILabel *)_answerLabels[count]).text) isEqual:(((UILabel *)_questionLabels[count]).text)])
    {
        judgeFlag = NO;
        self.judgeTextLabel.hidden = NO;
    }else{
        judgeFlag = YES;
        count++;
    }
    //全ての項目が埋まったら実行
    if(count == 6)
    {
        if(judgeFlag)
        {
            self.view.backgroundColor = [UIColor whiteColor];
            [self gameEnd];
            //■■■■■■■■■ 変数の値を警告の時間に変更する
            realTime = 70;
        }else{
            count = 0;
            judgeFlag = YES;
        }
    }
}


//ゲームを開始する。
- (void) gameStart
{
    //questionLabelsに乱数を入れる。
    for(int i = 0; i < 6; i++){
        ((UILabel *)_answerLabels[i]).text = [NSString stringWithFormat:@""];
        ((UILabel *)_questionLabels[i]).alpha = 1.0;
        ((UILabel *)_questionLabels[i]).text = [NSString stringWithFormat:@"%d",arc4random() % 9 + 1];
    }
    
    self.secondGameView.alpha = 0.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.secondGameView.frame = CGRectMake(0, 0, 320, 460);
    self.secondGameView.alpha = 1.0;
    [UIView commitAnimations];
}
//ゲームが終了した時に実行される。
- (void) gameEnd
{
    count = 0;
    judgeFlag = YES;
    self.secondGameView.alpha = 1.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.secondGameView.frame = CGRectMake(0, 460, 320, 460);
    [UIView commitAnimations];
    
}

@end
