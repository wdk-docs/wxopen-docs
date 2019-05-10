安卓常见问题
====================================

Q：应用没有审核通过能不能进行调试？

A：iOS应用只要申请并获取到AppID就可进行调试。Android应用除了获取AppID外，应用还要通过审核，否则无法调起微信进行分享，并且需要在网站上填写包名和签名两个字段，签名可使用签名生成工具获取。如有特殊需要，请自行参见《Signature的生成方法》生成。

Q：为什么代码混淆之后，会导致无法弹出发送第三方消息的确认框？

A：需要在混淆配置文件proguard.cfg中，增加如下代码:

-keep class com.tencent.mm.opensdk.** {

*;

}

-keep class com.tencent.wxop.** {

*;

}

-keep class com.tencent.mm.sdk.** {

*;

}

Q：为什么用网上下载的SDK Demo工程直接运行到设备上，一开始可以正常调试，后面就不可以？

A：这里是由于身份校验失败造成的，要运行SDK Demo工程，可以参考文档《如何运行SDK Demo工程》，同时请下载更新最新版的SDK Sample。

Q：为什么日志里面有时候会出现setup profile from amm_manifest.xml failed错误？

A：这是由于SDK加载内部配置文件失败造成的，不影响SDK的正常使用，可以忽略这个错误日志。

Q：调用wxapi.sendReq接口，返回true，但微信客户端并未启动，请检查以下几项：

A: 1）微信是否安装

2）调用时的Apk包名和签名是否与开放平台填写的一致，签名请使用该工具：点击下载，常发生在安装了debug版本又安装release版本情况，确定包名签名后卸载微信重装或者清除微信数据再做测试

3）检查发送时的缩略图大小是否超过32k

4）能够调起微信到选择好友列表，但是点击发送后无响应，请检查proguard配置是否对微信SDK代码进行了混淆，建议不要对SDK对混淆，参考以下proguard配置：

-keep class com.tencent.mm.opensdk.** {

*;

}

-keep class com.tencent.wxop.** {

*;

}

-keep class com.tencent.mm.sdk.** {

*;

}

更多问题，请邮件联系 weixin-open@qq.com 或关注官方微博 http://t.qq.com/weixin_app 的最新动态。

