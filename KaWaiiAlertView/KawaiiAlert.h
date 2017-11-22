//
//  KawaiiAlert.h
//  KaWaiiAlertView
//
//  Created by zc on 2017/11/22.
//  Copyright © 2017年 IMpBear. All rights reserved.
//

#import <UIKit/UIKit.h>

#define appWindow [UIApplication sharedApplication].keyWindow
//加入这个宏，可以省略所有 mas_ （除了mas_equalTo）
#define MAS_SHORTHAND

//加入这个宏，那么mas_equalTo就和equalTo一样的了
#define MAS_SHORTHAND_GLOBALS

#define appWindow [UIApplication sharedApplication].keyWindow
typedef void(^Action)(void);

@interface KawaiiAlert : UIView
@property(nonatomic ,copy) Action closeAction;
@property(nonatomic ,copy) Action nextAction;
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

-(void)nextActionEv:(Action)action;

-(void)showView;

-(void)hideView;

@end
