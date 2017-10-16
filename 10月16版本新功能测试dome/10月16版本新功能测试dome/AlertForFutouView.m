//
//  AlertForFutouView.m
//  10月16版本新功能测试dome
//
//  Created by wumeng on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import "AlertForFutouView.h"


#define  RGBColor(r,g,b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]


@implementation AlertForFutouView{
    UIView *_supView;
    
    UIImageView *_imgView;
    UIButton *_showDetailBtn;//了解详情
    UIButton *_closeBtn;//关闭
}

- (instancetype)init{
    self = [super initWithFrame:CGRectMake(0.f, 0.f, kScreenWidth, kScreenHeight)];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5f;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [_supView.layer addAnimation:animation forKey:nil];
    
}

- (void)createUI{
    self.backgroundColor = [UIColor clearColor];
    UIImageView *selfBGView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, kScreenWidth, kScreenHeight)];
    selfBGView.backgroundColor = [UIColor blackColor];
    selfBGView.alpha = 0.5;
    [self addSubview:selfBGView];
    
    
    _supView = [[UIView alloc] initWithFrame:self.bounds];
    
    [self addSubview:_supView];
    
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        [_supView addSubview:_imgView];
    }
    
    if (_showDetailBtn == nil) {
        _showDetailBtn = [[UIButton alloc] init];
        [_showDetailBtn addTarget:self action:@selector(showDetailAction) forControlEvents:UIControlEventTouchUpInside];
        [_supView addSubview:_showDetailBtn];
    }
    
    if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        [_supView addSubview:_closeBtn];
    }
}

- (void)showDetailAction{
    if (self.showDetail != nil) {
        self.showDetail();
    }
}

- (void)closeAction{
    if (self.closeBlock != nil) {
        self.closeBlock();
    }
    [self removeFromSuperview];
}

- (void)setupUI{
    //1.img
    CGSize imgSize = CGSizeMake(310.f, 320.f);
    CGFloat xOfImg = (kScreenWidth - imgSize.height)/2.f;
    CGFloat yOfImg = (kScreenHeight - imgSize.width)/2.f;
    CGRect frameOfImgV = CGRectMake(xOfImg, yOfImg, imgSize.width, imgSize.height);
    _imgView.image = [UIImage imageNamed:@"bgOfAgainInviteAlertView"];
    _imgView.frame = frameOfImgV;
    
    
    //2. 了解详情btn
    CGSize btn1Size = CGSizeMake(135.f, 45.f);
    CGFloat xOfBtn1 = (kScreenWidth - btn1Size.width)/2.f;
    CGFloat YOfBtn1 = yOfImg + imgSize.height - btn1Size.height - 14.f;
    CGRect frameOfBtn1 = CGRectMake(xOfBtn1, YOfBtn1, btn1Size.width, btn1Size.height);
    _showDetailBtn.frame = frameOfBtn1;
    _showDetailBtn.layer.cornerRadius = 5.f;
    _showDetailBtn.backgroundColor = RGBColor(250, 109, 30);
    [_showDetailBtn setTitle:@"了解详情" forState:UIControlStateNormal];
    [_showDetailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _showDetailBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //关闭btn
    CGSize btn2Size = CGSizeMake(40.f, 40.f);
    CGFloat xOfBtn2 = (kScreenWidth - btn2Size.width)/2.f;
    CGFloat yOfBtn2 = yOfImg + imgSize.height + 29.f;
    CGRect frameOfBtn2 = CGRectMake(xOfBtn2, yOfBtn2, btn2Size.width, btn2Size.height);
    [_closeBtn setImage:[UIImage imageNamed:@"iconOfAgainInviteAlertView" ] forState:UIControlStateNormal];
    _closeBtn.frame = frameOfBtn2;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self setupUI];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
