:wxopen:`iOS接入指南 <1417694084>`
=======================================

注：本文为微信iOS终端SDK新手使用教程，只涉及教授SDK的使用方法，默认读者已经熟悉XCode开发工具的基本使用方法，以及具有一定的编程知识基础等。

1.向微信注册你的应用程序id
----------------------------------

请到 开发者应用登记页面 进行登记，登记并选择移动应用进行设置后，将获得AppID，可立即用于开发。但应用登记完成后还需要提交审核，只有审核通过的应用才能正式发布使用。

2.下载微信终端SDK文件
----------------------------------

SDK文件包括 libWeChatSDK.a，WXApi.h，WXApiObject.h 三个。
如选用手动集成，请前往“资源下载页”下载最新SDK包

3.搭建开发环境
----------------------------------

3.1 通过CocoaPods集成
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[1] 在XCode中建立你的工程。

[2] 在工程的Podfile里面添加以下代码：

pod 'WechatOpenSDK'
保存并执行pod install,然后用后缀为.xcworkspace的文件打开工程。

注意:

命令行下执行pod search WechatOpenSDK,如显示的WechatOpenSDK版本不是最新的，则先执行pod repo update操作更新本地repo的内容

关于CocoaPods的更多信息请查看 CocoaPods官方网站 。

[3] 在Xcode中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“URL type“添加“URL scheme”为你所注册的应用程序id（如下图所示）。



Xcode设置URL scheme

[4] 在你需要使 用微信终端API的文件中import WXApi.h 头文件，并增加 WXApiDelegate 协议。

.. code:: Objective-C

  #import <UIKit/UIKit.h>
  #import "WXApi.h"

  @interface AppDelegate : UIResponder<UIApplicationDelegate, WXApiDelegate>

  @property (strong, nonatomic) UIWindow *window;

  @end

常见问题：

对于之前SDK放在主工程目录下，切换成CocoaPods的形式，执行pod install 之后，出现


* Use the $(inherited) flag, or

* Remove the build settings from the target.

解决方法是 把工程target中的build Setting里面PODS_ROOT的值替换成$(inherited)

Other Linker Flags中 -all_load 替换成$(inherited)





3.2 手动集成
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[1] 在XCode中建立你的工程。

[2] 将SDK文件中包含的 libWeChatSDK.a，WXApi.h，WXApiObject.h 三个文件添加到你所建的工程中（如下图所示，建立了一个名为Test 的工程，并把以上三个文件添加到Test文件夹下）。

(注：请使用xCode4.5及以上版本)



[3]微信开放平台新增了微信模块用户统计功能，便于开发者统计微信功能模块的用户使用和活跃情况。开发者需要在工程中链接上:SystemConfiguration.framework, libz.dylib, libsqlite3.0.dylib, libc++.dylib, Security.framework, CoreTelephony.framework, CFNetwork.framework，CoreGraphics.framework。

[4] 在你的工程文件中选择Build Setting，在"Other Linker Flags"中加入"-Objc -all_load"，在Search Paths中添加 libWeChatSDK.a ，WXApi.h，WXApiObject.h，文件所在位置（如下图所示）。

(注：请使用xCode4.5及以上版本)




[5] 在Xcode中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“URL type“添加“URL scheme”为你所注册的应用程序id（如下图所示）。



Xcode设置URL scheme

[6] 在Xcode中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“LSApplicationQueriesSchemes“添加weixin（如下图所示）。



[7] 在你需要使 用微信终端API的文件中import WXApi.h 头文件，并增加 WXApiDelegate 协议。

.. code:: Objective-C

  #import <UIKit/UIKit.h>
  #import "WXApi.h"

  @interface AppDelegate : UIResponder<UIApplicationDelegate, WXApiDelegate>

  @property (strong, nonatomic) UIWindow *window;

  @end

4.在代码中使用开发工具包
----------------------------

[1] 要使你的程序启动后微信终端能响应你的程序，必须在代码中向微信终端注册你的id。（如下图所示，在 AppDelegate 的 didFinishLaunchingWithOptions 函数中向微信注册id）。

.. code:: Objective-C

  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      //向微信注册
      [WXApi registerApp:@"wxd930ea5d5a258f4f"];
      return YES;
  }

[2] 重写AppDelegate的handleOpenURL和openURL方法：

.. code:: Objective-C

  - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
      return  [WXApi handleOpenURL:url delegate:self];
  }

  - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
      return [WXApi handleOpenURL:url delegate:self];
  }

[3] 现在，你的程序要实现和微信终端交互的具体请求与回应，因此需要实现WXApiDelegate协议的两个方法：

.. code:: Objective-C

  >-(void) onReq:(BaseReq*)reqonReq

是微信终端向第三方程序发起请求，要求第三方程序响应。第三方程序响应完后必须调用sendRsp返回。在调用sendRsp返回时，会切回到微信终端程序界面。

.. code:: Objective-C

  >-(void) onResp:(BaseResp*)resp

如果第三方程序向微信发送了sendReq的请求，那么onResp会被回调。sendReq请求调用后，会切到微信终端程序界面。

具体在此两方法中所要完成的内容由你定义，具体可参考微信开发工具包中的SDK Sample Demo源码。

[4] 如果你的程序要发消息给微信，那么需要调用WXApi的sendReq函数：

.. code:: Objective-C

  >-(BOOL) sendReq:(BaseReq*)req

其中req参数为SendMessageToWXReq类型。

需要注意的是，SendMessageToWXReq的scene成员，如果scene填WXSceneSession，那么消息会发送至微信的会话内。如果scene填WXSceneTimeline，那么消息会发送至朋友圈。如果scene填WXSceneFavorite,那么消息会发送到“我的收藏”中。scene默认值为WXSceneSession。


至此，你已经能使用微信终端SDK的API内容了。如果想更详细了解每个API函数的用法，请查阅 官网API文档 或自行下载阅读微信SDK Sample Demo源码。

微信 :download:`SDK Sample Demo <path>` 源码

