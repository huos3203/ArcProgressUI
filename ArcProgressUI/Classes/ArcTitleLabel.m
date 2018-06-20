//
//  ArcTitleLabel.m
//  ArcProgressUI(github地址)
//
//  Created by admin on 2018/6/20.
//Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import "ArcTitleLabel.h"

@interface ArcTitleLabel()

@end

@implementation ArcTitleLabel




#pragma mark - def

#pragma mark - override
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.edgeInsets = UIEdgeInsetsMake(5, 15, 5, 15);
}
-(void)prepareForInterfaceBuilder
{
    self.edgeInsets = UIEdgeInsetsMake(5, 15, 5, 15);
}

#pragma mark - view event
// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    
    /*
     调用父类该方法
     注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
     */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds,
                                                                 self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

//绘制文字
- (void)drawTextInRect:(CGRect)rect
{
    //令绘制区域为原始区域，增加的内边距区域不绘制
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

#pragma mark - getter / setter
-(void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = [borderColor CGColor];
    _borderColor = borderColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}
-(void)setBorderRadius:(CGFloat)borderRadius
{
    _borderRadius = borderRadius;
    self.layer.cornerRadius = borderRadius;
}
@end

