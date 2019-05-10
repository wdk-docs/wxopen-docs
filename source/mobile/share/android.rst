Android开发手册
============================

微信分享及收藏是指第三方App通过接入该功能，让用户可以从App分享文字、图片、音乐、视频、网页、小程序至微信好友会话、朋友圈或添加到微信收藏。

微信分享及收藏功能已向全体开发者开放（海外应用支持网页、小程序类型分享），开发者在微信开放平台帐号下申请App并通过审核后，即可获得微信分享及收藏权限。

开发者在App中在集成微信SDK后，可调用接口实现，以下依次是文字、图片、音乐、视频、网页、小程序类型分享的示例。

WXMediaMessage （微信媒体消息内容）说明

字段	类型	含义	备注
sdkVer	int	sdk版本号
title	String	消息标题	限制长度不超过512Bytes
description	String	消息描述	限制长度不超过1KB
thumbData	byte[]	缩略图的二进制数据	限制内容大小不超过32KB
mediaObject	WXMediaMessage.IMediaObject	消息对象	用于描述一个媒体对象的接口，媒体对象包括:
WXTextObject、WXImageObject、WXMusicObject、WXVideoObject、WXWebpageObject、 WXFileObject、WXAppExtendObject、WXMiniProgramObject等

SendMessageToWX.Req（SendMessageToWX请求类）

分享或收藏的目标场景，通过修改SendMessageToWX.Req的scene字段实现。

字段	类型	含义	备注
message	WXMediaMessage
scene	int	发送的目标场景	分享到对话:
SendMessageToWX.Req.WXSceneSession
分享到朋友圈:
SendMessageToWX.Req.WXSceneTimeline ;
分享到收藏:
SendMessageToWX.Req.WXSceneFavorite
transaction	String	对应该请求的事务ID，通常由Req发起，回复Resp时应填入对应事务ID

一、文字类型分享示例
--------------------------------------------


WXTextObject （WXMediaMessage.IMediaObject的派生类，用于描述一个文本对象）

字段	类型	含义	备注
text	String	文本数据	长度需大于0且不超过10KB


文字类型分享demo

//初始化一个 WXTextObject 对象，填写分享的文本内容
WXTextObject textObj = new WXTextObject();
textObj.text = text;

//用 WXTextObject 对象初始化一个 WXMediaMessage 对象
WXMediaMessage msg = new WXMediaMessage();
msg.mediaObject = textObj;
msg.description = text;

SendMessageToWX.Req req = new SendMessageToWX.Req();
req.transaction = buildTransaction("text");
req.message = msg;
req.scene = mTargetScene;
//调用api接口，发送数据到微信
api.sendReq(req);


二、图片类型分享示例
--------------------------------------------


WXImageObject （WXMediaMessage.IMediaObject的派生类，用于描述一个图片对象）

字段	类型	含义	备注
imageData	byte[]	图片的二进制数据	内容大小不超过10MB
imagePath	String	图片的本地路径	对应图片内容大小不超过10MB


图片类型分享demo

Bitmap bmp = BitmapFactory.decodeResource(getResources(), R.drawable.send_img);

//初始化 WXImageObject 和 WXMediaMessage 对象
WXImageObject imgObj = new WXImageObject(bmp);
WXMediaMessage msg = new WXMediaMessage();
msg.mediaObject = imgObj;

//设置缩略图
Bitmap thumbBmp = Bitmap.createScaledBitmap(bmp, THUMB_SIZE, THUMB_SIZE, true);
bmp.recycle();
msg.thumbData = Util.bmpToByteArray(thumbBmp, true);

//构造一个Req
SendMessageToWX.Req req = new SendMessageToWX.Req();
req.transaction = buildTransaction("img");
req.message = msg;
req.scene = mTargetScene;
req.userOpenId = getOpenId();
//调用api接口，发送数据到微信
api.sendReq(req);


三、音乐类型分享示例
--------------------------------------------


WXMusicObject（WXMediaMessage.IMediaObject的派生类，用于描述一个音频对象）

字段	类型	含义	备注
musicUrl	String	音频网页的URL地址	限制长度不超过10KB
musicLowBandUrl	String	供低带宽环境下使用的音频网页URL地址	限制长度不超过10KB
musicDataUrl	String	音频数据的URL地址	限制长度不超过10KB
musicLowBandDataUrl	String	供低带宽环境下使用的音频数据URL地址	限制长度不超过10KB
注意：musicUrl和musicLowBandUrl不能同时为空

音乐类型分享demo

//初始化一个WXMusicObject，填写url
WXMusicObject music = new WXMusicObject();
music.musicUrl="音乐url";

//用 WXMusicObject 对象初始化一个 WXMediaMessage 对象
WXMediaMessage msg = new WXMediaMessage();
msg.mediaObject = music;
msg.title = "音乐标题";
msg.description = "音乐描述"
Bitmap thumbBmp = BitmapFactory.decodeResource(getResources(), R.drawable.send_music_thumb);
//设置音乐缩略图
msg.thumbData = Util.bmpToByteArray(thumbBmp, true);

//构造一个Req
SendMessageToWX.Req req = new SendMessageToWX.Req();
req.transaction = buildTransaction("music");
req.message = msg;
req.scene = mTargetScene;
req.userOpenId = getOpenId();
//调用api接口，发送数据到微信
api.sendReq(req);
注意：分享至微信的音乐，直接点击好友会话或朋友圈下的分享内容会跳转至第三方 APP，点击会话列表顶部的音乐分享内容将跳转至微信原生音乐播放器播放。



四、视频类型分享示例
--------------------------------------------


WXVideoObject （WXMediaMessage.IMediaObject的派生类，用于描述一个视频对象）

字段	类型	含义	备注
videoUrl	String	视频链接	限制长度不超过10KB
videoLowBandUrl	String	供低带宽的环境下使用的视频链接	限制长度不超过10KB
注意：videoUrl和videoLowBandUrl不能同时为空

视频类型分享demo：

//初始化一个WXVideoObject，填写url
WXVideoObject video = new WXVideoObject();
video.videoUrl ="视频url";

//用 WXVideoObject 对象初始化一个 WXMediaMessage 对象
WXMediaMessage msg = new WXMediaMessage(video);
msg.title ="视频标题";
msg.description ="视频描述";
Bitmap thumbBmp = BitmapFactory.decodeResource(getResources(), R.drawable.send_music_thumb);
msg.thumbData =Util.bmpToByteArray(thumbBmp,true);

//构造一个Req
SendMessageToWX.Req req = new SendMessageToWX.Req();
req.transaction = buildTransaction("video");
req.message =msg;
req.scene = mTargetScene;
req.userOpenId = getOpenId();

//调用api接口，发送数据到微信
api.sendReq(req);


五、网页类型分享示例
--------------------------------------------


WXWebpageObject （WXMediaMessage.IMediaObject的派生类，用于描述一个网页对象）

字段	类型	含义	备注
webpageUrl	String	html链接	限制长度不超过10KB


//初始化一个WXWebpageObject，填写url
WXWebpageObject webpage = new WXWebpageObject();
webpage.webpageUrl ="网页url";

//用 WXWebpageObject 对象初始化一个 WXMediaMessage 对象
WXMediaMessage msg = new WXMediaMessage(webpage);
msg.title ="网页标题 ";
msg.description ="网页描述";
Bitmap thumbBmp = BitmapFactory.decodeResource(getResources(), R.drawable.send_music_thumb);
msg.thumbData =Util.bmpToByteArray(thumbBmp, true);

//构造一个Req
SendMessageToWX.Req req = new SendMessageToWX.Req();
req.transaction = buildTransaction("webpage");
req.message =msg;
req.scene =mTargetScene;
req.userOpenId = getOpenId();

//调用api接口，发送数据到微信
api.sendReq(req);


六、小程序类型分享示例
--------------------------------------------


WXMiniProgramObject （WXMediaMessage.IMediaObject的派生类，用于描述一个小程序对象）

字段	类型	含义	备注
webpageUrl	String	兼容低版本的网页链接	限制长度不超过10KB
userName	String	小程序的原始id	小程序原始ID获取方法：登录小程序管理后台-设置-基本设置-帐号信息
path	String	小程序的path
withShareTicket	boolean	是否使用带shareTicket的分享	通常开发者希望分享出去的小程序被二次打开时可以获取到更多信息，例如群的标识。可以设置withShareTicket为true，当分享卡片在群聊中被其他用户打开时，可以获取到shareTicket，用于获取更多分享信息。详见小程序获取更多分享信息 ，最低客户端版本要求：6.5.13
miniprogramType	int	小程序的类型，默认正式版	正式版: WXMiniProgramObject.MINIPTOGRAM_TYPE_RELEASE;
测试版: WXMiniProgramObject.MINIPROGRAM_TYPE_TEST;
预览版: WXMiniProgramObject.MINIPROGRAM_TYPE_PREVIEW


WXMiniProgramObject miniProgramObj = new WXMiniProgramObject();
miniProgramObj.webpageUrl = "http://www.qq.com"; // 兼容低版本的网页链接
miniProgramObj.miniprogramType = WXMiniProgramObject.MINIPTOGRAM_TYPE_RELEASE;// 正式版:0，测试版:1，体验版:2
miniProgramObj.userName = "gh_d43f693ca31f";     // 小程序原始id
miniProgramObj.path = "/pages/media";            //小程序页面路径
WXMediaMessage msg = new WXMediaMessage(miniProgramObj);
msg.title = "小程序消息Title";                    // 小程序消息title
msg.description = "小程序消息Desc";               // 小程序消息desc
msg.thumbData = getThumb();                      // 小程序消息封面图片，小于128k

SendMessageToWX.Req req = new SendMessageToWX.Req();
req.transaction = buildTransaction("miniProgram");
req.message = msg;
req.scene = SendMessageToWX.Req.WXSceneSession;  // 目前只支持会话
api.sendReq(req);
注意：

发起分享的App与小程序属于同一微信开放平台帐号。
支持分享小程序类型消息至会话，暂不支持分享至朋友圈。
若客户端版本低于6.5.6或在iPad客户端接收，小程序类型分享将自动转成网页类型分享。开发者必须填写网页链接字段，确保低版本客户端能正常打开网页链接。

