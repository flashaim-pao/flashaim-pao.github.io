---
layout: post
title: '工作紀實 2015年 8月'
date: 2015-08-31 09:53
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# α 產品

產品開發進入白熱化，就和這8月的天氣一樣。現階段著重於各個基礎功能的建置，是為了能儘快推出使用。目前帳戶分析這方面已經把各種基礎分析的前後端完成。同時也根據前端規格的修正而修改系統，並且補上各個細節。雖然一個功能在畫面上看起來不起眼，背後卻要牽扯一大串的處理。例如「餘額顯示」這串*小小卻恐怖的數字*，它必須要能夠計算該帳戶的各個功能截至目前為止，各自消耗了多少款項。**尤其是每個功能的計費週期都是獨立的！**功能A可能是1月1號至30號，然而功能B可能是1月15號至2月14號，如何**正確**又有**效率**的找出記錄並計算出來，是本月完成裡最困難的工作（沒有之一）。

帳戶分析基礎功能大致完工也能自動在背景工作，因此研發重心先切換到另一邊：經過先前討論而被延宕的**競爭者分析**功能，終於能繼續開發。本月將其前後端真正的串聯在一起，完成了前端的畫面顯示（這部份的複雜程度也是目前數一數二），也能真正的進行搜尋與分析。整個計費程式貫穿整個後端（甚至是後台），當然也牽扯著競爭者分析功能，目前也已整合完畢。待完成背景自動化分析後，就能進入實地的測試。希望能儘快地讓產品交付給使用者，當然更希望不要有神祕的Bug發生才好...囧。

## 本月完成：

* #21:  首次登入需讓客戶同意使用條款與個資宣告
* #118:  尚未連結的帳戶分析頁面改為顯示介紹文字
* #134:  無法顯示B家帳戶分析的總覽頁內容
* #135:  實作儲值餘額顯示功能
* #147:  定時執行帳戶分析並記錄操作用於扣款
* #152:  Firefox 無法顯示登入按鈕
* #154:  實作前台顯示B家廣告排名與自然排名之功能
    + 修正 worker 連接失敗的狀況
* #155:  每組帳戶分析為獨立計費週期
    + 根據規格的修訂改寫程式
    + 增加獨立扣款週期計算程式
    + 增加款項計算程式
* 建置獨立的測試站台

## Review 並**協同修改**的項目：

* #158:  實作競爭者分析詳細 tab「總覽」內頁 - GEMINI
* #160:  實作帳戶分析詳細 tab「歷史文案」內頁
* #161:  實作彈跳頁-帳戶分析 GEMINI -調整出價
* #162:  實作彈跳頁-帳戶分析 GEMINI -設定條件
* #163:  實作側選單-寶貴建議與合作提案


## Review 的項目：

* #119:  帳號開通需要寄發通知信件
* #130:  付款機制需要增加 ％5 稅金
* #138:  讓卡片可橫向排列
* #130:  付款機制需要增加 ％5 稅金
* #141:  修改官網付款自訂金額輸入欄位樣式
* #131:  啟用帳號寄發通知信
* #132:  後台確認付款後加入到使用者帳號內
* #145:  修正立即改善彈跳內按鈕文字超出
* #144:  官網交易明細
* #159:  實作競爭者分析詳細 tab「紀錄」內頁

# MS

本月另一個重頭戲是「**α x M**」，與洲哥合作開發兩個產品之間的整合。主要概念其實就是 MS 要開發出 API，而 α 系統可以透過 API 修改頁面（當然前題是客戶也同時有使用 MS）！目前我已和洲哥討論出最初的 API 規格，而我也已完成初步的 demo 頁面。所以已經可以從 α 系統直接與 MS 溝通修改頁面。當然規格再幾次的討論後愈來愈完備，因此 API 跟測試程式都要繼續地修改與完善。我很樂見這樣的系統整合，期待兩者所擦出的火花！（至於是怎麼個搓合兩個系統呢？佛曰：不可說 XD）

* MS
    + 討論與規劃連接的 API
    + 協助製作 demo 頁面
* 協助設定 domain 9個