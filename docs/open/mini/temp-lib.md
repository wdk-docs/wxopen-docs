# 小程序代码模版库管理
​
第三方平台可以通过接口，可便捷管理模版库，添加或删除小程序代码模版。

## 1. 获取草稿

获取草稿箱内的所有临时代码草稿

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/gettemplatedraftlist?access_token=TOKEN

### 请求参数

|参数	|说明
|-|-|
|access_token	|请使用第三方平台自己的component_access_token

### 返回结果

```json
{
    errcode: 0,
    errmsg: 'ok',
    drafttemplate_list:
    [
        {
            create_time: 1488965944,
            user_version: 'VVV',
            user_desc: 'AAS',
            draft_id: 0
        },
        {
            create_time: 1504790906,
            user_version: '11',
            user_desc: '111111',
            draft_id: 4
        }
    ]
}
```

参数说明

|参数	        |说明
|-|-|
|create_time	|说开发者上传草稿时间
|user_version	|模版版本号，开发者自定义字段
|user_desc	    |模版描述 开发者自定义字段
|draft_id	    |草稿id

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85064	|找不到模版

## 2. 获取模板

获取代码模版库中的所有小程序代码模版

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/gettemplatelist?access_token=TOKEN

### 请求参数

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台 自己 的component_access_token

### 返回结果

```json
{
    errcode: 0,
    errmsg: 'ok',
    template_list:
    [
        {
            create_time: 1488965944,
            user_version: 'VVV',
            user_desc: 'AAS',
            template_id: 0
        },
        {
            create_time: 1504790906,
            user_version: '11',
            user_desc: '111111',
            template_id: 4
        }
    ]
}
```

参数说明

|参数	        |说明
|-|-|
|create_time	|被添加为模版的时间
|user_version	|模版版本号，开发者自定义字段
|user_desc	    |模版描述 开发者自定义字段
|template_id	|模版id

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85064	|找不到模版

## 3. 草稿选为模板

将草稿箱的草稿选为小程序代码模版

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/addtotemplate?access_token=TOKEN

### 请求数据

```JSON
{
    "draft_id":0
}
```

### 请求参数

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台 自己 的component_access_token
|draft_id	    |草稿ID，本字段可通过“ 获取草稿箱内的所有临时代码草稿 ”接口获得

### 返回结果

```JSON
{
    "errcode": 0,
    "errmsg": "OK",
}
```

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85064	|找不到草稿
|85065	|模版库已满

## 4. 删除模板

删除指定小程序代码模版

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/deletetemplate?access_token=TOKEN

### 请求数据

```JSON
{
    "template_id":0
}
```

### 请求参数

|参数	        |说明
|-|-|
|access_token	|请使用第三方平台 自己 的component_access_token
|template_id	|要删除的模版ID

### 返回结果

```JSON
{
    "errcode": 0,
    "errmsg": "ok",
}
```

### 错误码

|返回码	|说明
|-|-|
|-1	    |系统繁忙
|85064	|找不到草稿