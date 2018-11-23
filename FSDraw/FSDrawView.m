//
//  FSDrawView.m
//  FSDrawSample
//
//  Created by fudongdong on 2018/11/23.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSDrawView.h"

@implementation FSDrawView

- (void)drawColorWithSections:(NSInteger)sections
                    direction:(FSDrawDirection)direction
                        color:(nonnull UIColor *(^)(NSInteger sectionIndex))configColor
                        ratio:(CGFloat(^)(NSInteger sectionIndex))configRatio{
    
    NSArray *layers = [FSDraw drawColorForLayer:self.layer sections:sections direction:direction color:configColor ratio:configRatio];
    
}

- (void)removeAllColors{
    [FSDraw removeAllColorsWithSubLayers:self.colorLayers];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
