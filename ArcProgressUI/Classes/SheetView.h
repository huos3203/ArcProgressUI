//
//  BottomSheetView.h
//  YGPatrol
//
//  Created by du on 2017/11/2.
//  Copyright © 2017年 huoshuguang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheetModel:NSObject
@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) id body;
@end

@interface SheetView : UIView <UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ibTableViewHeight;

@property(strong,nonatomic)void(^handlerSheetCell)(SheetModel *cellModel);

-(void)addIntoView:(UIView *)inView;
- (IBAction)ibaHiddenSheetViewAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *ibShadeView;

@end

@interface SheetCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *ibCellLabel;
@end

