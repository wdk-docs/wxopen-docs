��    .      �              �     �     	     "     9     ?     E     K  K   Q  N   �     �     �  `      E   a     �     �     �     �  @   �  ?     C   T     �     �     �  *   �  �   �     �     �     �  o   �  S  g  e  �     !
  	   ?
     I
  P   P
  Z   �
     �
     	  	              -  	   :     D  l   T  o   �  |  1     �     �     �     �     �     �     �  K     N   N     �     �  `   �  E        X     g     o     v  @   �  ?   �  C        I     V     f  *   �  �   �     ~     �     �  o   �  S    e  l     �  	   �     �  P     Z   R     �     �  	   �     �     �  	   �     �  l     o   r   !!! warning 1. 设置服务器域名 2、设置业务域名 89019 89020 89021 89029 ``POST`` **https**://api.weixin.qq.com/wxa/modify_domain?access_token=TOKEN ``POST`` **https**://api.weixin.qq.com/wxa/setwebviewdomain?access_token=TOKEN access_token action add添加, delete删除, set覆盖, get获取。当参数是get时不需要填四个域名字段 downloadFile合法域名，当action参数是get时不需要此字段 downloaddomain errcode errmsg requestdomain request合法域名，当action参数是get时不需要此字段 socket合法域名，当action参数是get时不需要此字段 uploadFile合法域名，当action参数是get时不需要此字段 uploaddomain wsrequestdomain 业务域名数量超过限制 业务域名无更改，无需重复设置 为授权的小程序配置域名时支持配置子域名，例如第三方登记的业务域名如为qq.com，则可以直接将qq.com及其子域名（如xxx.qq.com）也配置到授权的小程序中。 修改服务器地址 参数 参数说明 尚未设置小程序业务域名，请先在第三方平台中设置小程序业务域名后在调用本接口 授权给第三方的小程序，其业务域名只可以为第三方的服务器，当小程序通过第三方发布代码上线后，小程序原先自己配置的业务域名将被删除，只保留第三方平台的域名，所以第三方平台在代替小程序发布代码之前，需要调用接口为小程序添加业务域名。 授权给第三方的小程序，其服务器域名只可以为第三方的服务器，当小程序通过第三方发布代码上线后，小程序原先自己配置的服务器域名将被删除，只保留第三方平台的域名，所以第三方平台在代替小程序发布代码之前，需要调用接口为小程序添加第三方自身的域名。 正常时返回的json示例: 示例： 说明 请使用第三方平台获取到的该小程序授权的authorizer_access_token 请求保存的域名不是第三方平台中已设置的小程序业务域名或子域名 请求数据 请求方式 返回码 返回说明 错误信息 错误码 错误码说明 需要先将域名登记到第三方平台的小程序业务域名中，才可以调用接口进行配置。 需要先将域名登记到第三方平台的小程序服务器域名中，才可以调用接口进行配置。 Project-Id-Version: wxopen-docs 
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
 !!! warning 1. 设置服务器域名 2、设置业务域名 89019 89020 89021 89029 ``POST`` **https**://api.weixin.qq.com/wxa/modify_domain?access_token=TOKEN ``POST`` **https**://api.weixin.qq.com/wxa/setwebviewdomain?access_token=TOKEN access_token action add添加, delete删除, set覆盖, get获取。当参数是get时不需要填四个域名字段 downloadFile合法域名，当action参数是get时不需要此字段 downloaddomain errcode errmsg requestdomain request合法域名，当action参数是get时不需要此字段 socket合法域名，当action参数是get时不需要此字段 uploadFile合法域名，当action参数是get时不需要此字段 uploaddomain wsrequestdomain 业务域名数量超过限制 业务域名无更改，无需重复设置 为授权的小程序配置域名时支持配置子域名，例如第三方登记的业务域名如为qq.com，则可以直接将qq.com及其子域名（如xxx.qq.com）也配置到授权的小程序中。 修改服务器地址 参数 参数说明 尚未设置小程序业务域名，请先在第三方平台中设置小程序业务域名后在调用本接口 授权给第三方的小程序，其业务域名只可以为第三方的服务器，当小程序通过第三方发布代码上线后，小程序原先自己配置的业务域名将被删除，只保留第三方平台的域名，所以第三方平台在代替小程序发布代码之前，需要调用接口为小程序添加业务域名。 授权给第三方的小程序，其服务器域名只可以为第三方的服务器，当小程序通过第三方发布代码上线后，小程序原先自己配置的服务器域名将被删除，只保留第三方平台的域名，所以第三方平台在代替小程序发布代码之前，需要调用接口为小程序添加第三方自身的域名。 正常时返回的json示例: 示例： 说明 请使用第三方平台获取到的该小程序授权的authorizer_access_token 请求保存的域名不是第三方平台中已设置的小程序业务域名或子域名 请求数据 请求方式 返回码 返回说明 错误信息 错误码 错误码说明 需要先将域名登记到第三方平台的小程序业务域名中，才可以调用接口进行配置。 需要先将域名登记到第三方平台的小程序服务器域名中，才可以调用接口进行配置。 