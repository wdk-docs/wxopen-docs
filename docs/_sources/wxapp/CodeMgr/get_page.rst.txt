4. 获取页面配置
========================================================


请求方式: get（请使用https协议）

https://api.weixin.qq.com/wxa/get_page?access_token=TOKEN
参数说明

参数	说明
access_token	请使用第三方平台获取到的该小程序授权的authorizer_access_token
返回说明（正常时返回的json示例）：


{
    "errcode":0,
    "errmsg":"ok",
    "page_list":[
        "index",
        "page\/list",
        "page\/detail"
    ]
}
返回参数说明：

参数	说明
page_list	page_list 页面配置列表
错误码说明：

返回码	说明
-1	系统繁忙
86000	不是由第三方代小程序进行调用
86001	不存在第三方的已经提交的代码
