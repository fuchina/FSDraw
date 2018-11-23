//
//  FSDraw.m
//  FSDrawSample
//
//  Created by fudongdong on 2018/11/23.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSDraw.h"

@implementation FSDraw

+ (void)drawColorForView:(UIView *)view colors:(NSArray<UIColor *> *)colors sections:(NSArray<NSNumber *> *)secitons direction:(FSDrawDirection)direction{
    if (!([colors isKindOfClass:NSArray.class] && colors.count)) {
        return;
    }
    if (!([secitons isKindOfClass:NSArray.class] && secitons.count)) {
        return;
    }
    if (secitons.count != colors.count) {
        return;
    }
    if (![view isKindOfClass:UIView.class]) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (direction == FSDrawDirection_UpToBottom) {
        [path moveToPoint:CGPointMake(0, view.bounds.size.height / 2)];
        [path addLineToPoint:CGPointMake(view.bounds.size.width, view.bounds.size.height / 2)];
    }else if (direction == FSDrawDirection_LeftToRight){
        [path moveToPoint:CGPointMake(0, view.bounds.size.height / 2)];
        [path addLineToPoint:CGPointMake(view.bounds.size.width, view.bounds.size.height / 2)];
    }
    
    __block float a = 0;
    __block NSInteger index = 0;
    [secitons enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.lineWidth = view.bounds.size.height;
        shapeLayer.strokeColor = colors[index].CGColor;
        
        CGFloat number = [secitons[index] floatValue];
        shapeLayer.strokeStart = a;
        shapeLayer.strokeEnd = a + number;
        [view.layer addSublayer:shapeLayer];
        
        a = shapeLayer.strokeEnd;
        index ++;
    }];
    
    [path closePath];
}

+ (void)drawColorForView:(UIView *)view colors:(NSArray<UIColor *> *)colors sections:(NSArray<NSNumber *> *)secitons{
    [self drawColorForViewB:view colors:colors sections:secitons];
}

+ (void)drawColorForViewA:(UIView *)view colors:(NSArray<UIColor *> *)colors sections:(NSArray<NSNumber *> *)secitons{
    if (!([colors isKindOfClass:NSArray.class] && colors.count)) {
        return;
    }
    if (!([secitons isKindOfClass:NSArray.class] && secitons.count)) {
        return;
    }
    if (secitons.count != colors.count) {
        return;
    }
    if (![view isKindOfClass:UIView.class]) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, view.bounds.size.height / 2)];
    [path addLineToPoint:CGPointMake(view.bounds.size.width, view.bounds.size.height / 2)];

    
    __block float a = 0;
    __block NSInteger index = 0;
    [secitons enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.lineWidth = view.bounds.size.height;
        shapeLayer.strokeColor = colors[index].CGColor;

        CGFloat number = [secitons[index] floatValue];
        shapeLayer.strokeStart = a;
        shapeLayer.strokeEnd = a + number;
        [view.layer addSublayer:shapeLayer];

        a = shapeLayer.strokeEnd;
        index ++;
    }];
    
    [path closePath];
}

+ (void)drawColorForViewB:(UIView *)view colors:(NSArray<UIColor *> *)colors sections:(NSArray<NSNumber *> *)secitons{
    if (!([colors isKindOfClass:NSArray.class] && colors.count)) {
        return;
    }
    if (!([secitons isKindOfClass:NSArray.class] && secitons.count)) {
        return;
    }
    if (secitons.count != colors.count) {
        return;
    }
    if (![view isKindOfClass:UIView.class]) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(view.bounds.size.width / 2, 0)];
    [path addLineToPoint:CGPointMake(view.bounds.size.width / 2, view.bounds.size.height)];
    
    __block float a = 0;
    __block NSInteger index = 0;
    [secitons enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.lineWidth = view.bounds.size.width;
        shapeLayer.strokeColor = colors[index].CGColor;
        
        CGFloat number = [secitons[index] floatValue];
        shapeLayer.strokeStart = a;
        shapeLayer.strokeEnd = a + number;
        [view.layer addSublayer:shapeLayer];
        
        a = shapeLayer.strokeEnd;
        index ++;
    }];
    
    [path closePath];
}

@end
