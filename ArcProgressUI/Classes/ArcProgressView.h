//
//  ArcProgressView.h
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/20.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//
#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ArcProgressView : UIView

+(ArcProgressView *)installTo:(UIView *)superView;
@property (strong, nonatomic) IBInspectable UIColor *trackPregessColor;
@property (strong, nonatomic) IBInspectable UIColor *pregessColor;
@property(nonatomic,assign)float curCount; //当前进度值
@property(nonatomic,assign)float count;  //满格进度值
@property(nonatomic,strong)IBOutlet UILabel *numLabel;
@property(nonatomic,strong)NSTimer *timer;
@end
