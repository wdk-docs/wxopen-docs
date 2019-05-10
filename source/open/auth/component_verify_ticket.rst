推送 component_verify_ticket 协议
=================================

在第三方平台创建审核通过后，微信服务器会向其“授权事件接收 URL”每隔 10
分钟定时推送 component_verify_ticket。 第三方平台方在收到 ticket
推送后也需进行解密（详细请见【消息加解密接入指引】），接收到后必须直接返回字符串
success。

请求数据
--------

.. code:: xml

   <xml>
       <AppId> </AppId>
       <CreateTime>1413192605 </CreateTime>
       <InfoType> </InfoType>
       <ComponentVerifyTicket> </ComponentVerifyTicket>
   </xml>

字段说明
--------

===================== =======================
字段名称              字段描述
===================== =======================
AppId                 第三方平台 appid
CreateTime            时间戳
InfoType              component_verify_ticket
ComponentVerifyTicket Ticket 内容
===================== =======================

!!! note “注意”

::

   component_verify_ticket的有效时间较component_access_token更长，建议保存最近可用的component_verify_ticket，在component_access_token过期之前使用该ticket进行更新，避免出现因为ticket接收失败而无法更新component_access_token的情况。
