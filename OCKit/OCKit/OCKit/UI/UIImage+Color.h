//
//  UIImage+Color.h
//  CMTApp
//
//  Created by yuanzc on 2018/7/2.
//  Copyright © 2018 ucarinc.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage*)bw_imageWithColor:(UIColor *)color;

+ (UIImage*)bw_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;
@end
