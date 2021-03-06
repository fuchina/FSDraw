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
+ (NSArray<CAShapeLayer *> *)fs_drawColorForLayer:(nonnull CALayer *)layer
                                         sections:(NSInteger)sections
                                        direction:(FSDrawDirection)direction
                                            color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                                            ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio;

/*
 @param
 priorities:已经添加并显示的CAShapeLayer数组，用于复用,数据来源于该View上一次执行这方法时的返回值，如果View没有添加其他的layer，直接用view.layer.subLayers也可以
 */
+ (NSArray<CAShapeLayer *> *)drawColorForLayer:(nonnull CALayer *)layer
                        hasAddedAndReuseLayers:(nullable NSArray<CAShapeLayer *> *)priorities
                                      sections:(NSInteger)sections
                                     direction:(FSDrawDirection)direction
                                         color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                                         ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio;

+ (void)removeAllColorsWithSubLayers:(NSArray<CAShapeLayer *> *)layers;

@end

NS_ASSUME_NONNULL_END
