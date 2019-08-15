//
//  ViewController.m
//  MOImageButtonDemo
//
//  Created by 莫晓卉 on 2018/12/4.
//  Copyright © 2018年 moxiaohui. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "MOImageButtonDemo-Swift.h"
#define kScreen_Width (UIScreen.mainScreen.bounds.size.width)
#define kMargin (4)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // 左边
  [self createLeftButton];
  // 右边
  [self createRightButton];
  // 上
  [self createTopButton];
  // 下
  [self createBottomButton];
  
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  [btn setTitle:@"swift版本" forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  btn.frame = CGRectMake(0, 0, 100, 50);
  btn.center = self.view.center;
  [btn addTarget:self action:@selector(clickSwift) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
}

- (void)clickSwift {
  [self presentViewController:[MOImageBtnViewController new] animated:YES completion:nil];
}
  
#pragma mark - 图片在左边
- (void)createLeftButton {
  UIButton *btn = [self getButton];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(80);
    make.centerX.mas_equalTo(0);
    make.height.mas_equalTo(44);
  }];
  [btn layoutIfNeeded];
  CGFloat imgWidth = btn.imageView.bounds.size.width;
  CGFloat labWidth = btn.titleLabel.bounds.size.width;
  btn.titleEdgeInsets = UIEdgeInsetsMake(0, 2*kMargin, 0, kMargin);
  btn.imageEdgeInsets = UIEdgeInsetsMake(0, kMargin, 0, 0);
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.mas_equalTo(imgWidth + labWidth + (3 * kMargin));
  }];
}
  
#pragma mark - 图片在右
- (void)createRightButton {
  UIButton *btn = [self getButton];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(130);
    make.centerX.mas_equalTo(0);
    make.height.mas_equalTo(44);
  }];
  [btn layoutIfNeeded];
  CGFloat imgWidth = btn.imageView.bounds.size.width;
  CGFloat labWidth = btn.titleLabel.bounds.size.width;
  btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imgWidth, 0, imgWidth + kMargin);
  btn.imageEdgeInsets = UIEdgeInsetsMake(0, labWidth + kMargin, 0, - kMargin);
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.mas_equalTo(imgWidth + labWidth + (3 * kMargin));
  }];
}
  
#pragma mark - 图片在上
- (void)createTopButton {
  UIButton *btn = [self getButton];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(220);
    make.centerX.mas_equalTo(0);
  }];
  [btn layoutIfNeeded];
  CGFloat imgWidth = btn.imageView.bounds.size.width;
  CGFloat imgHeight = btn.imageView.bounds.size.height;
  CGFloat labWidth = btn.titleLabel.bounds.size.width;
  CGFloat labHeight = btn.titleLabel.bounds.size.height;
  CGFloat width = MAX(labWidth, imgWidth);
  btn.titleEdgeInsets = UIEdgeInsetsMake(kMargin + imgHeight, -imgWidth, 0, 0);
  btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, labHeight + 2*kMargin, 0);
  [btn.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.mas_equalTo(0);
  }];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.mas_equalTo(imgHeight + labHeight + (3 * kMargin));
    make.width.mas_equalTo(width + (2 * kMargin));
  }];
}
  
#pragma mark - 图片在下
- (void)createBottomButton {
  UIButton *btn = [self getButton];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(300);
    make.centerX.mas_equalTo(0);
  }];
  [btn layoutIfNeeded];
  CGFloat imgWidth = btn.imageView.bounds.size.width;
  CGFloat imgHeight = btn.imageView.bounds.size.height;
  CGFloat labWidth = btn.titleLabel.bounds.size.width;
  CGFloat labHeight = btn.titleLabel.bounds.size.height;
  CGFloat width = MAX(labWidth, imgWidth);
  btn.titleEdgeInsets = UIEdgeInsetsMake(kMargin, -imgWidth, 2*kMargin + imgHeight , 0);
  btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
  [btn.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.mas_equalTo(0);
    make.bottom.mas_equalTo(-kMargin);
  }];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.mas_equalTo(imgHeight + labHeight + (3 * kMargin));
    make.width.mas_equalTo(width + (2 * kMargin));
  }];
}
  
- (UIButton *)getButton {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.backgroundColor = [UIColor grayColor];
  [btn setTitle:@"自适应宽度" forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [btn setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
  [self.view addSubview:btn];
  return btn;
}


@end
