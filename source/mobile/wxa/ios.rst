iOS开发示例
============================================================

开发前需下载iOS开发工具包（SDK），可在“资源中心-开发资源-资源下载-iOS资源下载”按照指引操作。

移动应用跳转到小程序示例：

WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
launchMiniProgramReq.userName = userName;  //拉起的小程序的username
launchMiniProgramReq.path = path;    //拉起小程序页面的可带参路径，不填默认拉起小程序首页
launchMiniProgramReq.miniProgramType = miniProgramType; //拉起小程序的类型
return  [WXApi sendReq:launchMiniProgramReq];
回调说明

-(void)onResp:(BaseResp *)resp
{
     if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]])
     {
          NSString *string = resp.extMsg;
          // 对应JsApi navigateBackApplication中的extraData字段数据
     }
}
小程序跳转回移动应用请参考《小程序开发文档》

