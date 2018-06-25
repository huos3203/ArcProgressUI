//
//  BottomSheetView.m
//  YGPatrol
//
//  Created by du on 2017/11/2.
//  Copyright © 2017年 huoshuguang. All rights reserved.
//

#import "SheetView.h"

@implementation SheetCell
@end
@implementation SheetModel
@end


@implementation SheetView

-(void)addIntoView:(UIView *)inView
{
    [inView addSubview:self];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *cview = self;
    _ibTableViewHeight.constant = (_dataArray.count + 1) * 50 + 6;
    NSArray *Hconstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cview(==inView)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(cview,inView)];
//    NSString *formatStr = [NSString stringWithFormat: @"V:[cview(%d)]-0-|",BOTTOM_CONTENT_H];
    NSArray *Vconstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cview(==inView)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(cview,inView)];
    [inView addConstraints:Hconstraint];
    [inView addConstraints:Vconstraint];
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        _ibShadeView.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            _tableView.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (IBAction)ibaHiddenSheetViewAction:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        _tableView.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            _ibShadeView.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}
//代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    return [_dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 6;
    }
    return 0.01;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomSheetCell"];
    if (indexPath.section == 0) {
         SheetModel *model =  _dataArray[indexPath.row];
        cell.ibCellLabel.text = model.title;
    }else{
        cell.ibCellLabel.text = @"取消";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self ibaHiddenSheetViewAction:nil];
    if (indexPath.section == 0) {
        _handlerSheetCell(_dataArray[indexPath.row]);
    }
    
}

@end
