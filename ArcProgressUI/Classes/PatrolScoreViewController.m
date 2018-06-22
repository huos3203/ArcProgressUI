//
//  PatrolScoreViewController.m
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/22.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import "PatrolScoreViewController.h"
@implementation ScoreCellView
@end

@implementation PatrolScoreModel
@end


@interface PatrolScoreViewController()
@property (strong, nonatomic) IBOutlet UILabel *ibTitlelabel;
@property (strong, nonatomic) IBOutlet UILabel *ibStoreStyleLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibStoreSizeLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibReviewDateLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ibTableViewHeight;

@end

@implementation PatrolScoreViewController
{
    NSArray<PatrolScoreModel *> *_scoreArr;
}

#pragma mark - api
+(PatrolScoreViewController *)withStoryboard{
    NSBundle *podbundle = [NSBundle bundleForClass:[PatrolScoreViewController class]];
    NSURL *bundleURL = [podbundle URLForResource:@"ArcProgressUI" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"PatrolScore" bundle:bundle];
    PatrolScoreViewController *VC = [story instantiateViewControllerWithIdentifier:@"PatrolScoreViewController"];
    return VC;
}

#pragma mark - override
-(void)viewDidLoad{
//    [super viewDidLoad];
    _ibTitlelabel.text = @"测试标题内容";
    _ibStoreStyleLabel.text = @"娱乐服务";
    _ibStoreSizeLabel.text = @"小型";
    _ibReviewDateLabel.text = @"233434";
    //模拟数据
    PatrolScoreModel *model = [PatrolScoreModel new];
    model.scoreName = @"基本项";
    model.score = @"20";
    PatrolScoreModel *model1 = [PatrolScoreModel new];
    model1.scoreName = @"热食类食品";
    model1.score = @"20";
    PatrolScoreModel *model2 = [PatrolScoreModel new];
    model2.scoreName = @"糕点类食品";
    model2.score = @"20";
    _scoreArr = [[NSArray alloc] initWithObjects:model,model1,model2, nil];
}
-(void)viewDidAppear:(BOOL)animated
{
     _ibTableViewHeight.constant = self.tableView.contentSize.height;
}
#pragma mark UI event
- (IBAction)ibaBackAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark tableView data
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    return _scoreArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *styleID = @"ScoreListStyle";
    if (indexPath.section == 1) {
        styleID = @"ScoreLastStyle";
    }
    ScoreCellView *cell = [tableView dequeueReusableCellWithIdentifier:styleID];
    PatrolScoreModel *model = _scoreArr[indexPath.row];
    if (indexPath.section == 0) {
        cell.ibScoreTitleLabel.text = model.scoreName;
        cell.ibScoreLabel.text = model.score;
    }else{
        cell.ibScoreLabel.text = @"计算总分";
    }
    return cell;
}

#pragma mark - private



#pragma mark - getter / setter

@end

