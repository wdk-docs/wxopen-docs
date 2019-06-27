12. 查询最低基础库版本及版本用户比
======================================================================


请求方式: POST（请使用https协议）

https://api.weixin.qq.com/cgi-bin/wxopen/getweappsupportversion?access_token=TOKEN
无需携带的参数

返回说明

{
    "errcode": 0,
    "errmsg": "ok",
    "now_version": "1.0.0",
    "uv_info": {
        "items": [{
                "percentage": 0,
                "version": "1.0.0"
            },
            {
                "percentage": 0,
                "version": "1.0.1"
            },
            {
                "percentage": 0,
                "version": "1.1.0"
            }
            .....
        ]
    }?
}
参数说明:

参数	说明
errcode	错误码
errmsg	错误信息
now_version	当前版本
uv_info	受影响用户占比，item参数里面为一系列数组，每个数组带有参数percentage（受影响比例）以及version（版本号）
