//
//  FSDraw.h
//  FSDrawSample
//
//  Created by fudongdong on 2018/11/23.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, FSDrawDirection) {
    FSDrawDirection_UpToBottom,     // 从上往下分布
    FSDrawDirection_LeftToRight,    // 从左往右分布
};

@interface FSDraw : NSObject

/*
  让视图显示分段的各种颜色
 layer：视图UIView的layer；
 sections：段数，分几段，必须大于0；
 direction：颜色绘制方向，从上往下绘制或从左往右绘制
 configColor：根据sectionIndex（每一段）配置颜色值
 configRatio：根据sectionIndex（每一段）配置比例（占视图的比例）,总比例等于1.
 
 返回添加的用来显示颜色的subLayer数组，这个数组可以用于removeAllColorsWithSubLayers：入参。
 */
+ (NSArray<CALayer *> *)fs_drawColorForLayer:(nonnull CALayer *)layer
                                    sections:(NSInteger)sections
                                   direction:(FSDrawDirection)direction
                                       color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                                       ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio;

+ (NSArray<CAShapeLayer *> *)drawColorForLayer:(nonnull CALayer *)layer
                        hasAddedAndReuseLayers:(nullable NSArray<CAShapeLayer *> *)priorities
                                      sections:(NSInteger)sections
                                     direction:(FSDrawDirection)direction
                                         color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                                         ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio;

+ (void)removeAllColorsWithSubLayers:(NSArray<CAShapeLayer *> *)layers;

@end

NS_ASSUME_NONNULL_END
