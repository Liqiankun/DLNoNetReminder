NoNetReminder
==============
Remind users When phones don't have network.<br>

![](https://github.com/Liqiankun/NoNetReminder/raw/master/NoNetReminderDemo/notNetReminderVideo.gif)

Features
=============
- [x] Easy to use
- [x] Be showed automatically
- [x] Listen the internet state
- [x] Customize appearance

How to use
====================
Darg `NoNetReminder` folder to your project. Than `import "NoNetReminder.h"`.<br>

#### ManualNoNetReminder

```oc
- (void)viewDidLoad {
    [super viewDidLoad
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) /2  , 100,100 , 40)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
 
    self.view.backgroundColor = [UIColor whiteColor];

    self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame reloadBlock:^{
        [_remindView dismiss];
    }];
    //Costomize property
    self.remindView.remindImage = [UIImage imageNamed:@"no-wifi"];

}
-(void)buttonAction:(UIButton*)button
{
    [_remindView showInView:self.view];
}
```

#### AutomaticNoNetReminder

```oc
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
     self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame showInView:self.view];
    self.remindView.delegate = self;
}
-(void)noNetRemindView:(NoNetRemindView *)noNetRemindView isInternetReachable:(NoNetRemindViewInternetState)InternetState
{
    //Do something here
}

```
Delegate
==============================
NoNetRemindViewDelegate called when you use AutomaticNoNetReminder. 
```oc
/**
 * NoNetRemindViewDelegate在使用Automatic模式是会调用
 *
 *  @param noNetRemindView
 *  @param InternetState   网络状态
 */
-(void)noNetRemindView:(NoNetRemindView*)noNetRemindView isInternetReachable:(NoNetRemindViewInternetState)InternetState;
```
Requirements
==================

- Xcode 7.0 or greater
- iOS8.0(manually only) or greater
