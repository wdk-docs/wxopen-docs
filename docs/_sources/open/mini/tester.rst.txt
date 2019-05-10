成员管理
========

第三方平台在帮助旗下授权的小程序提交代码审核之前，可先让小程序运营者体验，体验之前需要将运营者的个人微信号添加到该小程序的体验者名单中。

注意：如果运营者同时也是该小程序的管理员，则无需绑定，管理员默认有体验权限。

1.绑定体验者
------------

``POST``
**https**://api.weixin.qq.com/wxa/bind_tester?access_token=TOKEN

请求数据
~~~~~~~~

.. code:: json

   {
     "wechatid": "testid"
   }

参数说明：

============ ==============================================================
参数         说明
============ ==============================================================
access_token 请使用第三方平台获取到的该小程序授权的 authorizer_access_token
wechatid     微信号
============ ==============================================================

返回结果
~~~~~~~~

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok"
   }

错误码
~~~~~~

====== ==================================
返回码 说明
====== ==================================
-1     系统繁忙
85001  微信号不存在或微信号设置为不可搜索
85002  小程序绑定的体验者数量达到上限
85003  微信号绑定的小程序体验者达到上限
85004  微信号已经绑定
====== ==================================

2.解绑体验者
------------

``POST``
**https**://api.weixin.qq.com/wxa/unbind_tester?access_token=TOKEN

.. _请求数据-1:

请求数据
~~~~~~~~

.. code:: json

   {
     "wechatid": "testid"
   }

参数说明：

============ ==============================================================
参数         说明
============ ==============================================================
access_token 请使用第三方平台获取到的该小程序授权的 authorizer_access_token
wechatid     微信号
============ ==============================================================

.. _返回结果-1:

返回结果
~~~~~~~~

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok"
   }

.. _错误码-1:

错误码
~~~~~~

====== ========
返回码 说明
====== ========
-1     系统繁忙
====== ========

.. _成员管理-1:

成员管理
========

第三方平台在帮助旗下授权的小程序提交代码审核之前，可先让小程序运营者体验，体验之前需要将运营者的个人微信号添加到该小程序的体验者名单中。

注意：如果运营者同时也是该小程序的管理员，则无需绑定，管理员默认有体验权限。

1、绑定微信用户为小程序体验者
-----------------------------

请求方式: POST（请使用 https 协议）

https://api.weixin.qq.com/wxa/bind_tester?access_token=TOKEN

POST 数据示例：

.. code:: json

   {
     "wechatid": "testid"
   }

参数说明： 参数 说明 access_token 请使用第三方平台获取到的该小程序授权的
authorizer_access_token wechatid 微信号

返回说明（正常时返回的 json 示例）：

.. code:: json

   {
     "errcode": 0,

     "errmsg": "ok",

     "userstr": "xxxxxxxxx"
   }

参数说明： 参数 说明 errcode 错误码 errmsg 错误信息 userstr
人员对应的唯一字符串

错误码说明： 返回码 说明 -1 系统繁忙 85001
微信号不存在或微信号设置为不可搜索 85002 小程序绑定的体验者数量达到上限
85003 微信号绑定的小程序体验者达到上限 85004 微信号已经绑定

2、解除绑定小程序的体验者
-------------------------

请求方式: POST（请使用 https 协议）

https://api.weixin.qq.com/wxa/unbind_tester?access_token=TOKEN

POST 数据示例：

.. code:: json

   {
     "wechatid": "testid"
   }

参数说明： 参数 说明 access_token 请使用第三方平台获取到的该小程序授权的
authorizer_access_token wechatid 微信号 userstr
人员对应的唯一字符串（可通过获取体验者 api
获取已绑定人员的字符串，userstr 和 wechatid 填写其中一个即可）

返回说明（正常时返回的 json 示例）：

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok"
   }

错误码说明： 返回码 说明 -1 系统繁忙

3. 获取体验者列表
-----------------

请求方式: POST（请使用 https 协议）

https://api.weixin.qq.com/wxa/memberauth?access_token=TOKEN

POST 数据示例

.. code:: json

   {
     "action": "get_experiencer"
   }

返回说明

.. code:: json

   {
     "errcode": 0,

     "errmsg": "ok",

     "members": [
       {
         "userstr": "xxxxxxxx"
       },

       {
         "userstr": "yyyyyyyy"
       }
     ]
   }

参数说明 参数 说明 0 成功 members 人员列表 userstr 人员对应的唯一字符串

错误码说明 错误码 说明 0 成功 -1 系统错误
