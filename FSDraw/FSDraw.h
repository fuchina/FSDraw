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

// 让视图显示分段的各种颜色
+ (void)drawColorForView:(UIView *)view colors:(NSArray<UIColor *> *)colors sections:(NSArray<NSNumber *> *)secitons direction:(FSDrawDirection)direction;

@end

NS_ASSUME_NONNULL_END