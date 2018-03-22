# 小程序模板消息设置

为了便于第三方开发者对小程序模板消息接口的模版进行设置，更好得发送模版消息，现提供如下接口：

## 1.系统模板列表

获取小程序模板库标题列表

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/template/library/list?access_token=ACCESS_TOKEN

### 请求数据

```json
{
"offset":0,
"count":5
}
```

参数说明

|参数	          |是否必须	| 说明
|-|-|-|
|access_token	  |是	      |接口调用凭证
|offset	        |是	      |offset和count用于分页，表示从offset开始，拉取count条记录，offset从0开始，count最大为20。
|count	        |是	      |offset和count用于分页，表示从offset开始，拉取count条记录，offset从0开始，count最大为20。

### 返回结果

```json
{
  "errcode":0,
  "errmsg":"ok",
  "list":[
    {"id":"AT0002","title":"购买成功通知"},
    {"id":"AT0003","title":"购买失败通知"},
    {"id":"AT0004","title":"交易提醒"},
    {"id":"AT0005","title":"付款成功通知"},
    {"id":"AT0006","title":"付款失败通知"}
  ],
  "total_count":599
}
```

参数说明

|参数	        |说明
|-|-|
|id	          |模板标题id（获取模板标题下的关键词库时需要）
|title	      |模板标题内容
|total_count	|模板库标题总数

## 2.模板关键词

获取某个模板标题下关键词库

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/template/library/get?access_token=ACCESS_TOKEN

### 请求数据

```json
{
  "id":"AT0002"
}
```

参数说明

|参数	        |是否必须	|说明
|-|-|-|
|access_token	|是	      |接口调用凭证
|id	          |是	      |模板标题id，可通过接口获取，也可登录小程序后台查看获取

### 返回结果

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "id": "AT0002",
  "title": "购买成功通知",
  "keyword_list": [
    {
      "keyword_id": 3,
      "name": "购买地点",
      "example": "TIT造舰厂"
    },
    {
      "keyword_id": 4,
      "name": "购买时间",
      "example": "2016年6月6日"
    },
    {
      "keyword_id": 5,
      "name": "物品名称",
      "example": "咖啡"
    }
  ]
}
```

参数说明

|参数	        |说明
|-|-|
|keyword_id	  |关键词id，添加模板时需要
|name	        |关键词内容
|example	    |关键词内容对应的示例

## 3.添加模板

组合模板并添加至帐号下的个人模板库

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

### 请求数据

```json
{
  "id":"AT0002",
  "keyword_id_list":[3,4,5]
}
```

参数说明

|参数	            |是否必须	|说明
|-|-|-|
|access_token	    |是	      |接口调用凭证
|id	              |是	      |模板标题id
|keyword_id_list	|是	      |开发者自行组合好的模板关键词列表，关键词顺序可以自由搭配（例如[3,5,4]或[4,5,3]），最多支持10个关键词组合

### 返回结果

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "template_id": "wDYzYZVxobJivW9oMpSCpuvACOfJXQIoKUm0PY397Tc"
}
```

参数说明

|参数	        |说明
|-|-|
|template_id	|添加至帐号下的模板id，发送小程序模板消息时所需

为便于第三方开发者对帐号下已存在的模板进行操作，现提供如下接口：

## 4.我的模板

获取帐号下已存在的模板列表

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/template/list?access_token=ACCESS_TOKEN

### 请求数据

```json
{
  "offset":0,
  "count":1
}
```

参数说明

|参数	         |是否必须	|说明
|-|-|-|
|access_token	 |是	      |接口调用凭证
|offset	       |是	      |offset和count用于分页，表示从offset开始，拉取count条记录，offset从0开始，count最大为20。最后一页的list长度可能小于请求的count
|count	       |是	      |offset和count用于分页，表示从offset开始，拉取count条记录，offset从0开始，count最大为20。最后一页的list长度可能小于请求的count

### 返回结果

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "list": [
    {
      "template_id": "wDYzYZVxobJivW9oMpSCpuvACOfJXQIoKUm0PY397Tc",
      "title": "购买成功通知",
      "content": "购买地点{{keyword1.DATA}}\n购买时间{{keyword2.DATA}}\n物品名称{{keyword3.DATA}}\n",
      "example": "购买地点：TIT造舰厂\n购买时间：2016年6月6日\n物品名称：咖啡\n"
    }
  ]
}
```

参数说明

|参数	        |说明
|-|-|
|list	        |号下的模板列表
|template_id	|模板id，发送小程序模板消息时所需
|title	      |模板标题
|content	    |模板内容
|example	    |模板内容示例

## 5.删除模板

删除帐号下的某个模板

### 请求方式

`POST` **https**://api.weixin.qq.com/cgi-bin/wxopen/template/del?access_token=ACCESS_TOKEN

### 请求数据

```json
{
  "template_id":"wDYzYZVxobJivW9oMpSCpuvACOfJXQIoKUm0PY397Tc"
}
```

参数说明

|参数	         |是否必须	|说明
|-|-|-|
|access_token	 |是	      |接口调用凭证
|template_id	 |是	      |要删除的模板id

### 返回结果

```json
{
  "errcode":0,
  "errmsg":"ok"
}
```

下发模板消息接口，详见小程序模板消息下发说明