��          �                 %        3  (   L     u  K   �     �  6   �  #   #     G  g   W     �     �  _  �  +   #  |  O  %   �     �  (        4  K   F     �  6   �  #   �       g        ~     �  _  �  +   �   "errcode":-1, "errmsg":"system error" 2. 获取体验二维码 Cache-Control: no-cache, must-revalidate Connection: close Content-Length: 339721 错误情况下的返回JSON数据包示例如下： Content-Type: image/jpeg Content-disposition: attachment; filename="QRCode.jpg" Date: Sun, 06 Jan 2013 10:20:18 GMT HTTP/1.1 200 OK https://api.weixin.qq.com/wxa/get_qrcode?access_token=TOKEN&path=page%2Findex%3Faction%3D1 参数说明 { } 参数      说明 path    指定体验版二维码跳转到某个具体页面（如果不需要的话，则不需要填path参数，可在路径后以“参数”方式传入参数） 具体的路径加参数需要urlencode，比如page/index?action=1编码后得到page%2Findex%3Faction%3D1 返回说明（正确情况下的返回HTTP头如下）： 请求方式: get（请使用https协议） Project-Id-Version: wxopen-docs 
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
 "errcode":-1, "errmsg":"system error" 2. 获取体验二维码 Cache-Control: no-cache, must-revalidate Connection: close Content-Length: 339721 错误情况下的返回JSON数据包示例如下： Content-Type: image/jpeg Content-disposition: attachment; filename="QRCode.jpg" Date: Sun, 06 Jan 2013 10:20:18 GMT HTTP/1.1 200 OK https://api.weixin.qq.com/wxa/get_qrcode?access_token=TOKEN&path=page%2Findex%3Faction%3D1 参数说明 { } 参数      说明 path    指定体验版二维码跳转到某个具体页面（如果不需要的话，则不需要填path参数，可在路径后以“参数”方式传入参数） 具体的路径加参数需要urlencode，比如page/index?action=1编码后得到page%2Findex%3Faction%3D1 返回说明（正确情况下的返回HTTP头如下）： 请求方式: get（请使用https协议） 