//
//  UIButton+BWButton.m
//  MMCBusiness
//
//  Created by Jianmei on 2019/2/28.
//  Copyright © 2019 UCAR. All rights reserved.
//

#import "UIButton+BWButton.h"
#import "UIViewExt.h"
#import "UIImage+Color.h"
#define kCornerRadius 4 // 按钮圆角
#define kLineH (1 / [UIScreen mainScreen].scale)

@implementation UIButton (BWButton)

#pragma mark - public methods

/** 纯文字的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor {
    UIButton *btn = [[self alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    btn.titleLabel.font = font;
    [btn sizeToFit];
    
    return btn;
}


/** 纯图片的按钮 */
+ (UIButton *)buttonWithImage:(NSString *)img margin:(CGFloat) margin {
    UIButton *btn = [[self alloc] init];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateHighlighted];
    UIImage *selectedImg = [UIImage imageNamed:[NSString stringWithFormat:@"%@_s", img]];
    if (selectedImg) {
        [btn setImage:selectedImg forState:UIControlStateSelected];
    }
    btn.contentMode = UIViewContentModeCenter;
    
    [btn sizeToFit];
    
    if (margin > 0) {
        
        CGFloat width = btn.width;
        btn.width = width + 2*margin;
    }
    
    return btn;
}

/** 纯文字的按钮, 带圆角边框 */
+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor borderColor:(CGColorRef)colorRef {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = kCornerRadius;
    btn.layer.borderWidth = kLineH;
    btn.layer.borderColor = colorRef;
    btn.backgroundColor = bgColor;
    btn.titleLabel.font = font;
    [btn sizeToFit];
    
    return btn;
}

+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color ableBgColor:(UIColor *)abColor disableBgColor:(UIColor *)bgColor {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage bw_imageWithColor:abColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage bw_imageWithColor:bgColor] forState:UIControlStateDisabled];
    btn.titleLabel.font = font;
    [btn sizeToFit];
    return btn;
}

+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor borderColor:(CGColorRef)colorRef borderWidth:(CGFloat)width radius:(CGFloat)radius{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = radius;
    btn.layer.borderWidth = width;
    btn.layer.borderColor = colorRef;
    btn.backgroundColor = bgColor;
    btn.titleLabel.font = font;
    [btn sizeToFit];
    
    return btn;
}

- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space {
    CGFloat imageViewWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
    
    if (labelWidth == 0) {
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth  = titleSize.width;
    }
    
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;
    
    switch (style) {
        case ButtonEdgeInsetsStyleImageRight:
        {
            space = space * 0.5;
            
            imageInsetsLeft = labelWidth + space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = - (imageViewWidth + space);
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
            
        case ButtonEdgeInsetsStyleImageLeft:
        {
            space = space * 0.5;
            
            imageInsetsLeft = -space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case ButtonEdgeInsetsStyleImageBottom:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageBottomY = CGRectGetMaxY(self.imageView.frame);
            CGFloat titleTopY = CGRectGetMinY(self.titleLabel.frame);
            
            imageInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - imageBottomY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = (buttonHeight * 0.5 - boundsCentery) - titleTopY;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
            
        }
            break;
        case ButtonEdgeInsetsStyleImageTop:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageTopY = CGRectGetMinY(self.imageView.frame);
            CGFloat titleBottom = CGRectGetMaxY(self.titleLabel.frame);
            
            imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, titleInsetsBottom, titleInsetsRight);
}

@end
