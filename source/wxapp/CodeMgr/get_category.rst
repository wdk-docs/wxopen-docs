3. 获取已设置类目
========================================================

注意：该接口可获取已设置的二级类目及用于代码审核的可选三级类目。

请求方式: get（请使用https协议）

https://api.weixin.qq.com/wxa/get_category?access_token=TOKEN
参数说明

参数	说明
access_token	请使用第三方平台获取到的该小程序授权的authorizer_access_token
返回说明（正常时返回的json示例）：

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
返回参数说明：

参数	说明
category_list	可填选的类目列表
first_class	一级类目名称
second_class	二级类目名称
third_class?	三级类目名称
first_id	一级类目的ID编号
second_id	二级类目的ID编号
third_id	三级类目的ID编号
错误码说明：

返回码	说明
-1	系统繁忙
