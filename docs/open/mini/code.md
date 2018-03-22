# 代码管理

第三方平台在开发者工具上开发完成后，可点击上传，代码将上传到开放平台草稿箱中，第三方平台可选择将代码添加到代码中，获得代码模版ID后，可调用以下接口进行代码管理。

## 1. 上传代码

为授权的小程序帐号上传小程序代码

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/commit?access_token=TOKEN

### 请求数据

```json
{
    "template_id":0,
    "ext_json":"JSON_STRING", //*ext_json需为string类型，请参考下面的格式*
    "user_version":"V1.0",
    "user_desc":"test",
}
```

参数说明:

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token
|template_id	|代码库中的代码模版ID
|ext_json	    |第三方自定义的配置
|user_version	|代码版本号，开发者可自定义
|user_desc	    |代码描述，开发者可自定义
|ext_json       |需为string类型，格式示例如下 :

```json
{
    extAppid:"",
    ext:{
        "attr1":"value1",
        "attr2":"value2",
    },
    extPages:{
        "index":{
        },
        "search/index":{
        },
    },
    pages:["index":"search/index"],
    "window":{
    },
    "networkTimeout":{
    },
    "tabBar":{
    },
}
```

1. 为了便于第三方平台使用同一个小程序模版为不同的小程序提供服务，第三方可以将自定义信息放置在ext_json中，在模版小程序中，可以使用接口获取自定义信息，从而区分不同的小程序。详见:小程序模版开发
2. ext_json中的参数可选，参数详见https://mp.weixin.qq.com/debug/wxadoc/dev/framework/config.html
3. 如果代码中已经有配置，则配置的合并规则为:除了pages和tabBar.list直接覆盖原配置，其他都为插入或同级覆盖。

特殊字段说明:

|参数	    |说明
|-|-|
|ext	    |自定义字段仅允许在这里定义，可在小程序中调用
|extPages	|页面配置
|extAppid	|授权方Appid，可填入商户AppID，以区分不同商户

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85013	|无效的自定义配置
|85014	|无效的模版编号
|85043	|模版错误
|85044	|代码包超过大小限制
|85045	|ext_json有不存在的路径
|85046	|tabBar中缺少path
|85047	|pages字段为空
|85048	|ext_json解析失败

## 2.体验二维码

获取体验小程序的体验二维码

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/ get_qrcode?access_token=TOKEN&path=page%2Findex%3Faction%3D1

参数说明

|参数	|说明
|-|-|
|path	|指定体验版二维码跳转到某个具体页面（如果不需要的话，则不需要填path参数，可在路径后以"?参数"方式传入参数）具体的路径加参数需要urlencode，比如page/index?action=1编码后得到page%2Findex%3Faction%3D1

### 返回结果

正确情况下的返回HTTP头如下:

```http
HTTP/1.1 200 OK

Connection: close

Content-Type: image/jpeg

Content-disposition: attachment; filename="QRCode.jpg"

Date: Sun, 06 Jan 2013 10:20:18 GMT

Cache-Control: no-cache, must-revalidate

Content-Length: 339721
```

### 错误码

```json
{
    "errcode":-1,
    "errmsg":"system error"
}
```

## 3. 可选类目

获取授权小程序帐号的可选类目

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/get_category?access_token=TOKEN

参数说明

|参数           |说明
|-|-|
|access_token   |请使用第三方平台获取到的该小程序授权的authorizer_access_token

### 返回结果

```json
{
    "errcode":0,
    "errmsg": "ok",
    "category_list" : [
        {
            "first_class":"工具",
            "second_class":"备忘录"，
            "first_id":1,
            "second_id":2,
        }
        {
            "first_class":"教育",
            "second_class":"学历教育",
            "third_class":"高等"
            "first_id":3,
            "second_id":4,
            "third_id":5,
        }
    ]
}
```

参数说明

|参数	        |说明
|-|-|
|category_list	|可填选的类目列表
|first_class	|一级类目名称
|second_class	|二级类目名称
|third_class	|三级类目名称
|first_id	    |一级类目的ID编号
|second_id	    |二级类目的ID编号
|third_id	    |三级类目的ID编号

### 错误码

|返回码	|说明
|-|-|
|-1	|系统繁忙

## 4.页面配置

获取小程序的第三方提交代码的页面配置（仅供第三方开发者代小程序调用）

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/get_page?access_token=TOKEN

参数说明

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
    "page_list":[
        "index",
        "page\/list",
        "page\/detail"
    ]
}
```

参数说明

|参数	|说明
|-|-|
|page_list	|page_list 页面配置列表

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|86000	|不是由第三方代小程序进行调用
|86001	|不存在第三方的已经提交的代码

## 5. 提交审核

将第三方提交的代码包提交审核（仅供第三方开发者代小程序调用）

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/submit_audit?access_token=TOKEN

### 请求数据

```JSON
{
    "item_list": [
    {
        "address":"index",
        "tag":"学习 生活",
        "first_class": "文娱",
        "second_class": "资讯",
        "first_id":1,
        "second_id":2,
        "title": "首页"
    }
    {
        "address":"page/logs/logs",
        "tag":"学习 工作",
        "first_class": "教育",
        "second_class": "学历教育",
        "third_class": "高等",
        "first_id":3,
        "second_id":4,
        "third_id":5,
        "title": "日志"
    }
  ]
}
```

参数说明

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token
|item_list	    |提交审核项的一个列表（至少填写1项，至多填写5项）
|address	    |小程序的页面，可通过"获取小程序的第三方提交代码的页面配置"接口获得
|tag	        |小程序的标签，多个标签用空格分隔，标签不能多于10个，标签长度不超过20
|first_class	|一级类目名称，可通过"获取授权小程序帐号的可选类目"接口获得
|second_class	|二级类目(同上)
|third_class	|三级类目(同上)
|first_id	    |一级类目的ID，可通过"获取授权小程序帐号的可选类目"接口获得
|second_id	    |二级类目的ID(同上)
|third_id	    |三级类目的ID(同上)
|title	        |小程序页面的标题,标题长度不超过32

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
    "auditid":1234567
}
```

参数说明

|参数	|说明
|-|-|
|auditid	|审核编号

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|86000	|不是由第三方代小程序进行调用
|86001	|不存在第三方的已经提交的代码
|85006	|标签格式错误
|85007	|页面路径错误
|85008	|类目填写错误
|85009	|已经有正在审核的版本
|85010	|item_list有项目为空
|85011	|标题填写错误
|85023	|审核列表填写的项目数不在1-5以内
|85077	|小程序类目信息失效（类目中含有官方下架的类目，请重新选择类目）
|86002	|小程序还未设置昵称、头像、简介。请先设置完后再重新提交。

## 6. 获取审核结果

当小程序有审核结果后，第三方平台将可以通过开放平台上填写的回调地址，获得审核结果通知。

审核通过时，接收到的推送XML数据包示例如下:

```xml
<xml>
    <ToUserName><![CDATA[gh_fb9688c2a4b2]]></ToUserName>
    <FromUserName><![CDATA[od1P50M-fNQI5Gcq-trm4a7apsU8]]></FromUserName>
    <CreateTime>1488856741</CreateTime>
    <MsgType><![CDATA[event]]></MsgType>
    <Event><![CDATA[weapp_audit_success]]></Event>
    <SuccTime>1488856741</SuccTime>
</xml>
```

参数说明:

|参数	        |说明
|-|-|
|ToUserName	    |小程序的原始ID
|FromUserName	|发送方帐号（一个OpenID，此时发送方是系统帐号）
|CreateTime	    |消息创建时间 （整型），时间戳
|MsgType	    |消息类型，event
|Event	        |事件类型 weapp_audit_success
|SuccTime	    |审核成功时的时间（整形），时间戳

审核不通过时，接收到的推送XML数据包示例如下:

```xml
<xml>
    <ToUserName><![CDATA[gh_fb9688c2a4b2]]></ToUserName>
    <FromUserName><![CDATA[od1P50M-fNQI5Gcq-trm4a7apsU8]]></FromUserName>
    <CreateTime>1488856591</CreateTime>
    <MsgType><![CDATA[event]]></MsgType>
    <Event><![CDATA[weapp_audit_fail]]></Event>
    <Reason><![CDATA[1:账号信息不符合规范:<br>(1):包含色情因素<br>2:服务类目"金融业-保险_"与你提交代码审核时设置的功能页面内容不一致:<br>(1):功能页面设置的部分标签不属于所选的服务类目范围。<br>(2):功能页面设置的部分标签与该页面内容不相关。<br>]]></Reason>
    <FailTime>1488856591</FailTime>
</xml>
```

参数说明:

|参数	        |说明
|-|-|
|ToUserName	    |小程序的原始ID
|FromUserName	|发送方帐号（一个OpenID，此时发送方是系统帐号）
|CreateTime	    |消息创建时间 （整型），时间戳
|MsgType	    |消息类型，event
|Event	        |事件类型 weapp_audit_success
|Reason	        |审核失败的原因
|FailTime	    |审核失败时的时间（整型），时间戳

除了消息通知之外，第三方平台也可通过接口查询审核状态。

## 7. 审核状态

查询某个指定版本的审核状态（仅供第三方代小程序调用）

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/get_auditstatus?access_token=TOKEN

### 请求数据

```json
{
    "auditid":1234567
}
```

参数说明:

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token
|auditid	    |提交审核时获得的审核id

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
    "status":1,
    "reason":"帐号信息不合规范"
}
```

参数说明

|参数	|说明
|-|-|
|status	|审核状态，其中0为审核成功，1为审核失败，2为审核中
|reason	|当status=1，审核被拒绝时，返回的拒绝原因

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|86000	|不是由第三方代小程序进行调用
|86001	|不存在第三方的已经提交的代码
|85012	|无效的审核id

## 8. 最新审核

查询最新一次提交的审核状态（仅供第三方代小程序调用）

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/get_latest_auditstatus?access_token=TOKEN

参数说明:

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
    "auditid":"1234567",
    "status":1,
    "reason":"帐号信息不合规范"
}
```

参数说明

|参数	    |说明
|-|-|
|auditid	|最新的审核ID
|status	    |审核状态，其中0为审核成功，1为审核失败，2为审核中
|reason	    |当status=1，审核被拒绝时，返回的拒绝原因

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|86000	|不是由第三方代小程序进行调用
|86001	|不存在第三方的已经提交的代码
|85012	|无效的审核id

## 9. 发布

发布已通过审核的小程序（仅供第三方代小程序调用）

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/release?access_token=TOKEN

### 请求数据

{ }

参数说明:

请填写空的数据包，POST的json数据包为空即可。

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85019	|没有审核版本
|85020	|审核状态未满足发布

## 10. 代码可见

修改小程序线上代码的可见状态（仅供第三方代小程序调用）

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/change_visitstatus?access_token=TOKEN

### 请求数据

```json
{
    "action"="close"
}
```

参数说明:

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台获取到的该小程序授权的authorizer_access_token
|action	        |设置可访问状态，发布后默认可访问，close为不可见，open为可见

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85021	|状态不可变
|85022	|action非法

## 12. 版本信息查询

查询当前设置的最低基础库版本及各版本用户占比 （仅供第三方代小程序调用）

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/getweappsupportversion?access_token=TOKEN

### 请求数据

无需携带的参数

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
    "now_version":"1.0.0",
    "uv_info" : {
        "items" : [
            {
                "percentage" : 0,
                "version" : "1.0.0"
            },
            {
                "percentage" : 0,
                "version" : "1.0.1"
            },
            {
                "percentage" : 0,
                "version" : "1.1.0"
            }
            .....
        ]
    }
}
```

参数说明

|参数	    |说明
|-|-|
|errcode	    |错误码
|errmsg	        |错误信息
|now_version	|当前版本
|uv_info	    |受影响用户占比，item参数里面为一系列数组，每个数组带有参数percentage（受影响比例）以及version（版本号）

## 13. 最低版本

设置最低基础库版本（仅供第三方代小程序调用）

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/setweappsupportversion?access_token=TOKEN

### 请求示例

```json
{
    "version":"1.0.0",
}
```

参数说明

|参数	    |说明
|-|-|
|version	|版本

### 返回结果

```json
{
    "errcode" : 0,"errmsg" : "ok",
}
```

参数说明

|参数	    |说明
|-|-|
|errcode	|错误码
|errmsg	    |错误信息

### 错误码

|错误码	|错误说明
|-|-|
|85015	|版本输入错误

## 15. 版本回退

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/revertcoderelease?access_token=TOKEN

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|错误码	|说明
|-|-|
|0	    |成功
|-1	    |系统错误
|87011	|现网已经在灰度发布，不能进行版本回退
|87012	|该版本不能回退，可能的原因:1:无上一个线上版用于回退 2:此版本为已回退版本，不能回退 3:此版本为回退功能上线之前的版本，不能回退

## 16. 审核撤回

单个帐号每天审核撤回次数最多不超过1次，一个月不超过10次。

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/undocodeaudit?access_token=TOKEN

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok"
}
```

### 错误码

|错误码	|说明
|-|-|
|0	    |成功
|-1	    |系统错误
|87013	|撤回次数达到上限（每天一次，每个月10次）


小程序分阶段发布

## 17.1. 分阶段发布接口

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/grayrelease?access_token=TOKEN

POST数据示例

```json
{
    "gray_percentage": 1 //灰度的百分比，1到100的整数
}
```

返回说明

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

错误码说明

|错误码	|说明
|-|-|
|0	    |成功
|-1	    |系统错误
|86002	|小程序未初始化完成
|85079	|小程序没有线上版本，不能进行灰度
|85080	|小程序提交的审核未审核通过
|85081	|无效的发布比例
|85082	|当前的发布比例需要比之前设置的高

## 17.2. 取消分阶段发布

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/revertgrayrelease?access_token=TOKEN

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|错误码	|说明
|-|-|
|0	    |成功
|-1	    |系统错误

## 17.3. 查询当前分阶段发布详情

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/getgrayreleaseplan?access_token=TOKEN

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
    "gray_release_plan" : {
            "status" : 1, //0:初始状态 1:执行中 2:暂停中 3:执行完毕 4:被删除
            "create_timestamp" : 1517553721, //创建时间
            "gray_percentage" : 8
    },
}
```

### 错误码

|错误码	|说明
|-|-|
|0	    |成功
|-1	    |系统错误
