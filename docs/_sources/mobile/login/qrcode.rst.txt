移动应用扫码登录
=========================

功能概述

扫码登录能力，指的是开发者可在移动应用内使用此能力，拉取二维码，用户使用微信客户端扫描二维码后可以登录此移动应用。此能力可被应用在多设备登录、智能硬件、电视盒子等场景。



iOS扫码授权获得Code流程

步骤一：请求函数

(BOOL)Auth:(NSString *)appId nonceStr:(NSString *)nonceStr timeStamp:(NSString*)timeStamp scope:(NSString *) scope signature:(NSString *)signature schemeData:(NSString *)schemeData;
参数说明

参数	是否必须	说明
appid	是	应用唯一标识
scope	是	应用授权作用域，拥有多个作用域用逗号（,）分隔，APP所拥有的scope
nonceStr	是	一个随机的尽量不重复的字符串，用来使得每次的signature不同
timeStamp	是	时间戳
signature	是	签名
schemeData	否	会在扫码后拼在scheme后


步骤二：监听二维码回调，回调的时候显示二维码

 (void)onAuthGotQrcode:(UIImage *)image;  //得到二维码
步骤三：用户确认登录之后回调authCode

-(void)onAuthFinish:(int)errCode AuthCode:(NSString *)authCode;    //成功登录


Android扫码授权流程

流程

首先APP通过IDiffDevOAuth.auth()接口发起授权，然后在OAuthListener.onAuthGotQrcode()回调接口中获取二维码，在APP中展示二维码，最后用户通过微信扫码，授权.


接口

IDiffDevOAuth

boolean auth(String appId, String scope, String noncestr, String timestamp, String signature, OAuthListener listener)
参数说明

参数	是否必须	说明
appId	是	应用唯一标识
scope	是	应用授权作用域，拥有多个作用域用逗号（,）分隔，APP所拥有的scope
noncestr	是	一个随机的尽量不重复的字符串，用来使得每次的signature不同
timestamp	是	时间戳
signature	是	签名
listener	是	授权流程，回调接口


OAuthListener

/**
 * auth之后返回的二维码接口
 *
 * @param qrcodeImgPath 废弃
 * @param imgBuf 二维码图片数据
 */
void onAuthGotQrcode(String qrcodeImgPath, byte[] imgBuf);

/**
 * 用户扫描二维码之后，回调改接口
 */
void onQrcodeScanned();

/**
 * 用户点击授权后，回调改接口
 */
void onAuthFinish(OAuthErrCode errCode, String authCode);


SDK扫码登录签名算法

获取Ticket

生成签名之前必须先获取对应的sdk_ticket。

sdk_ticket是用于生成签名的临时票据。正常情况下，sdk_ticket的有效期为7200秒，通过access_token来获取。由于获取sdk_ticket的api调用次数非常有限，频繁刷新sdk_ticket会导致api调用受限，影响自身业务，开发者需在自己的服务存储与更新sdk_ticket。

1.参考以下文档，使用APP的Appid和AppSecret获取access_token获取access_token,：

https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421140183

2.用第一步拿到的access_token 采用http GET方式请求获得sdk_ticket：

https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=2

成功返回如下JSON：

{
    "errcode":0,

    "errmsg":"ok",

    "ticket":"-p3A5zVP95IuafPhzA6lRR95_F9nZEBfJ_n4E9t8ZFWKJTDPOwccVQhHCwDBmvLkayF_jh-m9HOExhumOziDWA",

    "expires_in":7200

}
获得sdk_ticket之后，就可以生成扫码登录的签名了。



签名生成

签名生成规则如下：

参与签名的字段包括第三方appid，noncestr（随机字符串）, 有效的sdk_ticket, timestamp（时间戳） 。

对所有待签名参数按照字段名的ASCII 码从小到大排序（字典序）后，使用URL键值对的格式（即key1=value1&key2=value2…）拼接成字符串string1。这里需要注意的是所有参数名均为小写字符。对string1作sha1加密，字段名和字段值都采用原始值，不进行URL 转义。即signature=sha1(string1)。



示例：

appid=appid

noncestr=noncestr

sdk_ticket=-p3A5zVP95IuafPhzA6lRR95_F9nZEBfJ_n4E9t8ZFWKJTDPOwccVQhHCwDBmvLkayF_jh-m9HOExhumOziDWA

timestamp=1417508194

1.对所有待签名参数按照字段名的ASCII 码从小到大排序（字典序）后，使用URL键值对的格式（即key1=value1&key2=value2…）拼接成字符串string1：
appid=appid&noncestr=noncestr&sdk_ticket=-p3A5zVP95IuafPhzA6lRR95_F9nZEBfJ_n4E9t8ZFWKJTDPOwccVQhHCwDBmvLkayF_jh-m9HOExhumOziDWA&timestamp=1417508194

2.对string1进行sha1签名，得到signature：
429eaaa13fd71efbc3fd344d0a9a9126835e7303

