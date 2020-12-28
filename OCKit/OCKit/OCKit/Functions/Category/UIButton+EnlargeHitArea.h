//
//  UIButton+EnlargeHitArea.h
//  CMTApp
//
//  Created by Jianmei on 2018/9/18.
//  Copyright © 2018 ucarinc.com. All rights reserved.
//

#import <UIKit/UIKit.h>
///扩大Button 点击 区域
@interface UIButton (EnlargeHitArea)

@property (nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

@end
