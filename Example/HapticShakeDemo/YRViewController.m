//
//  YRViewController.m
//  HapticShakeDemo
//
//  Created by TangchangTomYang on 08/28/2017.
//  Copyright (c) 2017 TangchangTomYang. All rights reserved.
//

#import "YRViewController.h"


#import <AudioToolbox/AudioServices.h> // 旧接口
@interface YRViewController ()


@end

@implementation YRViewController


  /**
   针对一下几种震动情况 机型的说明
   AudioServicesPlaySystemSound     1519        1520        1521
   iPhone 7（iOS 10）                 peek 触感	pop 触感      三次连续短振
   iPhone 6s Puls（iOS 9）            peek 触感	pop 触感      三次连续短振
   iPhone 6（iOS 10）                 无振动     无振动         无振动
   
   
   UIImpactFeedbackGenerator	.Light          .Medium     .Heavy
   iPhone 7（iOS 10）             微弱短振        中等短振        明显短振
   iPhone 6s Puls（iOS 9）         长振             长振          长振
   iPhone 6（iOS 10）             无振动             无振动         无振动
   
   */








// 这三个接口是系统 私有接口可能审核不过
- (IBAction)shake0:(UIButton *)sender {
    // `Peek` 震动反馈 (weak boom)
    AudioServicesPlaySystemSound(1519);
}

- (IBAction)shake1:(UIButton *)sender {
    // `Pop` 震动反馈 (strong boom)
    AudioServicesPlaySystemSound(1520);
}

- (IBAction)shake2:(UIButton *)sender {
    AudioServicesPlaySystemSound(1521);
}





#pragma mark - UIImpactFeedbackGenerator

// iphone  7 手机10.0 以上版本才可以使用一下三个新接口, 其他的手机无效
- (IBAction)shake4:(UIButton *)sender {
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleLight];
    [generator prepare];
    [generator impactOccurred];
}

- (IBAction)shake5:(UIButton *)sender {
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];
    [generator prepare];
    [generator impactOccurred];
}

- (IBAction)shake6:(UIButton *)sender {
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];
    [generator prepare];
    [generator impactOccurred];
}



@end
