# 资源下载

## iOS资源下载
​
### 开发工具包（SDK）

使用微信分享、登录、收藏、支付等功能需要的库以及文件。通过CocoaPods集成（详情查看接入流程[接入流程](https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&id=1417694084&token=&lang=zh_CN)）或点击下载以下开发工具包：

iOS开发工具包[iOS开发工具包](https://res.wx.qq.com/op_res/dZ5aYcaO5QRVPNvVrZNUqgUPVyRYCwV41TdwFrQa3ckR4uV_9immy_YJN886Z0LR)（1.8.2版本，包含支付功能）。

iOS开发工具包[iOS开发工具包](https://res.wx.qq.com/op_res/oFcxbhD3PhOQ9sivBE8OU8sOxrsZR7jkdpHz_B2Uoq_8nVVf7bEHKBZsIvL_YKmI)（1.8.2版本，不包含支付功能）。

使用微信语音识别接口、语音合成接口。点击下载[语音SDK+Demo+开发文档](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WXVoice_iOS_3.0.2.zip)

使用微信图像识别接口。点击下载[图像SDK+Demo+开发文档](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WXImg_iOS_2.0.2.zip)

使用微信卡券功能接口。点击下载[卡券SDK+开发文档](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WXTicket_iOS.zip)

### 范例代码

包含了一个完整的范例工程，该范例的使用可以参阅iOS平台上手指南。点击下载 [范例代码](https://res.wx.qq.com/op_res/xZSl4RKvQPs3J-YzgOY9Pv-_dbfxeGA36hPwllV1KpR5qwKRNo4Q5T8MKHxjhyIE)

## Android资源下载

### 开发工具包（SDK）

使用微信分享、登录、收藏、支付等功能需要的库以及文件

Android Studio环境下：已改用gradle形式，发布到[jcenter](https://bintray.com/wechat-sdk-team/maven)，请开发者使用gradle来编译、更新微信SDK。

在build.gradle文件中，添加如下依赖即可：

```js
dependencies {

compile 'com.tencent.mm.opensdk:wechat-sdk-android-with-mta:+'

}
```

或

```js
dependencies {

compile 'com.tencent.mm.opensdk:wechat-sdk-android-without-mta:+'

}
```

（其中，前者包含统计功能）

点击下载 Android开发工具包 [Android开发工具包](https://bintray.com/wechat-sdk-team/maven)

使用微信语音识别接口、语音合成接口。点击下载 [语音SDK+Demo+开发文档](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WXVoice_Android_3.0.2.zip)

使用微信图像识别接口。点击下载 [图像SDK+Demo+开发文档](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WXImg_Android_2.0.2.zip)

使用微信卡券功能接口。点击下载 [卡券SDK+开发文档](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WXTicket_Android.zip)

### 范例代码

包含了一个完整的范例工程。该范例的使用可以参阅Android平台上手指南：HelloWeixin@Android。[点击下载](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WeChatSDK_sample_Android_5.0.2.rar)

### 签名生成工具

用于获取安装到手机的第三方应用签名的apk包。点击下载 [签名生成工具](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/Gen_Signature_Android2.apk)

使用微信语音识别接口、语音合成接口。点击下载 语音SDK+Demo+开发文档
使用微信图像识别接口。点击下载 图像SDK+Demo+开发文档
使用微信卡券功能接口。点击下载 卡券SDK+开发文档

范例代码
包含了一个完整的范例工程。该范例的使用可以参阅Android平台上手指南：HelloWeixin@Android。点击下载

签名生成工具
用于获取安装到手机的第三方应用签名的apk包。点击下载 签名生成工具

## WP8资源下载

### 开发工具包（SDK）

开发第三方应用所需要的库以及文件。[点击下载](https://open.weixin.qq.com/zh_CN/htmledition/res/dev/download/sdk/WinPhone_SDK.zip)

### 范例代码

包含了一个完整的范例工程。该范例的使用可以参阅WP8平台上手指南：HelloWeixin@WP8。[点击下载](https://open.weixin.qq.com/zh_CN/htmledition/res/dev/download/sdk/WeChatSDK_sample_WP8.zip)

## 设计资源下载
为了让开发者在使用微信开放平台的接口功能时，能够保持一致的用户体验，建议开发者使用标准设计资源来进行功能实现。

微信提供了以下几种标准的Logo、Icon、功能按钮标识，开发者可下载后使用。 下载方式：鼠标移到所需的图片上，点击右键选择“图片另存为...”，保存即可。

### 微信Logo
      

64 * 64 48 * 48 32 * 32 16 * 16

### 微信Icon
      

64 * 64 48 * 48 32 * 32 24 * 24

### 微信Button

在实现微信登录功能时，请使用微信的标准图标：

    

48 * 48 32 * 32 24 * 24

### 微信公众号登录授权页入口的统一按钮样式

在开发者通过公众号服务为公众号解决垂直行业需求时，若需从自身网站跳转至公众号授权页，请使用下述统一按钮样式和效果，保证统一体验：

    

250 * 50 178 * 32 24 * 24

### 微信分享

分享到微信朋友会话时，请使用微信的标准图标：

 

分享到微信朋友圈时，请使用朋友圈的标准图标：



### 微信收藏

在实现微信收藏功能时，请使用微信收藏的标准图标：

