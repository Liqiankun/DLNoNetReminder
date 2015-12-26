//
//  NoNetRemindView.m
//  NoNetReminderDemo
//
//  Created by DavidLee on 15/12/25.
//  Copyright © 2015年 DavidLee. All rights reserved.
//

#import "NoNetRemindView.h"
#import "Reachability.h"

static CGFloat remindImageViewWidth =  150;
static CGFloat remindImageViewHeight = 120;

static CGFloat remindLabelWidth = 200;
static CGFloat remindLabelHeight = 20;

static CGFloat reloadButtonWidth = 100;
static CGFloat reloadButtonHeight = 30;


@interface NoNetRemindView()

@property(nonatomic,strong)UIImageView *remindImageView;
@property(nonatomic,strong) UIButton *reloadButton;
@property(nonatomic,strong) UILabel *remindLabel;
@property(nonatomic,strong) UIView *supView;
@property(nonatomic,strong) Reachability *reach;
@end


@implementation NoNetRemindView

-(id)initWithFrame:(CGRect)frame showInView:(UIView*)view
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
        self.reloadButton.hidden = YES;
        [self setNetNotification:view];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame reloadBlock:(void (^)())block
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor]; 
        self.reloadButtonClickBlock = block;
        [self setUp];
    }
    
    return self;
}

-(void)showInView:(UIView *)view
{
    [view addSubview:self];
}

-(void)dismiss
{
    [self removeFromSuperview];
}

-(void)setUp
{
    [self remindImageView];
    [self remindLabel];
    [self reloadButton];
}

-(void)setNetNotification:(UIView*)view
{
    _supView = view;
    self.reach = [Reachability reachabilityForInternetConnection];
    
    if (![self.reach isReachable]) {
        if ([self.delegate respondsToSelector:@selector(noNetRemindView:isInternetReachable:)]) {
            [self.delegate noNetRemindView:self isInternetReachable:NoNetRemindViewInternetUnreahable];
        }
        [self showInView:view];
    }else{
        if ([self.delegate respondsToSelector:@selector(noNetRemindView:isInternetReachable:)]) {
            [self.delegate noNetRemindView:self isInternetReachable:NoNetRemindViewInternetReachable];
        }
    }

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [self.reach startNotifier];
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability *reach = [note object];
    if (reach == self.reach) {
        if ([reach isReachable]) {
            if ([self.delegate respondsToSelector:@selector(noNetRemindView:isInternetReachable:)]) {
                [self.delegate noNetRemindView:self isInternetReachable:NoNetRemindViewInternetReachable];
            }
            [self dismiss];
        }else{
            if ([self.delegate respondsToSelector:@selector(noNetRemindView:isInternetReachable:)]) {
                [self.delegate noNetRemindView:self isInternetReachable:NoNetRemindViewInternetUnreahable];
            }
            [self showInView:self.supView];
        }
    }
}

-(void)setRemindString:(NSString *)remindString
{
    _remindString = remindString;
    _remindLabel.text = remindString;
}

-(void)setRemindImage:(UIImage *)remindImage
{
    _remindImage = remindImage;
    _remindImageView.image = remindImage;
}

-(void)setButtonString:(NSString *)buttonString
{
    _buttonString = buttonString;
    [_reloadButton setTitle:buttonString forState:UIControlStateNormal];
}

-(void)layoutSubviews
{
    [super layoutSubviews];

   
    self.remindLabel.frame = CGRectMake(0, 0, remindLabelWidth, remindLabelHeight);
    self.remindLabel.center = CGPointMake(self.center.x, self.center.y);
    [self addSubview:self.remindLabel];

    self.remindImageView.frame = CGRectMake(0, 0, remindImageViewWidth, remindImageViewHeight);
    self.remindImageView.center = CGPointMake(self.center.x , self.center.y - (remindImageViewHeight / 2) - (remindLabelHeight / 2));
    [self addSubview:self.remindImageView];
    
    self.reloadButton.frame = CGRectMake(0, 0, reloadButtonWidth, reloadButtonHeight);
    self.reloadButton.center = CGPointMake(self.center.x , self.center.y + remindLabelHeight + reloadButtonHeight / 1.5);
    [self addSubview:self.reloadButton];

}


-(UIImageView*)remindImageView
{
    if (!_remindImageView) {
        self.remindImageView = [[UIImageView alloc] init];
        self.remindImageView.image = [UIImage imageNamed:@"wireless"];
        self.remindImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.remindImageView sizeToFit];
    }
    return _remindImageView;
}

-(UIButton*)reloadButton
{
    if (!_reloadButton) {
        self.reloadButton = [[UIButton alloc] init];
        [self.reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [self.reloadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.reloadButton.layer.borderWidth = 1;
        self.reloadButton.layer.cornerRadius = 5;
        self.reloadButton.layer.borderColor = [[UIColor blackColor] CGColor];
        [self.reloadButton addTarget:self action:@selector(reloadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _reloadButton;
}


-(UILabel*)remindLabel
{
    if (!_remindLabel) {
        self.remindLabel = [[UILabel alloc] init];
        self.remindLabel.text = @"请检查您的网络";
        //self.remindLabel.font = [UIFont boldSystemFontOfSize:15];
        self.remindLabel.textAlignment = NSTextAlignmentCenter;
        [self.remindLabel sizeToFit];
    }
    
    return _remindLabel;
}

-(void)reloadButtonAction:(UIButton*)button
{
    if (self.reloadButtonClickBlock) {
        self.reloadButtonClickBlock();
    }
}
































/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
