13. 设置最低基础库版本
==================================================================================

请求方式: POST（请使用https协议）

https://api.weixin.qq.com/cgi-bin/wxopen/setweappsupportversion?access_token=TOKEN
请求示例：

{
"version":"1.0.0"
}
参数说明:

参数	说明
version	版本
返回说明

{
"errcode" : 0,
"errmsg" : "ok"
}
参数说明

参数	说明
errcode	错误码
errmsg	错误信息
错误码说明

错误码	错误说明
85015	版本输入错误
