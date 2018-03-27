# 修改服务器地址

## 1. 设置服务器域名

授权给第三方的小程序，其服务器域名只可以为第三方的服务器，当小程序通过第三方发布代码上线后，小程序原先自己配置的服务器域名将被删除，只保留第三方平台的域名，所以第三方平台在代替小程序发布代码之前，需要调用接口为小程序添加第三方自身的域名。

!!! note "提示"

        需要先将域名登记到第三方平台的小程序服务器域名中，才可以调用接口进行配置。

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/modify_domain?access_token=TOKEN

### 请求数据

示例：

```json
{
    "action":"add",
    "requestdomain":["https://www.qq.com","https://www.qq.com"],
    "wsrequestdomain":["wss://www.qq.com","wss://www.qq.com"],
    "uploaddomain":["https://www.qq.com","https://www.qq.com"],
    "downloaddomain":["https://www.qq.com","https://www.qq.com"],
}
```

### 参数说明

|参数	            |说明
|-|-|
|access_token	    |请使用第三方平台获取到的该小程序授权的authorizer_access_token
|action	            |add添加, delete删除, set覆盖, get获取。当参数是get时不需要填四个域名字段
|requestdomain	    |request合法域名，当action参数是get时不需要此字段
|wsrequestdomain	|socket合法域名，当action参数是get时不需要此字段
|uploaddomain	    |uploadFile合法域名，当action参数是get时不需要此字段
|downloaddomain	    |downloadFile合法域名，当action参数是get时不需要此字段

### 返回说明

正常时返回的json示例:

```json
{
    "errcode":0,
    "errmsg":"ok",
    //以下字段仅在get时返回
    "requestdomain":["https://www.qq.com","https://www.qq.com"],
    "wsrequestdomain":["wss://www.qq.com","wss://www.qq.com"],
    "uploaddomain":["https://www.qq.com","https://www.qq.com"],
    "downloaddomain":["https://www.qq.com","https://www.qq.com"],
}
```

## 2、设置业务域名

!!! warning

    仅供第三方代小程序调用

授权给第三方的小程序，其业务域名只可以为第三方的服务器，当小程序通过第三方发布代码上线后，小程序原先自己配置的业务域名将被删除，只保留第三方平台的域名，所以第三方平台在代替小程序发布代码之前，需要调用接口为小程序添加业务域名。

!!! note "提示"

    1. 需要先将域名登记到第三方平台的小程序业务域名中，才可以调用接口进行配置。
    2. 为授权的小程序配置域名时支持配置子域名，例如第三方登记的业务域名如为qq.com，则可以直接将qq.com及其子域名（如xxx.qq.com）也配置到授权的小程序中。

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/setwebviewdomain?access_token=TOKEN

### 请求数据

示例：

```json
{
    "action":"add",
    "webviewdomain":["https://www.qq.com","https://m.qq.com"]
}
```

### 参数说明

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token
|action	        |add添加, delete删除, set覆盖, get获取。当参数是get时不需要填webviewdomain字段。如果没有action字段参数，则默认见开放平台第三方登记的小程序业务域名全部添加到授权的小程序中
|webviewdomain	|小程序业务域名，当action参数是get时不需要此字段

### 返回说明

```json
{
    "errcode":0,
    "errmsg":"ok"
}
```

### 参数说明

|参数	    |说明
|-|-|
|errcode	|错误码
|errmsg	    |错误信息

### 错误码说明

|返回码	|说明
|-|-|
|89019	|业务域名无更改，无需重复设置
|89020	|尚未设置小程序业务域名，请先在第三方平台中设置小程序业务域名后在调用本接口
|89021	|请求保存的域名不是第三方平台中已设置的小程序业务域名或子域名
|89029	|业务域名数量超过限制