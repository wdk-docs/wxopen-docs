# 微信登录

第三方平台代替小程序实现登录功能请参考一般小程序接口文档wx.login 部分内容。除了下述部分以外，其他接口的功能与一般小程序实现方式一致。

## code 换取 session_key

第三方平台开发者的服务器使用登录凭证 code 以及第三方平台的component_access_token 获取 session_key 和 openid。其中 session_key 是对用户数据进行加密签名的密钥。为了自身应用安全，session_key 不应该在网络上传输。

### 请求方式

`GET` **https**://api.weixin.qq.com/sns/component/jscode2session?appid=APPID&js_code=JSCODE&grant_type=authorization_code&component_appid=COMPONENT_APPID&component_access_token=ACCESS_TOKEN

### 请求参数

|参数	                  |是否必须	|说明
|-|-|-|
|appid	                |是	      |小程序的AppID
|js_code	              |是	      |登录时获取的 code
|grant_type	            |是	      |填authorization_code
|component_appid	      |是	      |第三方平台appid
|component_access_token	|是	      |第三方平台的 component_access_token

### 返回结果

（正常时返回的json示例）：
```json
{
  "openid":“OPENID”,
  "session_key":"SESSIONKEY"
}
```

返回参数说明：

|参数	        |说明
|-|-|
|openid	      |用户唯一标识的openid
|session_key	|会话密钥

### 错误码

示例为Code无效：
```json
{
  "errcode":“40029”,
  "errmsg":"invalid code"
}
```