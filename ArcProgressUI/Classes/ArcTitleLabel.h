//
//  ArcTitleLabel.h
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/20.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//
#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ArcTitleLabel : UILabel

@property (nonatomic,strong) IBInspectable UIColor* borderColor;
@property (nonatomic,assign) IBInspectable CGFloat borderWidth;
@property (nonatomic,assign) IBInspectable CGFloat borderRadius;

@property (assign, nonatomic)UIEdgeInsets edgeInsets;
@end
