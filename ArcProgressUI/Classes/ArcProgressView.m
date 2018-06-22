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

@property (strong, nonatomic) IBOutlet ArcTitleLabel *ibTitleLabel;

@end

@implementation ArcProgressView

#pragma mark - def
CGFloat _arcW;
CGFloat _arcH;
#pragma mark - override
- (void)drawRect:(CGRect)rect {
    _arcW = self.frame.size.width;
    _arcH = self.frame.size.height;
    drawArcTrack();  //    仪表盘底部
    [self drawArcProgress]; //    仪表盘进度
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    }
}
-(void)awakeFromNib
{
    [super awakeFromNib];
}
#pragma mark - API
+(ArcProgressView *)installTo:(UIView *)superView{
        NSBundle *podBundle = [NSBundle bundleForClass:[ArcProgressView class]];
    NSURL *bundleURL = [podBundle URLForResource:@"ArcProgressUI" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    NSArray *viewArr = [bundle loadNibNamed:@"ArcProgressView" owner:nil options:nil];
    ArcProgressView *arcView = viewArr.lastObject;
    arcView.numLabel.text = @"numLabelnumLabel";
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
    CGFloat length[] = {4,8};
    CGContextSetLineDash(ctx, 0, length, 2);
    //1.4 设置颜色
    [[UIColor blackColor] set];
    //2.设置路径
    CGContextAddArc(ctx, _arcW/2 , _arcH/2, _arcW/2 - 60, -5*M_PI_4, M_PI_4, 0);
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
    CGFloat length[] = {4,8};
    CGContextSetLineDash(ctx, 0, length, 2);
    //1.4 设置颜色
    [[UIColor whiteColor] set];
    
    //2.设置路径
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(numberChange:) name:@"number" object:nil];
    
    CGFloat end = -5*M_PI_4+(6*M_PI_4*_num/100);
    
    CGContextAddArc(ctx, _arcW/2 , _arcH/2, 80, -5*M_PI_4, end , 0);
    
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
    
    if (_num > 100) {
        _num = 0;
    }
    
    _numLabel.text = [NSString stringWithFormat:@"%d",_num];
    
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:_numLabel.text,@"num", nil];
    
    //    创建通知
    NSNotification *noti = [NSNotification notificationWithName:@"number" object:nil userInfo:dic];
    //    发送通知
    [[NSNotificationCenter defaultCenter]postNotification:noti];
    
}
#pragma mark - getter / setter
-(void)setNum:(int)num
{
    _num = num;
}
@end

