//
//  AlertForFutouView.h
//  10月16版本新功能测试dome
//
//  Created by wumeng on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define  kScreenHeight [UIScreen mainScreen].bounds.size.height
#define  kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface AlertForFutouView : UIView

@property (nonatomic ,copy) void (^ closeBlock)(void);//关闭显示block
@property (nonatomic ,copy) void (^ showDetail)(void);//显示详情block

/**
 弹出显示
 */
- (void)show;


@end
