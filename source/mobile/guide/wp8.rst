:wxopen:`WP8接入指南 <open1419315810>`
=================================

注：本文为微信WP8终端开发工具的新手使用教程，只涉及教授SDK的使用方法，默认读者已经熟悉VS2012的基本使用方法，以及具有一定的编程知识基础等。

1.申请你的AppID
-------------------------------------

请到 开发者应用登记页面 进行登记，登记并选择移动应用进行设置后，将获得AppID，可立即用于开发。但应用登记完成后还需要提交审核，只有审核通过的应用才能正式发布使用。

2.微信终端SDK开发包
-------------------------------------

SDK开发包包含3个文件：

-MicroMsgSDK.dll（每个第三方应用必须要导入该sdk库，用于实现与微信的交互）

-MicroMsgSDK.XML（API文档，放到与MicroMsgSDK.dll相同的目录，在VS中可以提供帮助，如查看函数注释）

-Google.ProtocolBuffersLite.dll（Google的ProtocolBuffer开源库，用于序列化数据，引入即可）

请前往“资源下载页 ”下载最新SDK包

3.搭建开发环境
-------------------------------------

[1] 在VS2012中建立你的工程。

[2] 如下图所示，右键点击工程的References，在快捷菜单中选择Add References，在打开的弹出框上点击“Browser”按钮，然后选择 WP8平台SDK开发包 中的两个dll文件。



[3] 引入SDK的dll后，在References下可以看到引入的dll库。（如下图所示）。



SDK的名字空间为MicroMsg.sdk，在使用前先导入此名字空间。

using MicroMsg.sdk;

4.在代码中使用SDK开发包
-------------------------------------

[1] 发送请求或响应到微信

现在，你的程序要发送请求或响应给微信，可以通过IWXAPI的 sendReq 和 sendResp 两个函数来实现。

boolean sendReq(BaseReq req);

sendReq是第三方app主动发送请求给微信，发送请求后会拉起微信应用，微信对请求进行处理后，会发送响应回App。

boolean sendResp(BaseResp resp);

sendResp场景：微信先向第三方app发送请求，拉起第三方App界面，当用户操作完成后，第三方app通过sendResp发送响应数据给微信，拉起微信界面。

sendReq示例：

try

{

int scene = SendMessageToWX.Req.WXSceneSession; //发给微信朋友`

WXTextMessage message = new WXTextMessage();

message.Title = "文本";

message.Text = "这是一段文本内容";

SendMessageToWX.Req req = new SendMessageToWX.Req(message, scene);

IWXAPI api = WXAPIFactory.CreateWXAPI(AppID);

api.SendReq(req);

}

catch (WXException ex)

{

MessageBox.Show(ex.Message);

}

AppID为你在微信开放平台网站上登记应用得到的AppID。

需要注意的是，SendMessageToWX.Req的scene参数，如果scene填WXSceneSession，那么消息会发送给微信好友。如果scene填WXSceneTimeline，那么消息会发送至朋友圈。如果scene填WXSceneChooseByUser，那么会由用户来选择发送给好友还是发到朋友圈。scene默认值为WXSceneChooseByUser。

sendResp示例：

try
{
WXTextMessage message = new WXTextMessage();
message.Title = "文本";
message.Text = "这是一段文本内容";
GetMessageFromWX.Resp resp = new GetMessageFromWX.Resp(req.Transaction, req.Username, message);
IWXAPI api = WXAPIFactory.CreateWXAPI(AppID);
api.SendResp(resp);
}
catch (WXException ex)
{
MessageBox.Show(ex.Message);
}
req为微信向你的应用发送请求时传过来的数据对象。

具体要发送的内容由第三方app开发者定义，SDK支持文本、图片、文件、链接、表情、音乐、视频、自定义等多种消息内容。具体可参考Demo源码。

[2] 处理微信的请求和响应

如果你的程序需要接收微信发送的请求和响应，需要下面4步操作：a.修改WMAppManifest.xml

a.修改WMAppManifest.xml

右键点击应用的Properties下的WMAppManifest.xml，选择Open with...，然后选择Xml (Text) Editer打开该文件。在的前面，加上以下标签代码(如果你的文件中已经存在标签，则添加在已有的标签下)



上面Xml片段中有两处需要修改的，一个是Name="SDK_DEMO"，改成任意你喜欢的名字，两个支持的FileType，一个是.wechatapp， 另外一个是.wx3b34a14b66641dfd，其中“wx3b34a14b66641dfd”改成你在微信开放平台上登记应用时得到的AppID，这个务必要写对，不然微信拉不起你的应用。

b. 编写微信入口Page类

继承WXEntryBasePage类，并覆写下表中的函数，来处理来自微信的请求和响应，微信发送的数据，已经填到了参数中，可直接取用。注意：如果覆写OnNavigatedTo函数，需要调用base.OnNavigatedTo，以保证父类中的逻辑得以执行。



c. 继承系统的UriMapperBase类

大致逻辑如下：

class AssociationUriMapper : UriMapperBase
{
private string tempUri;
public override Uri MapUri(Uri uri)
{
tempUri = uri.ToString();
// 根据文件类型打开程序
if (tempUri.Contains("/FileTypeAssociation"))
{
// 获取fileID (after "fileToken=").
int fileIDIndex = tempUri.IndexOf("fileToken=") + 10;
string fileID = tempUri.Substring(fileIDIndex);
// 获取文件名.string incommingFileName = SharedStorageAccessManager.GetSharedFileName(fileID);
// 获取文件后缀
int extensionIndex = incommingFileName.LastIndexOf(&#39;.&#39;) + 1;
string incommingFileType = incommingFileName.Substring(extensionIndex).ToLower();
// 根据不同文件类型，跳转不同参数的地址
switch (incommingFileType)
{
case "wx3b34a14b66641dfd":
return new Uri("/DemoEntryPage.xaml?fileToken=" + fileID, UriKind.Relative);
default:
return new Uri("/MainPage.xaml", UriKind.Relative);
}
}
else
{
return uri;
}
}
}
case 'wx3b34a14b66641dfd': 改成你的AppID。

"/DemoEntryPage.xaml?fileToken=" 改成步骤b中继承WXEntryBasePage的Page的路径。

d. 修改App.xaml.cs文件

然后在App.xaml.cs的InitializePhoneApplication()函数中，增加一行代码：

// Assign the URI-mapper class to the application frame.

RootFrame.UriMapper = new AssociationUriMapper();

注意：

在测试的时候，确保你安装的WP8的微信(4.0以上版本)
不要在Demo的上修改来形成你的应用程序，因为如果其他人跟你一样做，你们的AppStore上的AppID是一样的。
微信SDK Sample Demo源码

