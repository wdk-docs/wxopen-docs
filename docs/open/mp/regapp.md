# 复用公众号主体快速注册小程序

## 能力介绍

为帮助已有公众号用户快速接入小程序服务，公众平台新增"快速注册小程序"权限集。公众号可授权第三方平台快速注册并认证小程序。
一个公众号只可以将该权限集授权给一个第三方平台，即授权互斥。
完成注册后的小程序默认授权给该第三方平台管理，没有独立的帐号密码，不可登录小程序后台。

## 开放范围

已认证的企业/媒体/政府/其他组织类型公众号。一个公众号一个月可以复用资质注册 5 个小程序。

## 相关规则

1. 复用资质创建的小程序默认与该公众号关联；不占一个月新增关联 13 个小程序的限制;
2. 复用资质创建的小程序关联公众号，不下发模板消息，不默认出现在公众号资料页;
3. 一个公众号若存在"待完成注册"的小程序，不可发起复用资质创建小程序;
4. 一个公众号一个月内可复用资质注册小程序不多于 5 个。(创建成功才占用);
5. 使用复用公众号资质注册小程序，将以本公众号的主体作为该小程序的开发者；
6. 若选择了复用认证资质，则小程序完成注册后即是"已认证"状态。认证到期时间与公众号一致。

## 快速注册流程

- 步骤一：权限准备

  第三方平台使用该接口前需具备以下 5 个权限集：

  1. 账号服务权限
  2. 小程序账号管理权限
  3. 小程序开发管理与数据分析权限
  4. 小程序认证权限
  5. 小程序基本信息设置权限

  准备好权限集，全网发布视为生效。

  详细流程可参考：《授权流程技术说明》

- 步骤二：使用注册接口创建小程序

- 步骤三：使用小程序账号信息设置接口，补充新建小程序信息

## 1. 注册流程及接口说明

快速注册接口使用流程说明：

- 步骤一：从第三方平台页面发起，并跳转至微信公众平台指定授权注册页面。
- 步骤二：公众号管理员扫码确认复用公众号资质快速注册小程序。
- 步骤三：管理员扫码验证通过后跳转至第三方平台页面，微信将注册结果返回给第三方平台。

### 1.1. 从第三方平台跳转至微信公众平台授权注册页面

从第三方平台跳转到微信公众平台授权页，需携带的参数如下

| 参数            | 参数说明                                                                                                                                |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| component_appid | 第三方平台的 appid                                                                                                                      |
| appid           | 公众号的 appid                                                                                                                          |
| copy_wx_verify  | 是否复用公众号的资质进行微信认证(1:申请复用资质进行微信 认证 0:不申请)                                                                  |
| redirect_uri    | 用户扫码授权后，MP 扫码页面将跳转到该地址(注:1.链接需 urlencode 2.Host 需和第三方平台在微信开放平台上面填写的登 录授权的发起页域名一致) |

跳转到微信公众平台授权页面链接举例:

https://mp.weixin.qq.com/cgi-bin/fastregisterauth?appid=wx28f759479ea1e090&component_appid=wx666666666666123&copy_wx_verify=1&redirect_uri=https%3a%2f%2fwww.qq.com%2fauth%2fcallback%3ffrom%3dmp

示例示意图：

![授权页示意图](https://mmbiz.qpic.cn/mmbiz_png/j9ZjBPiaKs5O7FmGFVpZVUicyFzGvJe4SvKMaDaRhapqeqWwrhdRW0Pd6NE72kgwZCMbYCwM1SHwbT5GsicmQ2jSQ/0?wx_fmt=png)

### 1.2. 公众号管理员扫码确认授权注册，并跳转回第三方平台

公众号管理员扫码后在手机端完成授权确认。

跳转回第三方平台，会在上述 redirect_uri 后拼接 ticket=\*

跳转回第三方平台举例:

https://www.qq.com/auth/callback?from=mp&ticket=b25519093b1e97239eff9d2bfc07e08e

### 1.3. 跳转至第三方平台，第三方平台调用快速注册 API 完成注册

请求方式:

POST(请使用 https 协议)

https://api.weixin.qq.com/cgi-bin/account/fastregister?access_token=TOKEN

注：使用公众号 appid 换取 authorizer_access_token

请求示例:

```json
{
  "ticket": "b25519093b1e97239eff9d2bfc07e08e"
}
```

参数说明:

| 参数   | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| ticket | 公众号扫码授权的凭证(公众平台扫码页面回跳到第三方平台时携带) |

返回说明:

```json
{
  "errcode": 0,
  "errmsg": "",
  "appid": "wxe5f52902cf4de896",
  "authorization_code": "****",
  "is_wx_verify_succ": "true",
  "is_link_succ": "true"
}
```

注：使用 `appid` 及 `authorization_code` 换取 `authorizer_refresh_token` 后需及时保存。

如未保存可参考公众号第三方平台的权限说明 重新获取。

参数说明:

| 参数               | 说明                             |
| ------------------ | -------------------------------- |
| errcode            | 错误码                           |
| errmsg             | 错误信息                         |
| appid              | 新创建小程序的 appid             |
| authorization_code | 新创建小程序的授权码             |
| is_wx_verify_succ  | 复用公众号微信认证小程序是否成功 |
| is_link_succ       | 小程序是否和公众号关联成功       |

错误码说明:

| 错误码 | 错误说明                                                                               |
| ------ | -------------------------------------------------------------------------------------- |
| 61051  | 公众号主体类型不允许快速创建                                                           |
| 61052  | 公众号未认证                                                                           |
| 61053  | 超过主体可注册数量上限                                                                 |
| 61054  | 主体黑名单                                                                             |
| 61055  | 超出公众号每月可快速创建限额                                                           |
| 61056  | 政府. 媒体. 其他组织必须复选微信认证                                                   |
| 61057  | 公众号仍有快速创建的账号在流程中                                                       |
| 61058  | 用户扫码凭证校验不通过                                                                 |
| 61028  | 第三方平台未发布                                                                       |
| 61029  | 第三方平台缺少必备权限集(帐号服务权限. 程序帐号管理权限. 小程序开发管理与数据分析权限) |
| 61060  | 转 uri 不合法                                                                          |
| 61061  | 海外帐号不允许快速创建                                                                 |

!!! note "注:小程序信息设置相关接口"

    该章节接口需要使用 1.3 环节获取到的新创建小程序 `appid` 及 `authorization_code` 换取 `authorizer_refresh_token` 进而得到 `authorizer_access_token。`

### 2. 获取帐号基本信息

请求方式：

GET: https://api.weixin.qq.com/cgi-bin/account/getaccountbasicinfo?access_token=TOKEN

返回数据：

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "appid": "wxdc685123d955453",
  "account_type": 2,
  "principal_type": 1,
  "principal_name": "深圳市腾讯计算机系统有限公司",
  "realname_status": 1,
  "wx_verify_info": {
    "qualification_verify": 1,
    "naming_verify": 1,
    "annual_review": 1,
    "annual_review_begin_time": 1550490981,
    "annual_review_end_time": 1558266981
  },
  "signature_info": {
    "signature": "功能介绍",
    "modify_used_count": 1,
    "modify_quota": 5
  },
  "head_image_info": {
    "head_image_url": "http://mmbiz.qpic.cn/mmbiz/a5icZrUmbV8p5jb6RZ8aYfjfS2AVle8URwBt8QIu6XbGewB9wiaWYWkPwq4R7pfdsFibuLkic16UcxDSNYtB8HnC1Q/0",
    "modify_used_count": 3,
    "modify_quota": 5
  }
}
```

参数说明：

| 参数名          | 子参数                   | 描述                                                                                                                                                                                                                                                                                                                                                       |
| --------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| appid           |                          | 帐号 appid                                                                                                                                                                                                                                                                                                                                                 |
| account_type    |                          | 帐号类型（1：订阅号，2：服务号，3：小程序）                                                                                                                                                                                                                                                                                                                |
| principal_type  |                          | 主体类型（1：企业）                                                                                                                                                                                                                                                                                                                                        |
| principal_name  |                          | 主体名称                                                                                                                                                                                                                                                                                                                                                   |
| realname_status |                          | 实名验证状态（1：实名验证成功，2：实名验证中，3：实名验证失败）调用接口 1.1 创建帐号时，realname_status 会初始化为 2 对于注册方式为微信认证的帐号，资质认证成功时，realname_status 会更新为 1 注意！！！当 realname_status 不为 1 时，帐号只允许调用本文档内的以下 API：（即无权限调用其他 API） 微信认证相关接口（参考 2.x） 帐号设置相关接口（参考 3.x） |
| wx_verify_info  | 微信认证信息             |                                                                                                                                                                                                                                                                                                                                                            |
|                 | qualification_verify     | 是否资质认证（true：是，false：否）若是，拥有微信认证相关的权限。                                                                                                                                                                                                                                                                                          |
|                 | naming_verify            | 是否名称认证（true：是，false：否）对于公众号（订阅号. 服务号），是名称认证，微信客户端才会有微信认证打勾的标识。                                                                                                                                                                                                                                          |
|                 | annual_review            | 是否需要年审（true：是，false：否）（qualification_verify = true 时才有该字段）                                                                                                                                                                                                                                                                            |
|                 | annual_review_begin_time | 年审开始时间，时间戳（qualification_verify = true 时才有该字段）                                                                                                                                                                                                                                                                                           |
|                 | annual_review_end_time   | 年审截止时间，时间戳（qualification_verify = true 时才有该字段）                                                                                                                                                                                                                                                                                           |
| signature_info  | 功能介绍信息             |                                                                                                                                                                                                                                                                                                                                                            |
|                 | signature                | 功能介绍                                                                                                                                                                                                                                                                                                                                                   |
|                 | modify_used_count        | 功能介绍已使用修改次数（本月）                                                                                                                                                                                                                                                                                                                             |
|                 | modify_quota             | 功能介绍修改次数总额度（本月）                                                                                                                                                                                                                                                                                                                             |
| head_image_info | 头像信息                 |                                                                                                                                                                                                                                                                                                                                                            |
|                 | head_image_url           | 头像 url                                                                                                                                                                                                                                                                                                                                                   |
|                 | modify_used_count        | 头像已使用修改次数（本月）                                                                                                                                                                                                                                                                                                                                 |
|                 | modify_quota             | 头像修改次数总额度（本月）                                                                                                                                                                                                                                                                                                                                 |

返回码说明：

| errcode 取值 | 说明 |
| ------------ | ---- |
| 非 0         | 异常 |

## 3. 设置名称

### 3.1. 微信认证名称检测

请求方式：

POST(请使用 https 协议)

URL：https://api.weixin.qq.com/cgi-bin/wxverify/checkwxverifynickname?access_token=TOKEN

POST 数据：

```json
{
  "nick_name": "杨幂的测试用例"
}
```

参数说明：

| 参数      | 必填/选填 | 类型   | 说明         |
| --------- | --------- | ------ | ------------ |
| nick_name | 必填      | string | 名称（昵称） |

返回数据：

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "hit_condition": true,
  "wording": "你申请的名称可能涉及特定主体姓名或名称，请提供可确认主体材料与名称对应的材料，或提供《商标注册证》等其他材料，以证明你有权合理且善意使用该名称，否则可能审核不通过"
}
```

参数说明：

| 参数名        | 类型   | 描述                                           |
| ------------- | ------ | ---------------------------------------------- |
| hit_condition | bool   | 是否命中关键字策略。若命中，可以选填关键字材料 |
| wording       | string | 命中关键字的说明描述（给用户看的）             |

返回码说明：

| errcode 取值 | 说明                                                                                                                                      |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| 53010        | 名称格式不合法                                                                                                                            |
| 53011        | 名称检测命中频率限制                                                                                                                      |
| 53012        | 禁止使用该名称                                                                                                                            |
| 53013        | 公众号：名称与已有公众号名称重复;小程序：该名称与已有小程序名称重复                                                                       |
| 53014        | 公众号：公众号已有{名称 A+}时，需与该帐号相同主体才可申请{名称 A};小程序：小程序已有{名称 A+}时，需与该帐号相同主体才可申请{名称 A}       |
| 53015        | 公众号：该名称与已有小程序名称重复，需与该小程序帐号相同主体才可申请;小程序：该名称与已有公众号名称重复，需与该公众号帐号相同主体才可申请 |
| 53016        | 公众号：该名称与已有多个小程序名称重复，暂不支持申请;小程序：该名称与已有多个公众号名称重复，暂不支持申请                                 |
| 53017        | 公众号：小程序已有{名称 A+}时，需与该帐号相同主体才可申请{名称 A};小程序：公众号已有{名称 A+}时，需与该帐号相同主体才可申请{名称 A}       |
| 53018        | 名称命中微信号                                                                                                                            |
| 53019        | 名称在保护期内                                                                                                                            |

### 3.2. 名称设置及改名

请求方式:

POST(请使用 https 协议)

https://api.weixin.qq.com/wxa/setnickname?access_token=TOKEN

POST 数据示例:

```json
{
  "nick_name": "XXX 公司",
  "id_card": "12345678-0",
  "license": "广州市新港中路 397 号 TIT 创意园",
  "naming_other_stuff_1": "3LaLzqiTrQcD20DlX_o-OV1-nlYMu7sdVAL7SV2PrxVyjZFZZmB3O6LPGaYXlZWq",
  "naming_other_stuff_2": "",
  "naming_other_stuff_3": "",
  "naming_other_stuff_4": "",
  "naming_other_stuff_5": ""
}
```

请求参数:

| 参数                 | 说明                                      | 备注       |
| -------------------- | ----------------------------------------- | ---------- |
| nick_name            | 昵称                                      | 必填       |
| id_card              | 身份证照片–临时素材 mediaid               | 个人号必填 |
| license              | 组织机构代码证或营业执照–临时素材 mediaid | 组织号必填 |
| naming_other_stuff_1 | 其他证明材料---临时素材 mediaid           | 选填       |
| naming_other_stuff_2 | 其他证明材料---临时素材 mediaid           | 选填       |
| naming_other_stuff_3 | 其他证明材料---临时素材 mediaid           | 选填       |
| naming_other_stuff_4 | 其他证明材料---临时素材 mediaid           | 选填       |
| naming_other_stuff_5 | 其他证明材料---临时素材 mediaid           | 选填       |

注: 临时素材 mediaid 通过调用"临时素材管理接口"获取.

新增临时素材: https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1444738726

获取临时素材: https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1444738727

第三方代小程序调用上述接口:

https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resourceres_list&verify=1&id=open1453779503&token=&lang=zh_CN

返回 json 示例(门店小程序类目分一级和二级类目):

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "wording": "",
  "audit_id": 12345
}
```

返回参数说明:

| 参数     | 说明      |
| -------- | --------- |
| wording  | 材料说明  |
| audit_id | 审核单 id |

错误码说明:

| 返回码 | 说明                                   |
| ------ | -------------------------------------- |
| 91001  | 不是公众号快速创建的小程序             |
| 91002  | 小程序发布后不可改名                   |
| 91003  | 改名状态不合法                         |
| 91004  | 昵称不合法                             |
| 91005  | 昵称命中主体保护                       |
| 91006  | 昵称命中微信号                         |
| 91007  | 昵称已被占用                           |
| 91008  | 昵称命中 7 天侵权保护期                |
| 91009  | 需要提交材料                           |
| 91010  | 其他错误                               |
| 91015  | 创建的小程序名称与对应公众号主体不一致 |

### 3.3. 改名审核状态查询

请求方式：

POST（请使用 https 协议）

https://api.weixin.qq.com/wxa/api_wxa_querynickname?access_token=TOKEN

POST 数据示例：

```json
{
  "audit_id": 12345
}
```

请求参数：

| 参数     | 说明      | 备注 |
| -------- | --------- | ---- |
| audit_id | 审核单 id | 必填 |

返回 json 示例：

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "nickname": "xxx",
  "audit_stat": 2,
  "fail_reason": "xxx",
  "create_time": 1519724071,
  "audit_time": 1519724950
}
```

返回参数说明：

| 参数        | 说明                                          |
| ----------- | --------------------------------------------- |
| nickname    | 审核昵称                                      |
| audit_stat  | 审核状态，1：审核中，2：审核失败，3：审核成功 |
| fail_reason | 失败原因                                      |
| create_time | 审核提交时间                                  |
| audit_time  | 审核完成时间                                  |

错误码说明：

| 返回码 | 说明                     |
| ------ | ------------------------ |
| 91011  | 查不到昵称修改审核单信息 |
| 91012  | 其它错误                 |

## 4. 修改头像

请求方式：

POST(请使用 https 协议)

URL：https://api.weixin.qq.com/cgi-bin/account/modifyheadimage?access_token=TOKEN

POST 数据：

```json
{
  "head_img_media_id": "mI-4E_sFh_2X3g-qmTIWD83RT78ytI1_6VfgFp_A3-Y2U5T_nLl3nm1xYTafFJ8p",
  "x1": 0,
  "y1": 0,
  "x2": 0.7596899224806202,
  "y2": 0.49
}
```

参数说明：

| 参数名            | 必填/选填 | 类型     | 说明                                    |
| ----------------- | --------- | -------- | --------------------------------------- |
| head_img_media_id | 必填      | media_id | 头像素材 media_id                       |
| x1                | 必填      | float    | 裁剪框左上角 x 坐标（取值范围：[0, 1]） |
| y1                | 必填      | float    | 裁剪框左上角 y 坐标（取值范围：[0, 1]） |
| x2                | 必填      | float    | 裁剪框右下角 x 坐标（取值范围：[0, 1]） |
| y2                | 必填      | float    | 裁剪框右下角 y 坐标（取值范围：[0, 1]） |

返回数据：

```json
{
  "errcode": 0,
  "errmsg": "ok"
}
```

图片格式只支持：BMP. JPEG. JPG. GIF. PNG，大小不超过 2M

注：实际头像始终为正方形

示例示意图：

头像示意图

返回码说明：

| errcode 取值 | 说明                   |
| ------------ | ---------------------- |
| 40097        | 参数错误               |
| 41006        | media_id 不能为空      |
| 40007        | 非法的 media_id        |
| 46001        | media_id 不存在        |
| 40009        | 图片尺寸太大           |
| 53202        | 本月头像修改次数已用完 |

## 5. 修改功能介绍

请求方式：

POST(请使用 https 协议)

URL：https://api.weixin.qq.com/cgi-bin/account/modifysignature?access_token=TOKEN

POST 数据：

```json
{
  "signature": "提供好玩的服务。"
}
```

参数说明：

| 参数名    | 必填/选填 | 类型   | 说明             |
| --------- | --------- | ------ | ---------------- |
| signature | 必填      | string | 功能介绍（简介） |

返回数据：

```json
{
  "errcode": 0,
  "errmsg": "ok"
}
```

返回码说明：

| errcode 取值 | 说明                         |
| ------------ | ---------------------------- |
| 40097        | 参数错误                     |
| 53200        | 本月功能介绍修改次数已用完   |
| 53201        | 功能介绍内容命中黑名单关键字 |

## 6. 设置类目

注：该章节接口需要使用 1.3 环节获取到的新创建小程序 appid 及 authorization_code 换取 authorizer_refresh_token 进而得到 authorizer_access_token。

### 6.1. 获取账号可以设置的所有类目

请求方式：

GET 数据

URL：https://api.weixin.qq.com/cgi-bin/wxopen/getallcategories?access_token=TOKEN

返回参数（JSON 格式）：

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "category_list": {
    "categories": [
      {
        "children": [874],
        "father": 0,
        "id": 868,
        "level": 1,
        "name": "时政信息",
        "qualify": {
          "exter_list": [
            {
              "inner_list": [
                {
                  "name": "有资质证件：《互联网新闻信息服务许可证》",
                  "url": ""
                }
              ]
            },
            {
              "inner_list": [
                {
                  "name": "无资质：ICP 备案和《组织机构代码证》",
                  "url": ""
                }
              ]
            }
          ]
        },
        "sensitive_type": 1
      }
    ]
  }
}
```

参数说明：

| 参数名                             | 说明                                                                           |
| ---------------------------------- | ------------------------------------------------------------------------------ |
| id                                 | 类目 ID                                                                        |
| Name                               | 类目名称                                                                       |
| Level                              | 类目层级                                                                       |
| Father                             | 类目父级 ID                                                                    |
| Children                           | 子级类目 ID                                                                    |
| Sensitive_type                     | 是否为敏感类目（1 为敏感类目，需要提供相应资质审核；0 为非敏感类目，无需审核） |
| Qualify.exter_list.inner_list.name | Sensitive_type 为 1 的类目需要提供的资质文件名称                               |
| Qualify.exter_list.inner_list.url  | 资质文件示例                                                                   |

### 6.2. 添加类目

请求方式：

POST(请使用 https 协议)

URL：https://api.weixin.qq.com/cgi-bin/wxopen/addcategory?access_token=TOKEN

请求参数：

```json
{
  "categories": [
    {
      "first": 8,
      "second": 39,
      "certicates": [
        {
          "key": "《因私出入境中介机构经营许可证》",
          "value": "xxx"
        }
      ]
    }
  ]
}
```

参数说明：

| 参数名 | 必填/选填 | 类型         | 说明        |
| ------ | --------- | ------------ | ----------- |
| first  | 必填      | Unsigned int | 一级类目 ID |
| Second | 必填      | Unsigned int | 二级类目 ID |
| Key    | 必填      | String       | 资质名称    |
| Value  | 必填      | media_id     | 资质图片    |

返回参数（JSON 格式）：

```json
{
  "errcode": 0,
  "errmsg": "ok"
}
```

### 6.3. 删除类目

请求方式：

POST(请使用 https 协议)

URL：https://api.weixin.qq.com/cgi-bin/wxopen/deletecategory?access_token=TOKEN

参数说明：

| 参数名 | 必填/选填 | 类型         | 说明        |
| ------ | --------- | ------------ | ----------- |
| first  | 必填      | Unsigned int | 一级类目 ID |
| Second | 必填      | Unsigned int | 二级类目 ID |

返回（JSON 格式）：

```json
{
  "errcode": 0,
  "errmsg": "ok"
}
```

### 6.4. 获取账号已经设置的所有类目

请求方式：

GET URL：https://api.weixin.qq.com/cgi-bin/wxopen/getcategory?access_token=TOKEN

参数说明：

返回（JSON 格式）：

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "categories": [
    {
      "first": 8,
      "first_name": "教育",
      "second": 39,
      "second_name": "出国移民",
      "audit_status": 1,
      "audit_reason": ""
    }
  ],
  "limit": 5,
  "quota": 4,
  "category_limit": 20
}
```

参数说明：

| 参数名         | 子参数       | 必填/选填 | 类型         | 说明                                         |
| -------------- | ------------ | --------- | ------------ | -------------------------------------------- |
| categories     |              | 必填      | object       | 类目对象                                     |
|                | first        | 必填      | Unsigned int | 一级类目 ID                                  |
|                | first_name   | 必填      | string       | 一级类目名称                                 |
|                | second       | 必填      | Unsigned int | 二级类目 ID                                  |
|                | second_name  | 必填      | string       | 二级类目名称                                 |
|                | audit_status | 必填      | Unsigned int | 审核状态（1 审核中 2 审核不通过 3 审核通过） |
|                | audit_reason | 必填      | String       | 审核不通过原因                               |
| limit          |              | 必填      | Unsigned int | 一个更改周期内可以设置类目的次数             |
| quota          |              | 必填      | Unsigned int | 本更改周期内还可以设置类目的次数             |
| category_limit |              | 必填      | Unsigned int | 最多可以设置的类目数量                       |

### 6.5. 修改类目

请求方式：

POST(请使用 https 协议)

URL：https://api.weixin.qq.com/cgi-bin/wxopen/modifycategory?access_token=TOKEN

POST 数据：

```json
{
  "first": 8,
  "second": 39,
  "certicates": [
    {
      "key": "《因私出入境中介机构经营许可证》",
      "value": ""
    }
  ]
}
```

参数说明：

| 参数名 | 必填/选填 | 类型         | 说明        |
| ------ | --------- | ------------ | ----------- |
| first  | 必填      | Unsigned int | 一级类目 ID |
| Second | 必填      | Unsigned int | 二级类目 ID |
| Key    | 必填      | String       | 资质名称    |
| Value  | 必填      | String       | 资质图片    |

返回（JSON 格式）：

```json
{
  "errcode": 0,
  "errmsg": "ok"
}
```

返回码说明：

| errcode 取值 | 说明                                          |
| ------------ | --------------------------------------------- |
| 53300        | 超出每月次数限制                              |
| 53301        | 超出可配置类目总数限制                        |
| 53302        | 当前账号主体类型不允许设置此种类目            |
| 53303        | 提交的参数不合法                              |
| 53304        | 与已有类目重复                                |
| 53305        | 包含未通过 IPC 校验的类目                     |
| 53306        | 修改类目只允许修改类目资质，不允许修改类目 ID |
| 53307        | 只有审核失败的类目允许修改                    |
| 53308        | 审核中的类目不允许删除                        |

## 7. 换绑管理员

流程

- 步骤一：从第三方平台页面发起，并跳转至微信公众平台指定换绑页面。
- 步骤二：小程序原管理员扫码，并填写原管理员身份证信息确认。
- 步骤三：填写新管理员信息(姓名. 身份证. 手机号)，使用新管理员的微信确认。
- 步骤四：点击提交后跳转至第三方平台页面，第三方平台回调对应 api 完成换绑流程。

流程及接口说明

### 7.1. 从第三方平台跳转至微信公众平台授权注册页面

从第三方平台跳转到微信公众平台授权页，需携带的参数如下：

| 参数            | 参数说明                                                                                                                                     |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| component_appid | 第三方平台的 appid                                                                                                                           |
| appid           | 公众号的 appid                                                                                                                               |
| redirect_uri    | 新管理员信息填写完成点击提交后，将跳转到该地址(注：1.链接需 urlencode 2.Host 需和第三方平台在微信开放平台上面填写的登录授权的发起页域名一致) |

跳转到微信公众平台授权页面链接举例:

https://mp.weixin.qq.com/wxopen/componentrebindadmin?appid=wx28f759479ea1e090&component_appid=wx666666666666123&redirect_uri=https%3a%2f%2f www.qq.com%2fauth%2fcallback%3ffrom%3dmp

### 7.2. 小程序新旧管理员填写信息，扫码确认提交后跳转回第三方平台

点击页面提交按钮。

跳转回第三方平台，会在上述 redirect_uri 后拼接 taskid=\*

跳转回第三方平台举例：

https://www.qq.com/auth/callback?taskid=b25519093b1e97239eff9d2bfc07e08e

### 7.3. 跳转至第三方平台，第三方平台调用快速注册 API 完成管理员换绑。

请求方式：

请求方式: POST(请使用 https 协议)

https://api.weixin.qq.com/cgi-bin/account/componentrebindadmin?access_token=TOKEN

请求示例:

```json
{
  "taskid": "b25519093b1e97239eff9d2bfc07e08e"
}
```

参数说明:

| 参数   | 说明                                                             |
| ------ | ---------------------------------------------------------------- |
| taskid | 换绑管理员任务序列号(公众平台最终点击提交回跳到第三方平台时携带) |

返回说明:

```json
{
  "errcode": 0,
  "errmsg": ""
}
```

参数说明

| 参数    | 说明     |
| ------- | -------- |
| errcode | 错误码   |
| errmsg  | 错误信息 |

错误码说明

| 错误码 | 错误码说明                   |
| ------ | ---------------------------- |
| 85060  | 无效的 taskid                |
| 85027  | 身份证绑定管理员名额达到上限 |
| 85061  | 手机号绑定管理员名额达到上限 |
| 85026  | 微信号绑定管理员名额达到上限 |
| 85063  | 身份证黑名单                 |
| 85062  | 手机号黑名单                 |
