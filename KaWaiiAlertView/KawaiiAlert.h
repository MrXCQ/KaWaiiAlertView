//
//  KawaiiAlert.h
//  KaWaiiAlertView
//
//  Created by zc on 2017/11/22.
//  Copyright © 2017年 IMpBear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

typedef void(^SureAction)(void);

@interface KawaiiAlert : UIView
@property(nonatomic ,copy) SureAction closeAction;
@property(nonatomic ,copy) SureAction nextAction;
@property(nonatomic ,copy) NSString *title;
@property(nonatomic ,copy) NSString *detailTitle;
@property(nonatomic ,strong) UIImage *images;
@property(nonatomic ,strong) NSString *btnTitle;
@property(nonatomic ,strong) UIView *shandow , *alert ;
@property(nonatomic ,assign) float detailH;

-(instancetype)initWithTitle:(NSString *)title
                 detailTitle:(NSString *)detail
                       image:(UIImage *)images
                    btnTitle:(NSString *)btnTitle
                detailHeight:(CGFloat)detailHeight;

-(void)nextActionEv:(SureAction)action;

-(void)showView;

-(void)hideView;

@end
