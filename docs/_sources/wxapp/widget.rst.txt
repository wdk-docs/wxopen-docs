搜索 widget 接入指南
====================

概述
----

搜索 Widget，是微信搜索提供的可编程模板，开发者可以通过 API
的方式接入小程序的服务和内容信息，以适当的模板为用户提供服务和内容。

模板分为标准模板和自定义模板：
------------------------------

标准模板的搜索样式固定，如“购物单商品”、“功能直达”，当前已面向行业开放接入。开发者提交的方案通过平台审核后即可上线。
自定义模板支持开发者提交自定义的搜索样式，开发者可接入调试自定义模板，但服务暂不可对微信用户发布，具体发布时间待定。

购物单商品
----------

购物单是微信提供的小程序购物车和订单管理工具。小程序接入购物单后，购物车和订单商品将同步至购物单的“想买清单”和“已购订单”，同时也可以被微信用户搜索到。查看接入文档

.. figure:: https://mmbiz.qpic.cn/mmbiz_png/j9ZjBPiaKs5PicTTr4aS9ibT9bd0vWSZmHXk0Yt0TGwRq8QyzMff4Uo2oD1sqW4cEVxGS6D7R91qujaoYpnE9HCsw/0?wx_fmt=png
   :alt: 搜索关键词/品牌名称

   搜索关键词/品牌名称

功能直达
--------

功能直达，是指用户通过搜索直达小程序服务的一种搜索形态。小程序接入“功能直达”后，将出现在相关服务词的搜索结果中，同时获得服务入口外置的展现机会。可以搜索“快递”、“名片”体验。\ `查看接入文档 <https://developers.weixin.qq.com/miniprogram/introduction/widget/func-widget/index.html>`__\ 。

.. figure:: https://mmbiz.qpic.cn/mmbiz_png/j9ZjBPiaKs5PicTTr4aS9ibT9bd0vWSZmHX6qwx4XDnIIYtUoSRZLicqic99JdrPMPNojBYfTcDxW0Jia8fr3PLChydA/0?wx_fmt=png
   :alt: 功能直达

   功能直达

自定义模板
----------

开发者可通过各类自定义模板，将小程序内的服务和内容信息以 API
形式接入微信平台，便于用户搜索直达。开发完成后，开发者可在微信客户端进行体验，暂不能发布上线。\ `查看接入文档 <https://developers.weixin.qq.com/miniprogram/introduction/widget/custom/index.html>`__\ 。

.. figure:: https://mmbiz.qpic.cn/mmbiz_png/j9ZjBPiaKs5PicTTr4aS9ibT9bd0vWSZmHXOfWVALVAxsehSXJeR6k49AlZw5G68aP10gabjA9RruzvxMFnXzlyicw/0?wx_fmt=png
   :alt: 自定义模板

   自定义模板

详细文档可查看：\ `搜索 Widget
接入指南 <https://developers.weixin.qq.com/miniprogram/introduction/widget/>`__
