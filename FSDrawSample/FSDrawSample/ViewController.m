//
//  ViewController.m
//  FSDrawSample
//
//  Created by fudongdong on 2018/11/23.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "ViewController.h"
#import "FSDraw.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int x = 0; x < 1; x ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100 + 0.32 * x, 100 + 0.56 * x, 30, 200)];
        view.backgroundColor = UIColor.brownColor;
        [self.view addSubview:view];
        
        NSArray *layers = [FSDraw drawColorForLayer:view.layer sections:2 direction:FSDrawDirection_UpToBottom color:^UIColor * _Nonnull(NSInteger sectionIndex) {
            if (sectionIndex == 0) {
                return UIColor.redColor;
            }else if (sectionIndex == 1){
                return UIColor.blackColor;
            }else{
                return UIColor.greenColor;
            }
        } ratio:^CGFloat(NSInteger sectionIndex) {
            return 0.3;
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            for (CAShapeLayer *layer in layers) {
                layer.strokeColor = UIColor.cyanColor.CGColor;
            }
        });
    }
    
}


@end
