Android开发示例
============================================================

开发前需下载Android开发工具包（SDK），可在“资源中心-开发资源-资源下载-Android资源下载”按照指引操作。

调用接口：WXLaunchMiniProgram
移动应用跳转到小程序示例：

String appId = "wxd930ea5d5a258f4f"; // 填应用AppId
IWXAPI api = WXAPIFactory.createWXAPI(context, appId);

WXLaunchMiniProgram.Req req = new WXLaunchMiniProgram.Req();
req.userName = "gh_d43f693ca31f"; // 填小程序原始id
req.path = path;                  //拉起小程序页面的可带参路径，不填默认拉起小程序首页
req.miniprogramType = WXLaunchMiniProgram.Req.MINIPTOGRAM_TYPE_RELEASE;// 可选打开 开发版，体验版和正式版
api.sendReq(req);
回调说明

WXEntryActivity中

public void onResp(BaseResp resp) {
    if (resp.getType() == ConstantsAPI.COMMAND_LAUNCH_WX_MINIPROGRAM) {
        WXLaunchMiniProgram.Resp launchMiniProResp = (WXLaunchMiniProgram.Resp) resp;
        String extraData =launchMiniProResp.extMsg; //对应小程序组件 <button open-type="launchApp"> 中的 app-parameter 属性
    }
}
详细demo请参考官网上的Sample工程。
小程序跳转回移动应用请参考《小程序开发文档》

