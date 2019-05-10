OS开发手册
======================

微信分享及收藏是指第三方App通过接入该功能，让用户可以从App分享文字、图片、音乐、视频、网页、小程序至微信好友会话、朋友圈或添加到微信收藏。

微信分享及收藏功能已向全体开发者开放，开发者在微信开放平台帐号下申请App并通过审核后，即可获得微信分享及收藏权限。

微信分享及收藏目前支持文字、图片、音乐、视频、网页、小程序共六种类型（海外应用支持网页、小程序类型分享）。开发者在App中在集成微信SDK后，可调用接口实现，以下依次是文字、图片、音乐、视频、网页、小程序类型分享的示例。


WXMediaMessage （微信媒体消息内容）说明

字段	类型	含义	备注
title	NSString	消息标题	限制长度不超过512Bytes
description	NSString	描述内容	限制长度不超过1KB
thumbData	NSData	缩略图的二进制数据	限制内容大小不超过32KB
mediaObject	NSObject	多媒体数据对象	可以为WXImageObject、WXMusicObject、WXVideoObject、WXWebpageObject等


SendMessageToWXReq（SendMessageToWX请求类）

分享或收藏的目标场景，通过修改SendMessageToWXReq的 scene 字段实现。

字段	类型	含义	备注
text	NSString	发送消息的文本内容
bText	BOOL	是否文本消息	发送消息的类型，包括文本消息和多媒体消息两种，两者只能选择其一，不能同时发送文本和多媒体消息
message	WXMediaMessage	发送消息的多媒体内容\
scene	int	发送的目标场景	分享到对话:
WXSceneSession
分享到朋友圈:
WXSceneTimeline
分享到收藏:
WXSceneFavorite


一、文字类型分享示例
--------------------------------------------


SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
req.bText = YES;
req.text = @"分享的内容";
req.scene = WXSceneSession;
[WXApi sendReq:req];


二、图片类型分享示例
--------------------------------------------


WXImageObject 多媒体消息中包含的图片数据对象


字段	类型	含义	备注
imageData	NSData	图片的二进制数据	内容大小不超过10MB


UIImage *image = [UIImage imageNamed:@"res2.png"];
imageData = UIImageJPEGRepresentation(image, 0.7);

WXImageObject *imageObject = [WXImageObject object];
imageObject.imageData = imageData;

WXMediaMessage *message = [WXMediaMessage message];
NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res5"
                                                     ofType:@"jpg"];
message.thumbData = [NSData dataWithContentsOfFile:filePath];
message.mediaObject = imageObject;

SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
req.bText = NO;
req.message = message;
req.scene = WXSceneTimeline;
[WXApi sendReq:req];

三、音乐类型分享示例
--------------------------------------------


WXMusicObject 多媒体消息中包含的音乐数据对象

字段	类型	含义	备注
musicUrl	NSString	音频网页的URL地址	限制长度不超过10KB
musicLowBandUrl	NSString	供低带宽环境下使用的音频网页URL地址	限制长度不超过10KB
musicDataUrl	NSString	音频数据的URL地址	限制长度不超过10KB
musicLowBandDataUrl	NSString	供低带宽环境下使用的音频数据URL地址	限制长度不超过10KB


WXMusicObject *musicObject = [WXMusicObject object];
musicObject.musicUrl = @"音乐url";
musicObject.musicLowBandUrl = musicObject.musicUrl;
musicObject.musicDataUrl = @"音乐数据url";
musicObject.musicLowBandDataUrl = musicObject.musicDataUrl;

WXMediaMessage *message = [WXMediaMessage message];
message.title = @"音乐标题";
message.description = @"音乐描述";
[message setThumbImage:[UIImage imageNamed:@"缩略图.jpg"]];
message.mediaObject = musicObject;

SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
req.bText = NO;
req.message = message;
req.scene = WXSceneSession;
[WXApi sendReq:req];
注意：分享至微信的音乐，直接点击好友会话或朋友圈下的分享内容会跳转至第三方 APP，点击会话列表顶部的音乐分享内容将跳转至微信原生音乐播放器播放。


四、视频类型分享示例
--------------------------------------------


WXVideoObject 多媒体消息中包含的视频数据对象

字段	类型	含义	备注
videoUrl	NSString	视频链接	限制长度不超过10KB
videoLowBandUrl	NSString	供低带宽的环境下使用的视频链接	限制长度不超过10KB
注意：videoUrl和videoLowBandUrl不能同时为空



WXVideoObject *videoObject = [WXVideoObject object];
videoObject.videoUrl = @"视频url";
videoObject.videoLowBandUrl = @"低分辨率视频url";

WXMediaMessage *message = [WXMediaMessage message];
message.title = @"标题";
message.description = @"描述";
[message setThumbImage:[UIImage imageNamed:@"缩略图.jpg"]];
message.mediaObject = videoObject;

SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
req.bText = NO;
req.message = message;
req.scene = WXSceneSession;
[WXApi sendReq:req];

五、网页类型分享示例
--------------------------------------------


WXWebpageObject 多媒体消息中包含的网页数据对象

字段	类型	含义	备注
webpageUrl	NSString	html链接	限制长度不超过10KB


WXWebpageObject *webpageObject = [WXWebpageObject object];
webpageObject.webpageUrl = @"https://open.weixin.qq.com";

WXMediaMessage *message = [WXMediaMessage message];
message.title = @"标题";
message.description = @"描述";
[message setThumbImage:[UIImage imageNamed:@"缩略图.jpg"]];
message.mediaObject = webpageObject;

SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
req.bText = NO;
req.message = message;
req.scene = WXSceneSession;
[WXApi sendReq:req];

六、小程序类型分享示例
--------------------------------------------


WXMiniProgramObject 多媒体消息中包含的小程序数据对象

字段	类型	含义	备注
webpageUrl	NSString	兼容低版本的网页链接	限制长度不超过10KB
userName	NSString	小程序的userName	小程序原始ID获取方法：登录小程序管理后台-设置-基本设置-帐号信息
path	NSString	小程序的页面路径
hdImageData	NSData	小程序新版本的预览图二进制数据，6.5.9及以上版本微信客户端支持	限制大小不超过128KB，自定义图片建议长宽比是 5:4。
withShareTicket	BOOL	是否使用带shareTicket的分享	通常开发者希望分享出去的小程序被二次打开时可以获取到更多信息，例如群的标识。可以设置withShareTicket为true，当分享卡片在群聊中被其他用户打开时，可以获取到shareTicket，用于获取更多分享信息。详见小程序获取更多分享信息 ，最低客户端版本要求：6.5.13
miniprogramType	WXMiniProgramType	小程序的类型，默认正式版，1.8.1及以上版本开发者工具包支持分享开发版和体验版小程序	正式版: WXMiniProgramTypeRelease;
测试版: WXMiniProgramTypeTest;
体验版: WXMiniProgramTypePreview;


WXMiniProgramObject *object = [WXMiniProgramObject object];
object.webpageUrl = webpageUrl;
object.userName = userName;
object.path = path;
object.hdImageData = hdImageData;
object.withShareTicket = withShareTicket;
object.miniProgramType = programType;

WXMediaMessage *message = [WXMediaMessage message];
message.title = @"小程序标题";
message.description = @"小程序描述";
message.thumbData = nil;  //兼容旧版本节点的图片，小于32KB，新版本优先
                          //使用WXMiniProgramObject的hdImageData属性
message.mediaObject = object;

SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
req.bText = NO;
req.message = message;
req.scene = WXSceneSession;  //目前只支持会话
[WXApi sendReq:req];
注意：

发起分享的App与小程序属于同一微信开放平台帐号。
支持分享小程序类型消息至会话，暂不支持分享至朋友圈。
若客户端版本低于6.5.6或在iPad客户端接收，小程序类型分享将自动转成网页类型分享。开发者必须填写网页链接字段，确保低版本客户端能正常打开网页链接。
