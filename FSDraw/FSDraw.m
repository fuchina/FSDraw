//
//  FSDraw.m
//  FSDrawSample
//
//  Created by fudongdong on 2018/11/23.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSDraw.h"

@implementation FSDraw

+ (NSArray<CAShapeLayer *> *)fs_drawColorForLayer:(nonnull CALayer *)view
                                         sections:(NSInteger)sections
                                        direction:(FSDrawDirection)direction
                                            color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                                            ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio{
    return [self drawColorForLayer:view hasAddedAndReuseLayers:nil sections:sections direction:direction color:configColor ratio:configRatio];
}

+ (NSArray<CAShapeLayer *> *)drawColorForLayer:(nonnull CALayer *)view
                        hasAddedAndReuseLayers:(nullable NSArray<CAShapeLayer *> *)priorities
                                      sections:(NSInteger)sections
                                     direction:(FSDrawDirection)direction
                                         color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                                         ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio{
    if (![view isKindOfClass:CALayer.class]) {
        return nil;
    }
    if (!configColor) {
        return nil;
    }
    if (!configRatio) {
        return nil;
    }
    if (sections<= 0) {
        return nil;
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
    
    NSMutableArray  *layers = nil;
    if ([priorities isKindOfClass:NSArray.class] && priorities.count) {
        layers = [[NSMutableArray alloc] initWithArray:priorities];
    }else{
        layers = [[NSMutableArray alloc] init];
    }
    
    NSInteger countOfPriorities = priorities.count;
    CGFloat offset = 0;
    NSInteger theLast = sections - 1;
    for (int x = 0; x < sections; x ++) {
        CAShapeLayer *shapeLayer = nil;
        if (x < countOfPriorities) {
            shapeLayer = priorities[x];
        }else{
            shapeLayer = [CAShapeLayer layer];
        }
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
        if (![view.sublayers containsObject:shapeLayer]) {
            [view addSublayer:shapeLayer];
            [layers addObject:shapeLayer];
        }
        
        offset = shapeLayer.strokeEnd;
        if (offset >= 1) {
            break;
        }
    }
    [path closePath];
    
#if DEBUG
    
    // 校验数组是否正确
    BOOL sameCount = layers.count == view.sublayers.count;
    NSAssert(sameCount == YES, @"layers数组的count应该跟view.sublayers.count相同");

    // 互相包含
    for (int x = 0; x < layers.count; x ++) {
        CAShapeLayer *llayer = layers[x];
        CAShapeLayer *slayer = view.sublayers[x];
        
        BOOL aCheck = [layers containsObject:slayer];
        BOOL bCheck = [view.sublayers containsObject:llayer];
        NSAssert(aCheck == YES, @"layers必须包含view.sublayers中的元素");
        NSAssert(bCheck == YES, @"view.sublayer必须包行layes中的元素");
    }
    
#endif
    
    return [layers copy];
}

+ (void)removeAllColorsWithSubLayers:(NSArray<CAShapeLayer *> *)layers{
    if ([layers isKindOfClass:NSArray.class] && layers.count) {
        for (CALayer *subLayer in layers) {
            [subLayer removeFromSuperlayer];
        }
    }
}

@end
