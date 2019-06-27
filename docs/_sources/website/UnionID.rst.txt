授权后接口调用（UnionID）
====================================================================


授权后接口调用（UnionID）
------------------------------------------------------

通过code获取access_token

接口说明

通过code获取access_token的接口。

请求说明

http请求方式: GET
https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
参数说明

参数	是否必须	说明
appid	是	应用唯一标识，在微信开放平台提交应用审核通过后获得
secret	是	应用密钥AppSecret，在微信开放平台提交应用审核通过后获得
code	是	填写第一步获取的code参数
grant_type	是	填authorization_code
返回说明

正确的返回：

{
"access_token":"ACCESS_TOKEN",
"expires_in":7200,
"refresh_token":"REFRESH_TOKEN","openid":"OPENID",
"scope":"SCOPE"
}
参数	说明
access_token	接口调用凭证
expires_in	access_token接口调用凭证超时时间，单位（秒）
refresh_token	用户刷新access_token
openid	授权用户唯一标识
scope	用户授权的作用域，使用逗号（,）分隔
错误返回样例：

{
"errcode":40029,"errmsg":"invalid code"
}

刷新或续期access_token使用
------------------------------------------------------

接口说明

access_token是调用授权关系接口的调用凭证，由于access_token有效期（目前为2个小时）较短，当access_token超时后，可以使用refresh_token进行刷新，access_token刷新结果有两种：

1. 若access_token已超时，那么进行refresh_token会获取一个新的access_token，新的超时时间；

2. 若access_token未超时，那么进行refresh_token不会改变access_token，但超时时间会刷新，相当于续期access_token。

refresh_token拥有较长的有效期（30天），当refresh_token失效的后，需要用户重新授权，所以，请开发者在refresh_token即将过期时（如第29天时），进行定时的自动刷新并保存好它。

请求方法

使用/sns/oauth2/access_token接口获取到的refresh_token进行以下接口调用：

http请求方式: GET
https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN
参数说明

参数	是否必须	说明
appid	是	应用唯一标识
grant_type	是	填refresh_token
refresh_token	是	填写通过access_token获取到的refresh_token参数
返回说明

正确的返回：

{
"access_token":"ACCESS_TOKEN",
"expires_in":7200,
"refresh_token":"REFRESH_TOKEN",
"openid":"OPENID",
"scope":"SCOPE"
}
参数	说明
access_token	接口调用凭证
expires_in	access_token接口调用凭证超时时间，单位（秒）
refresh_token	用户刷新access_token
openid	授权用户唯一标识
scope	用户授权的作用域，使用逗号（,）分隔
错误返回样例：

{
"errcode":40030,"errmsg":"invalid refresh_token"
}
接口说明

检验授权凭证（access_token）是否有效

请求说明

http请求方式: GET
https://api.weixin.qq.com/sns/auth?access_token=ACCESS_TOKEN&openid=OPENID
参数说明

参数	是否必须	说明
access_token	是	调用接口凭证
openid	是	普通用户标识，对该公众帐号唯一
返回说明

正确的Json返回结果：

{
"errcode":0,"errmsg":"ok"
}
错误的Json返回示例:

{
"errcode":40003,"errmsg":"invalid openid"
}


获取用户个人信息（UnionID机制）
------------------------------------------------------


接口说明

此接口用于获取用户个人信息。开发者可通过OpenID来获取用户基本信息。特别需要注意的是，如果开发者拥有多个移动应用、网站应用和公众帐号，可通过获取用户基本信息中的unionid来区分用户的唯一性，因为只要是同一个微信开放平台帐号下的移动应用、网站应用和公众帐号，用户的unionid是唯一的。换句话说，同一用户，对同一个微信开放平台下的不同应用，unionid是相同的。请注意，在用户修改微信头像后，旧的微信头像URL将会失效，因此开发者应该自己在获取用户信息后，将头像图片保存下来，避免微信头像URL失效后的异常情况。

请求说明

http请求方式: GET
https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
参数说明

参数	是否必须	说明
access_token	是	调用凭证
openid	是	普通用户的标识，对当前开发者帐号唯一
lang	否	国家地区语言版本，zh_CN 简体，zh_TW 繁体，en 英语，默认为zh-CN
返回说明

正确的Json返回结果：

{
"openid":"OPENID",
"nickname":"NICKNAME",
"sex":1,
"province":"PROVINCE",
"city":"CITY",
"country":"COUNTRY",
"headimgurl": "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0",
"privilege":[
"PRIVILEGE1",
"PRIVILEGE2"
],
"unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"

}
参数	说明
openid	普通用户的标识，对当前开发者帐号唯一
nickname	普通用户昵称
sex	普通用户性别，1为男性，2为女性
province	普通用户个人资料填写的省份
city	普通用户个人资料填写的城市
country	国家，如中国为CN
headimgurl	用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空
privilege	用户特权信息，json数组，如微信沃卡用户为（chinaunicom）
unionid	用户统一标识。针对一个微信开放平台帐号下的应用，同一用户的unionid是唯一的。
建议：

开发者最好保存用户unionID信息，以便以后在不同应用中进行用户信息互通。

错误的Json返回示例:

{
"errcode":40003,"errmsg":"invalid openid"
}
调用频率限制

接口名	频率限制
通过code换取access_token	1万/分钟
刷新access_token	5万/分钟
获取用户基本信息	5万/分钟
