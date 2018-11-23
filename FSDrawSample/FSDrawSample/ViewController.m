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
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 20, 200)];
    view.backgroundColor = UIColor.brownColor;
    [self.view addSubview:view];
    
    [FSDraw drawColorForLayer:view.layer sections:2 direction:FSDrawDirection_UpToBottom color:^UIColor * _Nonnull(NSInteger sectionIndex) {
        if (sectionIndex == 0) {
            return UIColor.redColor;
        }else{
            return UIColor.blackColor;
        }
    } ratio:^CGFloat(NSInteger sectionIndex) {
        if (sectionIndex == 0) {
            return 0.3;
        }else{
            return 0.7;
        }
    }];
}


@end
