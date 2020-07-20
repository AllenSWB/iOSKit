//
//  ViewController.m
//  OCKit
//
//  Created by wb on 2020/7/20.
//  Copyright © 2020 wb. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+BWButton.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    UIButton *moreStatusButton = [[UIButton alloc] init];
    moreStatusButton = [[UIButton alloc] init];
    [moreStatusButton setTitle:@"更多车况" forState:(UIControlStateNormal)];
    [moreStatusButton setTitleColor:UIColor.grayColor forState:(UIControlStateNormal)];
    moreStatusButton.titleLabel.font = [UIFont systemFontOfSize:11];
//    [moreStatusButton addTarget:self action:@selector(moreStatusClick) forControlEvents:(UIControlEventTouchUpInside)];
    [moreStatusButton setImage:[UIImage imageNamed:@"ck_homePage_state_more"] forState:(UIControlStateNormal)];
    [self.view addSubview:moreStatusButton];
    
    [moreStatusButton layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyleImageRight) imageTitlespace:5];
 
      [moreStatusButton mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_equalTo(90);
          make.centerX.mas_equalTo(self.view);
          make.height.mas_equalTo(18);
      }];
    
}


@end
