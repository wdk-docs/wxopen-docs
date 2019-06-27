10. 修改线上代码可见状态
========================================================

（仅供第三方代小程序调用）

请求方式: POST（请使用https协议）

https://api.weixin.qq.com/wxa/change_visitstatus?access_token=TOKEN
POST数据示例:

{
"action"="close"
}
参数说明:

参数	说明
access_token	请使用第三方平台获取到的该小程序授权的authorizer_access_token
action	设置可访问状态，发布后默认可访问，close为不可见，open为可见
返回说明（正常时返回的json示例）：

{
"errcode":0,
"errmsg":"ok",
}
错误码说明：

返回码	说明
-1	系统繁忙
85021	状态不可变
85022	action非法
