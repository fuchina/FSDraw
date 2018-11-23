//
//  FSDraw.m
//  FSDrawSample
//
//  Created by fudongdong on 2018/11/23.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSDraw.h"

@implementation FSDraw

+ (void)drawColorForLayer:(nonnull CALayer *)view
                 sections:(NSInteger)sections
                direction:(FSDrawDirection)direction
                    color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                    ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio{
    if (![view isKindOfClass:CALayer.class]) {
        return;
    }
    if (!configColor) {
        return;
    }
    if (!configRatio) {
        return;
    }
    if (sections<= 0) {
        return;
    }

    /*
     贝塞尔曲线正好是视图的中间，所画的线才不会歪或显示在区域外
     */
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (direction == FSDrawDirection_UpToBottom) {
        [path moveToPoint:CGPointMake(view.bounds.size.width / 2, 0)];
        [path addLineToPoint:CGPointMake(view.bounds.size.width / 2, view.bounds.size.height)];
    }else if (direction == FSDrawDirection_LeftToRight){
        [path moveToPoint:CGPointMake(0, view.bounds.size.height / 2)];
        [path addLineToPoint:CGPointMake(view.bounds.size.width, view.bounds.size.height / 2)];
    }
    
    CGFloat offset = 0;
    NSInteger theLast = sections - 1;
    for (int x = 0; x < sections; x ++) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        if (direction == FSDrawDirection_UpToBottom) {
            shapeLayer.lineWidth = view.bounds.size.width;
        }else if (direction == FSDrawDirection_LeftToRight){
            shapeLayer.lineWidth = view.bounds.size.height;
        }
        UIColor *color = configColor(x);
        shapeLayer.strokeColor = color.CGColor;
        
        if (x == theLast) {
            shapeLayer.strokeStart = offset;
            shapeLayer.strokeEnd = 1;
        }else{
            CGFloat ratio = configRatio(x);
            shapeLayer.strokeStart = offset;
            shapeLayer.strokeEnd = offset + ratio;
        }
        [view addSublayer:shapeLayer];
        
        offset = shapeLayer.strokeEnd;
        if (offset >= 1) {
            return;
        }
    }
    [path closePath];
}

@end
