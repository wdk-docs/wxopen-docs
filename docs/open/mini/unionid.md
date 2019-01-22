# 支付后获取用户 Unionid 接口

调用前需要用户完成支付，且在支付后的五分钟内有效。

用户支付完成后，第三方平台可以代理小程序获取该用户的 unionid,无需用户授权。

## 请求地址

以下两种方式任选其一。

1.  微信订单号：

    GET https://api.weixin.qq.com/wxa/getpaidunionid?access_token=ACCESS_TOKEN&openid=OPENID&transaction_id=TRANSACTION_ID

2.  商户订单号：

    GET https://api.weixin.qq.com/wxa/getpaidunionid?access_token=ACCESS_TOKEN&openid=OPENID&mch_id=MCH_ID&out_trade_no=OUT_TRADE_NO

## 请求参数

| 属性           | 类型   | 必填 | 说明                                                           |
| -------------- | ------ | ---- | -------------------------------------------------------------- |
| access_token   | String | 是   | 请使用第三方平台获取到的该小程序授权的 authorizer_access_token |
| openid         | String | 是   | 支付用户唯一标识                                               |
| transaction_id | String | 否   | 微信订单号                                                     |
| mch_id         | String | 否   | 商户号，和商户订单号配合使用                                   |
| out_trade_no   | String | 否   | 商户订单号，和商户号配合使用                                   |

## 返回值

| 属性    | 类型             | 说明                         |
| ------- | ---------------- | ---------------------------- |
| unionid | String           | 用户唯一标识，调用成功后返回 |
| errcode | number           | 错误码                       |
|         | errcode 的合法值 |
|         | 值               | 说明                         |
|         | 0                | 请求成功                     |
|         | -1               | 系统错误                     |
|         | 40003            | openid 错误                  |
|         | 89002            | 没有绑定开放平台账号         |
|         | 89300            | 订单无效                     |
