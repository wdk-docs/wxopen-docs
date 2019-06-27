基础信息设置
============

1. 设置小程序隐私设置（是否可被搜索）
-------------------------------------

请求方式: POST（请使用 https 协议）

https://api.weixin.qq.com/wxa/changewxasearchstatus?access_token=TOKEN

POST 数据示例

.. code:: json

   {
     "status": 0 //1 表示不可搜索，0 表示可搜索
   }

返回说明

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok"
   }

错误码说明

====== =================================
错误码 说明
====== =================================
0      成功
-1     系统错误
85083  搜索标记位被封禁，无法修改
85084  非法的 status 值，只能填 0 或者 1
====== =================================

2. 查询小程序当前隐私设置（是否可被搜索）
-----------------------------------------

请求方式: GET（请使用 https 协议）

https://api.weixin.qq.com/wxa/ getwxasearchstatus?access_token=TOKEN

返回说明

.. code:: json

   {
     "status": 1, //1 表示不可搜索，0 表示可搜索
     "errcode": 0,
     "errmsg": "ok"
   }

错误码说明

====== ========
错误码 说明
====== ========
0      成功
-1     系统错误
====== ========

3 小程序扫码公众号关注组件
--------------------------

用户扫码使用小程序时，即可展示当前公众号，用户可直接关注公众号。

客户端样式

小程序后台功能设置位置

3.1. 获取展示的公众号信息
~~~~~~~~~~~~~~~~~~~~~~~~~

请求方式：GET

https://api.weixin.qq.com/wxa/getshowwxaitem?access_token=TOKEN

返回参数（JSON 格式）：

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok",
     "can_open": 1,
     "is_open": 1,
     "appid": "展示的公众号 appid",
     "nickname": "展示的公众号 nickname",
     "headimg": "展示的公众号头像"
   }

参数说明：

======== =================================
参数名   说明
======== =================================
can_open 是否可以设置 1 可以，0，不可以
is_open  是否已经设置，1 已设置，0，未设置
appid    展示的公众号 appid
nickname 展示的公众号 nickname
headimg  展示的公众号头像
======== =================================

3.2 设置展示的公众号
~~~~~~~~~~~~~~~~~~~~

请求方式：POST

https://api.weixin.qq.com/wxa/updateshowwxaitem?access_token=TOKEN

请求参数

.. code:: json

   {
     "wxa_subscribe_biz_flag": 1,
     "appid": "如果开启，需要传新的公众号 appid"
   }

参数说明：

====================== ================================
参数名                 说明
====================== ================================
wxa_subscribe_biz_flag 0 关闭，1 开启
appid                  如果开启，需要传新的公众号 appid
====================== ================================

返回参数：

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok"
   }

3.3 获取可以用来设置的公众号列表
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

请求方式：GET

https://api.weixin.qq.com/wxa/getwxamplinkforshow?page=0&num=20&access_token=TOKEN

请求参数：

.. code:: json

   {
     "page": 0, //第几页，从 0 开始
     "num": 10 //每页记录数，最大为 20
   }

参数说明：

====== =====================
参数名 说明
====== =====================
page   第几页，从 0 开始
num    每页记录数，最大为 20
====== =====================

返回参数：

.. code:: json

   {
     "errcode": 0,
     "errmsg": "ok",
     "total_num": "//总记录数",
     "biz_info_list": [
       {
         "nickname": "公众号昵称",
         "appid": "公众号 appid",
         "headimg": "公众号头像"
       }
     ]
   }

参数说明：

========= ============
参数名    说明
========= ============
total_num 总记录数
nickname  公众号昵称
appid     公众号 appid
headimg   公众号头像
========= ============

小程序接口文档可见：\ `开放能力
official-account <https://developers.weixin.qq.com/miniprogram/dev/component/official-account.html>`__
