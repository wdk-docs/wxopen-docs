��                          �        �     �     �       
             %     ,     8     E     L     b     t     �     �     �     �     �     �  �   �    �  )   �     �     �               +  	   8  %   B  |  h  �   �     �     �     �     �  
   �     �     �     	     	     	     $	     :	     L	     Y	     ]	     j	     �	     �	     �	  �   �	    �
  )   �     �     �     �     �       	     %      ``GET`` **https**://api.weixin.qq.com/sns/component/jscode2session?appid=APPID&js_code=JSCODE&grant_type=authorization_code&component_appid=COMPONENT_APPID&component_access_token=ACCESS_TOKEN appid code 换取 session_key component_access_token component_appid grant_type js_code openid session_key 会话密钥 参数 填authorization_code 小程序的AppID 微信登录 是 是否必须 用户唯一标识的openid 登录时获取的 code 示例为Code无效： 第三方平台appid 第三方平台代替小程序实现登录功能请参考一般小程序接口文档wx.login 部分内容。除了下述部分以外，其他接口的功能与一般小程序实现方式一致。 第三方平台开发者的服务器使用登录凭证 code 以及第三方平台的component_access_token 获取 session_key 和 openid。其中 session_key 是对用户数据进行加密签名的密钥。为了自身应用安全，session_key 不应该在网络上传输。 第三方平台的 component_access_token 说明 请求参数 请求方式 返回参数说明： 返回结果 错误码 （正常时返回的json示例）： Project-Id-Version: wxopen-docs 
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
 ``GET`` **https**://api.weixin.qq.com/sns/component/jscode2session?appid=APPID&js_code=JSCODE&grant_type=authorization_code&component_appid=COMPONENT_APPID&component_access_token=ACCESS_TOKEN appid code 换取 session_key component_access_token component_appid grant_type js_code openid session_key 会话密钥 参数 填authorization_code 小程序的AppID 微信登录 是 是否必须 用户唯一标识的openid 登录时获取的 code 示例为Code无效： 第三方平台appid 第三方平台代替小程序实现登录功能请参考一般小程序接口文档wx.login 部分内容。除了下述部分以外，其他接口的功能与一般小程序实现方式一致。 第三方平台开发者的服务器使用登录凭证 code 以及第三方平台的component_access_token 获取 session_key 和 openid。其中 session_key 是对用户数据进行加密签名的密钥。为了自身应用安全，session_key 不应该在网络上传输。 第三方平台的 component_access_token 说明 请求参数 请求方式 返回参数说明： 返回结果 错误码 （正常时返回的json示例）： 