��    
      l               �       �   a   �   �  @     �  ;   �     (  D   *  �   o  '   �  |        �  a   �  �       �  ;   �       D   	  �   N  '   �   -(void)onResp:(BaseResp *)resp { NSString *string = resp.extMsg; // 对应JsApi navigateBackApplication中的extraData字段数据 WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object]; launchMiniProgramReq.userName = userName;  //拉起的小程序的username launchMiniProgramReq.path = path;    //拉起小程序页面的可带参路径，不填默认拉起小程序首页 launchMiniProgramReq.miniProgramType = miniProgramType; //拉起小程序的类型 return  [WXApi sendReq:launchMiniProgramReq]; 回调说明 iOS开发示例 if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]]) { } } 小程序跳转回移动应用请参考《小程序开发文档》 开发前需下载iOS开发工具包（SDK），可在“资源中心-开发资源-资源下载-iOS资源下载”按照指引操作。 移动应用跳转到小程序示例： Project-Id-Version: wxopen-docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-05-11 22:48+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 -(void)onResp:(BaseResp *)resp { NSString *string = resp.extMsg; // 对应JsApi navigateBackApplication中的extraData字段数据 WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object]; launchMiniProgramReq.userName = userName;  //拉起的小程序的username launchMiniProgramReq.path = path;    //拉起小程序页面的可带参路径，不填默认拉起小程序首页 launchMiniProgramReq.miniProgramType = miniProgramType; //拉起小程序的类型 return  [WXApi sendReq:launchMiniProgramReq]; 回调说明 iOS开发示例 if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]]) { } } 小程序跳转回移动应用请参考《小程序开发文档》 开发前需下载iOS开发工具包（SDK），可在“资源中心-开发资源-资源下载-iOS资源下载”按照指引操作。 移动应用跳转到小程序示例： 