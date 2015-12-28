![](https://github.com/Liqiankun/NoNetReminder/raw/master/NoNetReminderDemo/noNetReminder.png)
Remind users When phones don't have network. It's based on [Reachability](https://github.com/tonymillion/Reachability/edit/master/README.md)<br>
当用户的设备没有网络是提醒用户。这个类是依赖于[Reachability](https://github.com/tonymillion/Reachability/edit/master/README.md)<br>


![](https://github.com/Liqiankun/NoNetReminder/raw/master/NoNetReminderDemo/notNetReminderVideo.gif)

Features
=============
- [x] Easy to use
- [x] Be showed automatically
- [x] Listen the internet state
- [x] Customize appearance
- [x] 使用简单
- [x] 可以根据网络状态自动显示
- [x] 可以监听网络状态
- [x] 自定义显示效果

How to use
====================
Darg `NoNetReminder` folder to your project. Then `import "NoNetReminder.h"`. If your project already had Reahability,delete `Reachability` folder first.<br> 
把 `NoNetReminder`文件夹添加到你的项目里边，然后`import "NoNetReminder.h"`。如果你的项目已经有了Reachability，可以把`Reachability`文件夹删除。<br>
#### ManualNoNetReminder(手动模式)

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

#### AutomaticNoNetReminder（自动模式）

```oc
-(void)viewDidDisappear:(BOOL)animated
{
    [self.remindView stopNitifiter];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame showInView:self.view];
    self.remindView.delegate = self;
}
-(void)noNetRemindView:(NoNetRemindView *)noNetRemindView isInternetReachable:(NoNetRemindViewInternetState)InternetState
{
    //Do something here.
} 


```
Delegate
==============================
NoNetRemindViewDelegate called when you use AutomaticNoNetReminder and the internet state changed. <br>
NoNetRemindViewDelegate会在使用AutomaticNoNetReminder且网络发生变化时调用。<br>
```oc
/**
 * NoNetRemindViewDelegate在使用Automatic模式时网络状态改变会调用
 *
 *  @param noNetRemindView
 *  @param InternetState   网络状态
 */
-(void)noNetRemindView:(NoNetRemindView*)noNetRemindView isInternetReachable:(NoNetRemindViewInternetState)InternetState;
```
Custom property
======================
The text of remindLabel. Default is `请检查您的网络`.
```oc
/** 提醒文字 */
@property(nonatomic,copy) NSString *remindString;
```

The image of remindImageView. Default is `wireless`.
```oc
/** 提示图片  */
@property(nonatomic,strong) UIImage *remindImage;
```

The text of reloadButton. Default is `重新加载`.
```oc
/** 按钮的title */
@property(nonatomic,copy) NSString *buttonString;
```
Requirements
==================

- Xcode 7.0 or greater
- iOS8.0(manually only) or greater

Author
===============

David Lee, qianlunli@yahoo.com
