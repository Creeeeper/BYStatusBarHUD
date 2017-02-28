//
//  BYStatusBarHUD.h
//  BYStatusBarHUD
//
//  Created by liby on 17/2/28.
//  Copyright © 2017年 liby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYStatusBarHUD : NSObject
/**
 * 设置背景色 默认黑色
 */
+ (void)setBGColor:(UIColor *)BGColor;

/**
 * 设置文字颜色 默认白色
 */
+ (void)setMsgColor:(UIColor *)msgColor;

/**
 * 设置菊花样式 默认白色
 */
+ (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style;


/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 * 隐藏
 */
+ (void)hide;
@end
