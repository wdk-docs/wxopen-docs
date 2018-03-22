# 是否可被搜索

## 1.隐私设置

### 请求方式

`POST` **https**://api.weixin.qq.com/wxa/changewxasearchstatus?access_token=TOKEN

### 请求数据

示例

```json
{
  "status":0, //1表示不可搜索，0表示可搜索
}
```

### 返回结果

```json
{
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|错误码	  |说明
|-|-|
|0	      |成功
|-1	      |系统错误
|85083	  |搜索标记位被封禁，无法修改
|85084	  |非法的status值，只能填0或者1

## 2. 查询隐私设置

### 请求方式

`GET` **https**://api.weixin.qq.com/wxa/getwxasearchstatus?access_token=TOKEN

### 返回结果

```json
{
    "status":1, //1表示不可搜索，0表示可搜索
    "errcode":0,
    "errmsg":"ok",
}
```

### 错误码

|错误码	|说明
|-|-|
|0	    |成功
|-1	    |系统错误
