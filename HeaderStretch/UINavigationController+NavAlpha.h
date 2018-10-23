//
//  UINavigationController+NavAlpha.h
//  HeaderStretch
//
//  Created by lwmini on 2018/10/23.
//  Copyright © 2018年 lw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NavAlpha)<UINavigationBarDelegate>

@end


@interface UIViewController (NavAlpha)
/**
 导航栏透明度
 */
@property (nonatomic, assign) CGFloat navAlpha;
/**
 导航栏背景颜色
 */
@property (null_resettable, nonatomic, strong) UIColor *navBackgroundColor;
/**
 导航栏字体颜色
 */
@property (null_resettable, nonatomic, strong) UIColor *navTintColor;
/**
 导航栏字体颜色
 */
@property (null_resettable, nonatomic, strong) UIColor *navTitleColor;
/**
 导航栏偏移Y
 */
@property (nonatomic, assign) CGFloat navOffsetY;

@end
