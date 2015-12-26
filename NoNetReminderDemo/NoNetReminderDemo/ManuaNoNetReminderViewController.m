//
//  ManuaNoNetReminderViewController.m
//  NoNetReminderDemo
//
//  Created by DavidLee on 15/12/26.
//  Copyright © 2015年 DavidLee. All rights reserved.
//

#import "ManuaNoNetReminderViewController.h"
#import "NoNetRemindView.h"
@interface ManuaNoNetReminderViewController ()

@property(nonatomic,strong)NoNetRemindView *remindView;

@end

@implementation ManuaNoNetReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame reloadBlock:^{

        [_remindView dismiss];
    }];

    self.remindView.remindImage = [UIImage imageNamed:@"no-wifi"];



    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) /2  , 100,100 , 40)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
   
}
-(void)buttonAction:(UIButton*)button
{
    [_remindView showInView:self.view];
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
