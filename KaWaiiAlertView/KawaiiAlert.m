//
//  KawaiiAlert.m
//  KaWaiiAlertView
//
//  Created by zc on 2017/11/22.
//  Copyright © 2017年 IMpBear. All rights reserved.
//

#import "KawaiiAlert.h"
#import "Masonry.h"

#define XCQ_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define XCQ_RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define XCQ_BGCOLOR    XCQ_RGB(248, 248, 248, 1)
#define XCQ_MAINCOLOR  XCQ_RGB(8, 159, 251)
#define XCQ_TITLEFONT  XCQ_RGB(51, 51, 51)
#define XCQ_DETAILFONT XCQ_RGB(153, 153, 153)

#import "Masonry.h"

@implementation KawaiiAlert

-(instancetype)initWithTitle:(NSString *)title detailTitle:(NSString *)detail image:(UIImage *)images btnTitle:(NSString *)btnTitle detailHeight:(CGFloat)detailHeight{
    self =[super init];
    if (self) {
        self.images =images;
        self.title =title;
        self.detailTitle =detail;
        self.btnTitle =btnTitle;
        self.detailH = detailHeight;
        [self initUI];
    }
    return self;
}


-(void)initUI{
    CGFloat screenW =[UIScreen mainScreen].bounds.size.width;
    CGFloat screenH =[UIScreen mainScreen].bounds.size.height;
    CGFloat alertW =screenW *0.6;
    CGFloat alertH =alertW/3*4;
    
    [self setFrame:CGRectMake(0, 0, screenW, screenH)];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.shandow =[[UIView alloc]initWithFrame:self.frame];
    [self.shandow setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6]];
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeShandow)];
    [self.shandow addGestureRecognizer:tap];
    [self addSubview:self.shandow];
    
    self.alert =[[UIView alloc]init];
    [self.alert setBackgroundColor:[UIColor whiteColor]];
    self.alert.layer.cornerRadius = 10;
    self.alert.layer.masksToBounds =YES;
    [self addSubview:self.alert];
    
#pragma mark -- configUI
    UIButton *action =[[UIButton alloc]init];
    action.layer.cornerRadius = 8;
    [action.titleLabel setFont:[UIFont systemFontOfSize:16]];
    action.layer.masksToBounds =YES;
    [action setBackgroundColor:XCQ_MAINCOLOR];
    [action setTitle:self.btnTitle forState:UIControlStateNormal];
    [action addTarget:self action:@selector(nextActionEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.alert addSubview:action];
    
    UIButton *action2 =[[UIButton alloc]init];
    action2.layer.cornerRadius = 8;
    [action2.titleLabel setFont:[UIFont systemFontOfSize:16]];
    action2.layer.masksToBounds =YES;
    [action2 setBackgroundColor:[UIColor lightGrayColor]];
    [action2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [action2 setTitle:@"取消" forState:UIControlStateNormal];
    [action2 addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
    [self.alert addSubview:action2];
    
    UILabel *detailLab =[[UILabel alloc]init];
    [detailLab setNumberOfLines:4];
    [detailLab setFont:[UIFont systemFontOfSize:15]];
    [detailLab setTextColor:XCQ_DETAILFONT];
    [detailLab setTextAlignment:NSTextAlignmentCenter];
    [detailLab setText:self.detailTitle];
    [self.alert addSubview:detailLab];
    
    UILabel *title =[[UILabel alloc]init];
    [title setFont:[UIFont boldSystemFontOfSize:18]];
    [title setTextColor:XCQ_TITLEFONT];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:self.title];
    [self.alert addSubview:title];
    
    UIImageView *imageV =[[UIImageView alloc]init];
    [imageV setImage:self.images];
    [imageV setContentMode:UIViewContentModeScaleAspectFit];
    [self.alert addSubview:imageV];
    
#pragma mark -- autoLayout
    
    [self.alert mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(alertW, alertH));
        
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [action mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.alert.mas_bottom).with.offset(-15);
        make.left.equalTo(action2.mas_right).with.offset(15);
        make.right.equalTo(self.alert.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(action2) ;
    }];
    
    [action2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.alert.mas_bottom).with.offset(-15);
        make.left.equalTo(self.alert.mas_left).with.offset(15);
        make.right.equalTo(action.mas_left).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(action.top).with.offset(-10);
        make.left.equalTo(self.alert.mas_left).with.offset(20);
        make.height.equalTo(self.detailH);
        make.right.equalTo(self.alert.mas_right).with.offset(-20);
    }];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.alert.width);
        make.bottom.equalTo(title.top).with.offset(-14);
        make.left.equalTo(0);
        make.top.equalTo(self.alert.top);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(detailLab.top).with.offset(0);
        make.left.equalTo(detailLab.left);
        make.height.equalTo(25);
        make.width.equalTo(detailLab.width);
    }];
    
    
}

-(void)nextActionEvent{
    //self.nextAction();
    NSLog(@"点击了确定") ;
}

-(void)closeShandow{
    [self removeFromSuperview];
}

//显示
- (void)showView {
    [appWindow addSubview:self];
    self.alpha = 1.0;
    self.shandow.alpha = 1.0;
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    animation.values = @[@(M_PI/64),@(-M_PI/64),@(M_PI/64),@(0)];
    animation.duration = 0.5;
    [animation setKeyPath:@"transform.rotation"];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.alert.layer addAnimation:animation forKey:@"shake"];
}

//隐藏
- (void)hideView {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
        self.shandow.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)nextActionEv:(Action)action{
    self.nextAction =action;
}
@end
