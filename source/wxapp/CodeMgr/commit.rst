1. 上传代码
===================================

请求方式: POST（请使用https协议）

https://api.weixin.qq.com/wxa/commit?access_token=TOKEN
POST数据示例:

{
"template_id":0,
"ext_json":"JSON_STRING", //*ext_json需为string类型，请参考下面的格式*
"user_version":"V1.0",
"user_desc":"test",
}
参数说明:

参数	说明
access_token	请使用第三方平台获取到的该小程序授权的authorizer_access_token
template_id	代码库中的代码模版ID
ext_json	第三方自定义的配置
user_version	代码版本号，开发者可自定义（长度不要超过64个字符）
user_desc	代码描述，开发者可自定义
ext_json需为string类型，格式示例如下 ：


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
    pages:["index","search/index"],
    "window":{
    },
    "networkTimeout":{
    },
    "tabBar":{
    },
}
（1）为了便于第三方平台使用同一个小程序模版为不同的小程序提供服务，第三方可以将自定义信息放置在ext_json中，在模版小程序中，可以使用接口获取自定义信息，从而区分不同的小程序。详见：小程序模版开发

（2）ext_json中的参数可选，参数详见 https://mp.weixin.qq.com/debug/wxadoc/dev/framework/config.html

（3）如果代码中已经有配置，则配置的合并规则为：除了pages和tabBar.list直接覆盖原配置，其他都为插入或同级覆盖。

（4）ext_json中暂时不支持配置plugins。

（5）ext_json中有限支持pages，支持配置模版页面的子集（ext_json中不可新增页面）。

（6）ext_json中有限支持subPackages，支持配置模版分包及其页面的子集（ext_json中配置的分包必须已声明于模版中，且不可新增分包页面）。

特殊字段说明：

参数	说明
ext	自定义字段仅允许在这里定义，可在小程序中调用
extPages	页面配置
extAppid	授权方Appid，可填入商户AppID，以区分不同商户
sitemap	用于配置小程序及其页面是否允许被微信索引
返回说明（正常时返回的json示例）：

{
"errcode":0,
"errmsg":"ok",
}
错误码说明：

返回码	说明
-1	系统繁忙
85013	无效的自定义配置
85014	无效的模版编号
85043	模版错误
85044	代码包超过大小限制
85045	ext_json有不存在的路径
85046	tabBar中缺少path
85047	pages字段为空
85048	ext_json解析失败
80082	没有权限使用该插件
80067	找不到使用的插件
80066	非法的插件版本
