//
//  BlockAlertView.h
//  BlockAlertView_Demo
//
//  Created by mac on 15/7/3.
//  Copyright (c) 2015年 Baby_V5. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ButtonBaseTag 111

#define kScreenW   [UIScreen mainScreen].bounds.size.width
#define kScreenH   [UIScreen mainScreen].bounds.size.height

typedef void(^MyBlock)(NSInteger index);

@interface BlockAlertView : UIView
{
    
    UILabel*_titleLable;//标题
    
    UIButton*_leftBtn,*_rightBtn;//按钮

    MyBlock _block;

}
-(instancetype)initWithTitle:(NSString*)title leftButtonTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle block:(void(^)(NSInteger index))block;


-(void)show;

@end
