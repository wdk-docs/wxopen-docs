2. 获取体验二维码
===============================

请求方式: get（请使用https协议）

https://api.weixin.qq.com/wxa/get_qrcode?access_token=TOKEN&path=page%2Findex%3Faction%3D1
参数说明

参数	说明
path	指定体验版二维码跳转到某个具体页面（如果不需要的话，则不需要填path参数，可在路径后以“参数”方式传入参数）
具体的路径加参数需要urlencode，比如page/index?action=1编码后得到page%2Findex%3Faction%3D1
返回说明（正确情况下的返回HTTP头如下）：

HTTP/1.1 200 OK

Connection: close

Content-Type: image/jpeg

Content-disposition: attachment; filename="QRCode.jpg"

Date: Sun, 06 Jan 2013 10:20:18 GMT

Cache-Control: no-cache, must-revalidate

Content-Length: 339721
错误情况下的返回JSON数据包示例如下：

{
    "errcode":-1,
    "errmsg":"system error"
}
