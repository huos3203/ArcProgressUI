//
//  ArtTool.m
//  ArtTool
//
//  Created by admin on 2018/6/21.
//  Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import "ArtTool.h"
#import "ArcProgressView.h"
#import "PatrolScoreViewController.h"
@implementation ArtTool
+(void)logArcToo:(UIView *)superView
{
    [ArcProgressView installTo:superView];
}

+(UIViewController *)VCFromStoryBoard{
    return [PatrolScoreViewController withStoryboard];
}
@end
