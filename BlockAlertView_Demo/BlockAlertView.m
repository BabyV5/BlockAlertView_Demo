//
//  BlockAlertView.m
//  BlockAlertView_Demo
//
//  Created by mac on 15/7/3.
//  Copyright (c) 2015年 Baby_V5. All rights reserved.
//

#import "BlockAlertView.h"

@implementation BlockAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithTitle:(NSString*)title leftButtonTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle block:(void(^)(NSInteger index))block{

    if (self = [super init]) {
      
        [self creatSubViewsWithTitle:title leftButtonTitle:leftTitle rightTitle:rightTitle block:block];
        
    }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1];
    
    self.layer.borderWidth = 1;
    
    self.layer.borderColor = [[UIColor grayColor]CGColor];
    
    self.layer.shadowOffset = CGSizeMake(2, 2);
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    self.layer.shadowOpacity = .7;
    
    self.layer.cornerRadius = 5;
    
    _titleLable.layer.borderWidth = .3;

    _titleLable.layer.borderColor = [[UIColor cyanColor]CGColor];

    _titleLable.layer.cornerRadius = 3;
    
    _titleLable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _leftBtn.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:.8];
    
    _rightBtn.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:.8];

    _leftBtn.layer.borderWidth = .2;
    
    _leftBtn.layer.borderColor = [[UIColor grayColor]CGColor];
    
    _rightBtn.layer.borderWidth = .2;
    
    _rightBtn.layer.borderColor = [[UIColor grayColor]CGColor];
    
    
}


-(void)creatSubViewsWithTitle:(NSString*)title leftButtonTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle block:(void(^)(NSInteger index))block{

    //回调
    _block = block;
    
      self.frame = CGRectMake(50, 100, kScreenW-100, 200);
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-100)];

    _titleLable.textAlignment = NSTextAlignmentCenter;
    
    _titleLable.text = title;
    
    [self addSubview:_titleLable];
    
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _leftBtn.frame = CGRectMake(0,100, self.frame.size.width/2, 100);
    
    [_leftBtn setTitle:leftTitle forState:UIControlStateNormal];
    
    _leftBtn.tag = ButtonBaseTag;
    
    [_leftBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_leftBtn];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _rightBtn.frame = CGRectMake(self.frame.size.width/2,100, self.frame.size.width/2, 100);
    
    [_rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    
    _rightBtn.tag = ButtonBaseTag+1;
    
    [_rightBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_rightBtn];
    

}

//展示AlertView
-(void)show{
    
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    
    [win addSubview:self];
    
    self.transform = CGAffineTransformMakeScale(.7, .7);
    
    [UIView animateWithDuration:.15 animations:^{
        
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.15 animations:^{
            
            self.transform = CGAffineTransformIdentity;
            
        }];
        
    }];
}

-(void)done:(UIButton*)btn{

    _block(btn.tag-ButtonBaseTag);
    
    if (btn.tag == ButtonBaseTag+1) {

        [self disAppear];
    }
}

//消失
-(void)disAppear{

    [UIView animateWithDuration:.35 animations:^{
        
        self.transform = CGAffineTransformScale(self.transform, 3.2, 3.2);
        
        self.alpha = .1;
        
    }completion:^(BOOL finished) {
        
            [self removeFromSuperview];
        
    }];
    

}

@end
