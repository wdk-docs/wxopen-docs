5. 获取（刷新）授权公众号或小程序的接口调用凭据（令牌）
=======================================================

该 API 用于在授权方令牌（authorizer_access_token）失效时，
可用刷新令牌（authorizer_refresh_token）获取新的令牌。请注意，
此处 token 是 2 小时刷新一次，开发者需要自行进行 token 的缓存，
避免 token 的获取次数达到每日的限定额度。
缓存方法可以参考：http://mp.weixin.qq.com/wiki/2/88b2bf1265a707c031e51f26ca5e6512.html

请求格式

``POST`` **https**:// api.weixin.qq.com
/cgi-bin/component/api_authorizer_token?component_access_token=xxxxx

请求数据

.. code:: json

   {
     "component_appid": "appid_value",
     "authorizer_appid": "auth_appid_value",
     "authorizer_refresh_token": "refresh_token_value"
   }

请求参数说明

+--------+-------------------------------------------------------------+
| 参数   | 说明                                                        |
+========+=============================================================+
| compon | 第三方平台 appid                                            |
| ent_ap |                                                             |
| pid    |                                                             |
+--------+-------------------------------------------------------------+
| author | 授权方 appid                                                |
| izer_a |                                                             |
| ppid   |                                                             |
+--------+-------------------------------------------------------------+
| author | 授权方的刷新令牌，刷新令牌主要用于第三方平台获取和刷新已授权用户的 |
| izer_r |                                                             |
| efresh | access_token，只会在授权时刻提供，请妥善保存。一旦丢失，只能让用户重新授权，才能再次拿到新的刷新令牌 |
| _token |                                                             |
+--------+-------------------------------------------------------------+

返回结果

.. code:: json

   {
     "authorizer_access_token": "aaUl5s6kAByLwgV0BhXNuIFFUqfrR8vTATsoSHukcIGqJgrc4KmMJ-JlKoC_-NKCLBvuU1cWPv4vDcLN8Z0pn5I45mpATruU0b51hzeT1f8",
     "expires_in": 7200,
     "authorizer_refresh_token": "BstnRqgTJBXb9N2aJq6L5hzfJwP406tpfahQeLNxX0w"
   }

结果参数说明

======================== =================
参数                     说明
======================== =================
authorizer_access_token  授权方令牌
expires_in               有效期，为 2 小时
authorizer_refresh_token 刷新令牌
======================== =================
