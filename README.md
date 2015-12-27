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

 ### ManualNoNetReminder

```oc
 self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame reloadBlock:^{

        [_remindView dismiss];
  }];
  
  //Costom Property
  self.remindView.remindImage = [UIImage imageNamed:@"no-wifi"];
```

 ### AutomaticNoNetReminder

```oc
self.view.backgroundColor = [UIColor whiteColor];
self.remindView = [[NoNetRemindView alloc] initWithFrame:self.view.frame showInView:self.view];
self.remindView.delegate = self;
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
