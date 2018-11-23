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
    
    [FSDraw drawColorForView:view colors:@[UIColor.redColor,UIColor.greenColor,UIColor.blackColor] sections:@[@0.5,@0.25,@0.25]];
}


@end
