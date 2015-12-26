//
//  NoNetRemindView.h
//  NoNetReminderDemo
//
//  Created by DavidLee on 15/12/25.
//  Copyright © 2015年 DavidLee. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NoNetRemindView : UIView

/** 提醒文字 */
@property(nonatomic,copy) NSString *remindString;

/** 提示图片  */
@property(nonatomic,strong) UIImage *remindImage;

/** 按钮的title */
@property(nonatomic,copy) NSString *buttonString;

/** 点击reloadButton的block */
@property(nonatomic,copy) void (^reloadButtonClickBlock)();



/** 初始化方法 */
-(id)initWithFrame:(CGRect)frame reloadBlock:(void (^)())block;

/** 自动检测网络情况 */
-(id)initWithFrame:(CGRect)frame showInView:(UIView*)view;

/** 添加到父视图 */
-(void)showInView:(UIView*)view;

/** 从父视图上删除 */
-(void)dismiss;

@end

