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
 configRatio：根据sectionIndex（每一段）配置比例（占视图的比例）,总比例要等于1.
 */
+ (void)drawColorForLayer:(nonnull CALayer *)layer
                 sections:(NSInteger)sections
                direction:(FSDrawDirection)direction
                    color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                    ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio;

@end

NS_ASSUME_NONNULL_END
