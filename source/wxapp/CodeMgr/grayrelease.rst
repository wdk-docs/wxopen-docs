16. 分阶段发布
========================================================

（1）分阶段发布接口

请求方式: POST（请使用https协议）

https://api.weixin.qq.com/wxa/grayrelease?access_token=TOKEN
POST数据示例

{
"gray_percentage": 1 //灰度的百分比，1到100的整数
}
返回说明

{
    "errcode":0,
    "errmsg":"ok",
}
错误码说明

错误码	说明
0	成功
-1	系统错误
86002	小程序未初始化完成
85079	小程序没有线上版本，不能进行灰度
85080	小程序提交的审核未审核通过
85081	无效的发布比例
85082	当前的发布比例需要比之前设置的高
（2）取消分阶段发布

请求方式: GET（请使用https协议）

https://api.weixin.qq.com/wxa/revertgrayrelease?access_token=TOKEN
返回说明

{
    "errcode":0,
    "errmsg":"ok",
}
错误码说明

错误码	说明
0	成功
-1	系统错误
（3）查询当前分阶段发布详情

请求方式: GET（请使用https协议）

https://api.weixin.qq.com/wxa/getgrayreleaseplan?access_token=TOKEN
返回说明

{
    "errcode":0,
    "errmsg":"ok",
    "gray_release_plan" : {
            "status" : 1, //0:初始状态 1:执行中 2:暂停中 3:执行完毕 4:被删除
            "create_timestamp" : 1517553721, //创建时间
            "gray_percentage" : 8
    },
}
错误码说明

错误码	说明
0	成功
-1	系统错误
