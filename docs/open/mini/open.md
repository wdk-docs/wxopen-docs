# 开放平台绑定

第三方平台在获得此权限后，可以代替已授权的公众号/小程序创建开放平台帐号或进行绑定/解绑操作。

绑定在同一个开放平台帐号下的公众号及小程序，用户`unionid`一致。开发者可调用[获取用户基本信息(wx.getUserInfo)](https://mp.weixin.qq.com/debug/wxadoc/dev/api/open.html#wxgetuserinfoobject)接口获取用户`unionid`。

具体包括以下接口：

1. 创建开放平台帐号并绑定公众号/小程序
2. 将公众号/小程序绑定到已有开放平台帐号下
3. 将公众号/小程序从开放平台帐号下解绑
4. 获取公众号/小程序所绑定的开放平台帐号

!!! note "注意"

    1. 一个公众号/小程序帐号只可以绑定在一个开放平台帐号下。
    2. 授权第三方平台注册的开放平台帐号只可用于获取用户unionid实现用户身份打通，支持 绑定 同主体 的公众号及小程序，不可独立登录。
    3. 第三方平台不可操作（包括绑定/解绑） 通过open.weixin.qq.com线上流程注册的开放平台帐号。
    4. 小程序只可将此权限集授权给一个第三方平台，即授权互斥。

## 1. 创建并绑定

该API用于创建一个开放平台帐号，并将一个尚未绑定开放平台帐号的公众号或小程序绑定至该开放平台帐号上。新创建的开放平台帐号的主体信息将设置为与之绑定的公众号或小程序的主体。

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/open/create?access_token=xxxx

### 请求数据

```json
{
  "appid": " auth_appid_value ",
}
```

参数说明

|参数 | 说明
|-|-|
|appid | 授权公众号或小程序的 appid

### 返回结果

```json
{
  "open_appid":"appid_value",
  "errcode":0,
  "errmsg":"ok"
}
```

结果参数说明

|参数	         | 说明
|-|-|
|open _appid	| 所创建的开放平台帐号 的appid
|errcode	    | 错误码
|errmsg	      | 错误信息

### 错误码

|错误码	     | 说明
|-|-|
|0	        | ok
|-1	        | system error ， 系统错误
|40013	    | invalid appid ， appid 无效。
|89000	    | account has bound open ，该公众号 / 小程序 已经绑定了开放平台帐号

## 2. 绑定

该API用于将一个尚未绑定开放平台帐号的公众号或小程序绑定至指定开放平台帐号上。二者须主体相同。

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/open/bind?access_token=xxxx

### 请求数据

```json
{
"appid": " auth_appid_value",
"open_appid": " open_appid_value",
}
```

### 请求参数

|参数	      |说明
|-|-|
|appid	    |授权公众号或小程序的appid
|open_appid	|开放平台帐号appid

### 返回结果

```json
{
"errcode":0,
"errmsg":"ok"
}
```

结果参数说明

|参数	    |说明
|-|-|
|errcode	|错误码
|errmsg	  |错误信息

### 错误码

|错误码	|说明
|-|-|
|0	    |ok
|-1	    |system error，系统错误
|40013	|invalid appid，appid或open_appid无效。
|89000	|account has bound open，该公众号/小程序已经绑定了开放平台帐号
|89001	|not same contractor，Authorizer与开放平台帐号主体不相同
|89003	|该开放平台帐号并非通过api创建，不允许操作
|89004	|该开放平台帐号所绑定的公众号/小程序已达上限（100个）

## 3.解绑

该API用于将一个公众号或小程序与指定开放平台帐号解绑。开发者须确认所指定帐号与当前该公众号或小程序所绑定的开放平台帐号一致。

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/open/unbind?access_token=xxxx

### 请求数据

```json
{
"appid": " auth_appid_value",
"open_appid": " open_appid_value",
}
```

### 请求参数

|参数	      |说明
|-|-|
|appid	    |授权公众号或小程序的appid
|open_appid	|开放平台帐号appid

### 返回结果

```json
{
"errcode":0,
"errmsg":"ok"
}
```

结果参数说明

|参数	    |说明
|-|-|
|errcode	|错误码
|errmsg	  |错误信息

### 错误码

|错误码	|说明
|-|-|
|0	    |ok
|-1	    |system error，系统错误
|40013	|invalid appid，appid或open_appid无效。
|89001	|not same contractor，Authorizer与开放平台帐号主体不相同
|89003	|该开放平台帐号并非通过api创建，不允许操作

## 4. 获取绑定平台

该API用于获取公众号或小程序所绑定的开放平台帐号。

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/open/get?access_token=xxxx

### 请求数据

```json
{
"appid": " auth_appid_value",
}
```

### 请求参数

|参数	  |说明
|-|-|
|appid	|授权公众号或小程序的appid

### 返回结果

```json
{
"open_appid":"appid_value",
"errcode":0,
"errmsg":"ok"
}
```

结果参数说明

|参数	      |说明
|-|-|
|errcode	  |错误码
|errmsg	    |错误信息
|open_appid	|公众号或小程序所绑定的开放平台帐号的appid

### 错误码

|错误码	|说明
|-|-|
|0	    |ok
|-1	    |system error，系统错误
|40013	|invalid appid，appid无效。
|89002	|open not exists，该公众号/小程序未绑定微信开放平台帐号。