8. 设置授权方的选项信息
=======================

该 API
用于设置授权方的公众号或小程序的选项信息，如：地理位置上报，语音识别开关，多客服开关。注意，设置各项选项设置信息，需要有授权方的授权，详见权限集说明。

请求格式

``POST``
**https**:://api.weixin.qq.com/cgi-bin/component/api_set_authorizer_option?component_access_token=xxxx

请求数据

.. code:: json

   {
     "component_appid": "appid_value",
     "authorizer_appid": " auth_appid_value ",
     "option_name": "option_name_value",
     "option_value": "option_value_value"
   }

请求参数

================ ==========================
参数             说明
================ ==========================
component_appid  第三方平台 appid
authorizer_appid 授权公众号或小程序的 appid
option_name      选项名称
option_value     设置的选项值
================ ==========================

返回结果

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok"
   }

结果参数说明----

======= ========
参数    说明
======= ========
errcode 错误码
errmsg  错误信息
======= ========

选项名和选项值表--------

=================================== ============ ==============
option_name                         option_value 选项值说明
=================================== ============ ==============
location_report(地理位置上报选项)   0            无上报
\                                   1            进入会话时上报
\                                   2            每 5s 上报
voice_recognize（语音识别开关选项） 0            关闭语音识别
\                                   1            开启语音识别
customer_service（多客服开关选项）  0            关闭多客服
\                                   1            开启多客服
=================================== ============ ==============
