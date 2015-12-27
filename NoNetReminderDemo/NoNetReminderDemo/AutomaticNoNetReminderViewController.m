//
//  AutomaticNoNetReminderViewController.m
//  NoNetReminderDemo
//
//  Created by DavidLee on 15/12/26.
//  Copyright © 2015年 DavidLee. All rights reserved.
//

#import "AutomaticNoNetReminderViewController.h"
#import "NoNetRemindView.h"
@interface AutomaticNoNetReminderViewController ()<NoNetRemindViewDelegate>

@property(nonatomic,strong)NoNetRemindView *remindView;
@property(nonatomic,strong)UILabel *internetLabel;
@end

@implementation AutomaticNoNetReminderViewController

-(void)viewDidDisappear:(BOOL)animated
{
    [self.remindView stopNotifier];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame showInView:self.view];
    self.remindView.delegate = self;
}
-(void)noNetRemindView:(NoNetRemindView *)noNetRemindView isInternetReachable:(NoNetRemindViewInternetState)InternetState
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
