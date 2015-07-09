//
//  ViewController.m
//  BlockAlertView_Demo
//
//  Created by mac on 15/7/3.
//  Copyright (c) 2015年 Baby_V5. All rights reserved.
//

#import "ViewController.h"

#import "BlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

-(IBAction)btnAction:(id)sender{

    
    __weak ViewController*weakSelf = self;
    
    BlockAlertView*alert = [[BlockAlertView alloc]initWithTitle:@"自定义AlertView⚠" leftButtonTitle:@"Left(确认)" rightTitle:@"Right(取消)" block:^(NSInteger index) {
        
//        __strong ViewController* strongSelf = weakSelf;
        
        index == 0?NSLog(@"👈⬅️"):NSLog(@"➡️🐱");
        
//        [strongSelf test];
        
        [weakSelf test];
        
    }];
    
    [alert show];
    
}

-(void)test{

    NSLog(@"block");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
