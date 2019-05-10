2、获取第三方平台 component_access_token
========================================

第三方平台 component_access_token
是第三方平台的下文中接口的调用凭据，也叫做令牌（component_access_token）。每个令牌是存在有效期（2
小时）的，且令牌的调用不是无限制的，请第三方平台做好令牌的管理，在令牌快过期时（比如
1 小时 50 分）再进行刷新。

请求方式
--------

``POST``
**https**://api.weixin.qq.com/cgi-bin/component/api_component_token

请求数据
--------

.. code:: json

   {
     "component_appid": "appid_value",
     "component_appsecret": "appsecret_value",
     "component_verify_ticket": "ticket_value"
   }

请求参数说明

======================= ===================================================================
参数                    说明
======================= ===================================================================
component_appid         第三方平台 appid
component_appsecret     第三方平台 appsecret
component_verify_ticket 微信后台推送的 ticket，此 ticket 会定时推送，具体请见本页的推送说明
======================= ===================================================================

返回结果
--------

.. code:: json

   {
     "component_access_token": "61W3mEpU66027wgNZ_MhGHNQDHnFATkDa9-2llqrMBjUwxRSNPbVsMmyD-yq8wZETSoE5NQgecigDrSHkPtIYA",
     "expires_in": 7200
   }

结果参数说明

====================== =======================
参数                   说明
====================== =======================
component_access_token 第三方平台 access_token
expires_in             有效期
====================== =======================
