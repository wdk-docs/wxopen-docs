语义理解上手指南
====================================================================


 语义理解上手指南
微信开放平台语义理解接口调用（http请求）简单方便，用户无需掌握语义理解及相关技术，只需根据自己的产品特点，选择相应的服务即可搭建一套智能语义服务。

第一步：创建应用
请到“管理中心”创建应用，点击“创建移动应用”或者“创建网站应用”，填写相关资料，然后将该应用提交审核，只有审核通过的应用才能进行开发。

注册完毕，我们会在 7 个工作日内完成审核工作。审核通过之后，开放平台将分配给该移动应用全局唯一的AppID和AppSecret。

第二步：根据AppID和AppSecret获得access token
调用接口：
http请求方式: GET
https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
参数说明：
参数	是否必须	说明
grant_type	是	获取access_token填写client_credential
appid	是	应用的appid
secret	是	应用的appsecret
返回说明：
正常情况下，微信会返回下述JSON数据包。

{
"access_token":"ACCESS_TOKEN",
"expires_in":7200
}
参数	说明
access_token	获取到的凭证
expires_in	凭证有效时间，单位：秒
错误时微信会返回错误码等信息，JSON数据包示例如下（该示例为AppID无效错误）:

{
"errcode":40013,
"errmsg":"invalid appid"
}
第三步：使用access token调用语义理解接口
输入说明：
http请求方式: POST（请使用https协议）
https://api.weixin.qq.com/semantic/semproxy/search?access_token=YOUR_ACCESS_TOKEN
POST数据格式：JSON
POST数据例子：
{
"query":"查一下明天从北京到上海的南航机票",
"city":"北京",
"category": "flight,hotel",
"appid":"wxaaaaaaaaaaaaaaaa",
"uid":"123456"
}
输入参数说明：
参数	是否必须	参数类型	说明
access_token	是	String	根据appid和appsecret获取到的token
query	是	String	输入文本串
category	是	String	需要使用的服务类型，多个用“,”隔开，不能为空
latitude	见接口协议文档	Float	纬度坐标，与经度同时传入；与城市二选一传入
longitude	见接口协议文档	Float	经度坐标，与纬度同时传入；与城市二选一传入
city	见接口协议文档	String	城市名称，与经纬度二选一传入
region	见接口协议文档	String	区域名称，在城市存在的情况下可省；与经纬度二选一传入
appid	是	String	Appid,开发者的唯一标识
uid	否	String	用户唯一id（非开发者id），用户区分应用下的不同用户（建议填入用户openid），如果为空，则无法使用上下文理解功能。appid和uid同时存在的情况下，才可以使用上下文理解功能。
返回说明：
正常情况下，微信会返回下述JSON数据包。

{
    "errcode":0,
    "query":"查一下明天从北京到上海的南航机票",
    "type":"flight",
    "semantic":{
        "details":{
            "start_loc":{
            "type":"LOC_CITY",
            "city":"北京市",
            "city_simple":"北京",
            "loc_ori":"北京"
            },
            "end_loc": {
            "type":"LOC_CITY",
            "city":"上海市",
            "city_simple":"上海",
            "loc_ori":"上海"
            },
            "start_date": {
            "type":"DT_ORI",
            "date":"2014-03-05",
            "date_ori":"明天"
            },
            "airline":"中国南方航空公司"
        },
        "intent":"SEARCH"
    }
}
返回参数说明：
参数	是否必须	参数类型	说明
errcode	是	Int	表示请求后的状态
query	是	String	用户的输入字符串
type	是	String	服务的全局类型id，详见协议文档中垂直服务协议定义
semantic	是	Object	语义理解后的结构化标识，各服务不同
result	否	Array	部分类别的结果
answer	否	String	部分类别的结果html5展示，目前不支持
text	否	String	特殊回复说明
更多详细内容与协议说明，请查看：语义理解接口协议文档

