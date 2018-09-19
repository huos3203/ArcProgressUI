//
//  ArcProgressView.m
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/20.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import "ArcProgressView.h"
#import "ArcTitleLabel.h"

@interface ArcProgressView()
@property (assign, nonatomic) float num;
@property (strong, nonatomic) IBOutlet ArcTitleLabel *ibTitleLabel;
@end

@implementation ArcProgressView

#pragma mark - def
CGFloat _arcW;
CGFloat _arcH;
UIColor *_trackColor;
#pragma mark - override
- (void)drawRect:(CGRect)rect {
    _arcW = self.frame.size.width;
    _arcH = self.frame.size.height;
    drawArcTrack();  //    仪表盘底部
    [self drawArcProgress]; //    仪表盘进度
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    _trackColor = _trackPregessColor;
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    }
}
#pragma mark - API
+(ArcProgressView *)installTo:(UIView *)superView{
        NSBundle *podBundle = [NSBundle bundleForClass:[ArcProgressView class]];
    NSURL *bundleURL = [podBundle URLForResource:@"ArcProgressUI" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    NSArray *viewArr = [bundle loadNibNamed:@"ArcProgressView" owner:nil options:nil];
    ArcProgressView *arcView = viewArr.lastObject;
    arcView.numLabel.text = @"numLabelnumLabel";
    arcView.curCount = 50;
    arcView.count = 70;
    [superView addSubview:arcView];
    return arcView;
}
#pragma mark - view event
///绘制UI
void drawArcTrack()
{
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //1.1 设置线条的宽度
    CGContextSetLineWidth(ctx, 10);
    //1.2 设置线条的起始点样式
    CGContextSetLineCap(ctx,kCGLineCapButt);
    //1.3  虚实切换 ，实线5虚线10
    CGFloat length[] = {2,3};
    CGContextSetLineDash(ctx, 0, length, 2);
    //1.4 设置颜色
    [_trackColor set];
    //2.设置路径
    CGContextAddArc(ctx, _arcW/2 , _arcH/2, _arcW/2 - 40, -4.7*M_PI_4, .7*M_PI_4, 0);
    //3.绘制
    CGContextStrokePath(ctx);
}

-(void)drawArcProgress
{
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //1.1 设置线条的宽度
    CGContextSetLineWidth(ctx, 10);
    //1.2 设置线条的起始点样式
    CGContextSetLineCap(ctx,kCGLineCapButt);
    //1.3  虚实切换 ，实线5虚线10
    CGFloat length[] = {2,3};
    CGContextSetLineDash(ctx, 0, length, 2);
    //1.4 设置颜色
    [_pregessColor set];
    
    //2.设置路径
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(numberChange:) name:@"number" object:nil];
    
    CGFloat end = -4.7*M_PI_4+(5.7*M_PI_4*_num/_count);
    CGContextAddArc(ctx, _arcW/2 , _arcH/2, _arcW/2 - 40, -4.7*M_PI_4, end , 0);
    
    //3.绘制
    CGContextStrokePath(ctx);
}



#pragma mark - private
-(void)numberChange:(NSNotification*)text
{
    _num = [text.userInfo[@"num"] intValue];
    [self setNeedsDisplay];
}

-(void)change
{
    _num +=1;
    if (_num > _curCount - 1) {
        //停止走秒
        _numLabel.text = [NSString stringWithFormat:@"%.2f",_curCount];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"number" object:nil];
        [_timer invalidate];
        _timer = nil;
    }
    
    _numLabel.text = [NSString stringWithFormat:@"%.2f",_num];
    
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:_numLabel.text,@"num", nil];
    
    //    创建通知
    NSNotification *noti = [NSNotification notificationWithName:@"number" object:nil userInfo:dic];
    //    发送通知
    [[NSNotificationCenter defaultCenter]postNotification:noti];
    
}
#pragma mark - getter / setter
-(void)setNum:(float)num
{
    _num = num;
}
@end

