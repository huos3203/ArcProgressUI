//
//  ArcProgressView.h
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/20.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#define kScreenW [[UIScreen mainScreen] bounds].size.width

#define kScreenH [[UIScreen mainScreen] bounds].size.height
IB_DESIGNABLE
@interface ArcProgressView : UIView

@property(nonatomic,assign)int num;
@property(nonatomic,strong)IBOutlet UILabel *numLabel;
@property(nonatomic,strong)NSTimer *timer;
@end
