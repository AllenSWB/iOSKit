//
//  UIButton+BWButton.h
//  MMCBusiness
//
//  Created by Jianmei on 2019/2/28.
//  Copyright © 2019 UCAR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleImageLeft,
    ButtonEdgeInsetsStyleImageRight,
    ButtonEdgeInsetsStyleImageTop,
    ButtonEdgeInsetsStyleImageBottom
};

@interface UIButton (BWButton)

/** 纯文字的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor;

/** 纯图片的按钮 */
//+ (UIButton *)buttonWithImage:(NSString *)img margin:(CGFloat) margin;

//+ (UIButton *)buttonWithImage:(NSString *)img title:(NSString *)title font:(UIFont *)font color:(UIColor *)color padding:(CGFloat)padding;


/** 纯文字的按钮, 带圆角边框 */
+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor borderColor:(CGColorRef)colorRef;

+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color ableBgColor:(UIColor *)abColor disableBgColor:(UIColor *)bgColor;

+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor borderColor:(CGColorRef)colorRef borderWidth:(CGFloat)width radius:(CGFloat)radius;

/** 图片 + 文字 的按钮 */
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
