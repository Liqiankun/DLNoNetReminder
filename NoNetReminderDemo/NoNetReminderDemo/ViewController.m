//
//  ViewController.m
//  NoNetReminderDemo
//
//  Created by DavidLee on 15/12/25.
//  Copyright © 2015年 DavidLee. All rights reserved.
//

#import "ViewController.h"
#import "NoNetRemindView.h"
@interface ViewController ()
{
    NoNetRemindView *_remindView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
 
//    _remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame reloadBlock:^{
//        
//        [_remindView dismiss];
//    }];
//    
//    _remindView.remindImage = [UIImage imageNamed:@"no-wifi"];
//    
//   
//    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) /2  , 100,100 , 40)];
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"点击" forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor blueColor]];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.view addSubview:button];
    
    _remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame showInView:self.view];
    
}

-(void)buttonAction:(UIButton*)button
{
    [_remindView showInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
