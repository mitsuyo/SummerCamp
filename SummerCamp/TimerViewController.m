//
//  GameViewController.m
//  SummerCamp
//
//  Created by 三世 忠洋 on 2013/08/23.
//  Copyright (c) 2013年 Tadahiro Mitsuyo. All rights reserved.
//

#import "TimerViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#include <AVFoundation/AVFoundation.h>


@interface TimerViewController ()

@end

@implementation TimerViewController
{
    AVAudioPlayer *audioPlayer;

    int timeSecond;
    int timeMinute;
    NSTimer *tm;
    NSTimer *soundTm;
    float realTime;
    
    //ゲームのクリックされた回数をカウントする。
    int count;
    //ゲームの正解か不正解かをジャッジする。
    BOOL judgeFlag;

    int timeBarWidth;
    
    int timeCount;
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
    
    timeCount = 0;

    realTime = self.time;
//    realTime = 35;

    _timeBarView.backgroundColor = [UIColor clearColor];
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

//    self.timeBar.frame = CGRectMake(74, 192, 230, 60);
//    self.timeBar.frame = CGRectMake(74, 192, 230, 60);
//    timeBarWidth = self.timeBar.frame.size.width;
    
    self.secondGameView.alpha = 0.0;
    
    //timeBarのwidthをrealTimeの秒数で0pxに変更する。
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:realTime -60];
    self.timeBar.frame = CGRectMake(57, 0, 0, 60);
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//タイマーメソッドの実行
- (void)timerCountDown:(NSTimer*)timer
{
    timeCount++;
    
    realTime -= 1.0f;
    timeMinute = (int) realTime / 60;
    timeSecond = (int) realTime - timeMinute * 60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d : %02d", timeMinute, timeSecond];

    //アラームが修了したら実行
    if(realTime == 0.0f)
    {
        [tm invalidate];
        [self startSound];
        soundTm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(soundTimerCountDown:) userInfo:nil repeats:YES];
        
    }


    if(realTime == 60.0f){
        //timeBarのイメージをyellowに変更する。
        //通常のバーに戻す
        self.timeBar.frame = CGRectMake(57, 0, 230, 60);
        self.timeBar.image = [UIImage imageNamed:@"scene02_timebarWarning.png"];
        
        //timeBarのwidthをrealTimeの秒数で0pxに変更する。
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:30];
        self.timeBar.frame = CGRectMake(57, 0, 0, 60);
        [UIView commitAnimations];
    }
    //realTimeが残り60秒になったら（警告１）
    if(realTime < 60.0f && realTime > 30.0f)
    {

        
        //画面をフラッシュさせる。
        if(realTime > 30.0f){
        if((int)realTime % 2 == 0)
        {
                self.view.backgroundColor = [UIColor yellowColor];
            }else{
                self.view.backgroundColor = [UIColor blackColor];
            }
        }
    }
    //警告２
    if(realTime == 30.0f){
        self.timeBar.frame = CGRectMake(57, 0, 230, 60);
        self.timeBar.image = [UIImage imageNamed:@"scene02_timebarOut.png"];
        
        //timeBarのwidthをrealTimeの秒数で0pxに変更する。
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:30];
        self.timeBar.frame = CGRectMake(57, 0, 0, 60);
        [UIView commitAnimations];
        
        [self gameStart];
        self.view.backgroundColor = [UIColor whiteColor];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        self.timeBarView.frame = CGRectMake(17, 10, 287, 60);
        [UIView commitAnimations];
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
        //タイマーを再セットする。
        if(realTime == 0){
            NSLog(@"スタート");
            [soundTm invalidate];
            audioPlayer = nil;
            //■■■■■■■■■ 変数の値を警告の時間に変更する
            realTime = self.time;
            tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerCountDown:) userInfo:nil repeats:YES];
        }

        if(judgeFlag)
        {
            realTime = self.time;
            self.view.backgroundColor = [UIColor whiteColor];
            [self gameEnd];
           
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
    self.secondGameView.frame = CGRectMake(0, 75, 320, 460);
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
    CGRect frame = _timeBarView.frame;
    frame.origin.y = 192;
    _timeBarView.frame = frame;
    [UIView commitAnimations];
    
    //timebarを再セットする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.timeBarView.frame = CGRectMake(17, 10, 287, 60);
    [UIView commitAnimations];
    
    //通常のバーに戻す
    self.timeBar.frame = CGRectMake(57, 0, 230, 60);
    self.timeBar.image = [UIImage imageNamed:@"scene02_timebarSafe.png"];
    
    frame.origin.y = 192;
    _timeBarView.frame = frame;
    
    //timeBarのwidthをrealTimeの秒数で0pxに変更する。
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:realTime];
    self.timeBar.frame = CGRectMake(57, 0, 0, 60);
    [UIView commitAnimations];
}
- (void)soundTimerCountDown:(NSTimer*)timer
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
-(void)startSound{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"mainSound" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    audioPlayer.numberOfLoops = -1;
    [audioPlayer play];
}

@end
