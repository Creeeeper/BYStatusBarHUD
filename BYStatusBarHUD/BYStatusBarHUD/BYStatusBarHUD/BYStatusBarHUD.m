//
//  BYStatusBarHUD.m
//  BYStatusBarHUD
//
//  Created by liby on 17/2/28.
//  Copyright © 2017年 liby. All rights reserved.
//

#import "BYStatusBarHUD.h"

#define BYMessageFont [UIFont systemFontOfSize:12]

/** 消息停留时间 */
static CGFloat const BYMessageDuration = 2.0;

/** 显示\消失动画时间 */
static CGFloat const BYAnimationDuration = 0.25;

@implementation BYStatusBarHUD

/** 全局窗口 */
static UIWindow *window_;

/** 定时器 */
static NSTimer *timer_;

/** 窗口背景色 */
static UIColor *BGColor_;

/** 字体颜色 */
static UIColor *msgColor_;

/** 菊花样式 */
static UIActivityIndicatorViewStyle style_;

/**
 * 设置背景色 默认黑色
 */
+ (void)setBGColor:(UIColor *)BGColor{
    BGColor_ = BGColor;
}

/**
 * 设置文字颜色 默认白色
 */
+ (void)setMsgColor:(UIColor *)msgColor{
    msgColor_ = msgColor;
}
/**
 * 设置菊花样式 默认白色
 */
+ (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style{
    style_ = style;
}

/**
 * 显示窗口
 */
+ (void)showWindow{
    //frame
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    if (BGColor_) {
        window_.backgroundColor = BGColor_;
    } else {
        window_.backgroundColor = [UIColor blackColor];
    }
    //窗口级别
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:BYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}
/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image{
    // 停止定时器
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:msg forState:(UIControlStateNormal)];
    btn.titleLabel.font = BYMessageFont;
    if (msgColor_) {
        [btn setTitleColor:msgColor_ forState:(UIControlStateNormal)];
    }
    if (image) {
        [btn setImage:image forState:(UIControlStateNormal)];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    btn.frame = window_.bounds;
    [window_ addSubview:btn];
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:BYMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}
/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"BYStatusBarHUD.bundle/sign_check"]];
}
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"BYStatusBarHUD.bundle/sign_error"]];
}
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加文字
    UILabel *lab = [[UILabel alloc] init];
    lab.font = BYMessageFont;
    lab.frame = window_.bounds;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = msg;
    if (msgColor_) {
        lab.textColor = msgColor_;
    } else {
        lab.textColor = [UIColor whiteColor];
    }
    [window_ addSubview:lab];
    
    //添加菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] init];
    if (style_) {
        loadingView.activityIndicatorViewStyle = style_;
    } else {
        loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    }
    [loadingView startAnimating];
    //计算位置
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : BYMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height *0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}
/**
 * 隐藏
 */
+ (void)hide{
    CGRect frame = window_.frame;
    frame.origin.y = - frame.size.height;
    [UIView animateWithDuration:BYAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}




@end
