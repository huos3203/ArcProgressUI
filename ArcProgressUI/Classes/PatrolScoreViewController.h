//
//  PatrolScoreViewController.h
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/22.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PatrolScoreViewController : UIViewController

+(PatrolScoreViewController *)withStoryboard;
@end

@interface ScoreCellView:UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *ibScoreTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibScoreLabel;
@end

@interface PatrolScoreModel:NSObject
@property (strong, nonatomic) NSString *scoreName;
@property (strong, nonatomic) NSString *score;
@end
