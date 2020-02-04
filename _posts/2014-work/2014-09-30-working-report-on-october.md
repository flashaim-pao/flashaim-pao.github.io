---
layout: post
title: '工作紀實 10月'
date: 2014-09-30 08:52
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---

# Yahoo 圖文廣告找尋程式

此程式在這個月裡經歷了大轉變，伺服器與單機版本合併共 **3 個版本**。由於冠宇以 PHP 實作伺服器自動控制瀏覽器遇到諸多問題，所以尚未完成伺服器端，但我已完成**搜尋程式**（無操作界面）。然而有鑑於避免**伺服器故障期間無法搜尋廣告**的問題。我簡單地將搜尋程式加入**操作界面**成了**單機版**，隨意取名叫 **YG Searcher**。隨後感謝 **TaTa** 找到問題並協助測試，同時新增了匯出/匯入功能成為 1.1.0 版。

### 搜尋程式單機版 YG Searcher 1.0.0：

1. 加入 Google 帳號認證
    * 需以公司帳號登入後才能使用
1. 獨立執行視窗不干擾網頁瀏覽
1. 快速記錄搜尋連結

### 搜尋程式單機版 YG Searcher 1.1.0:

1. 修正設定檔的問題
1. 支援匯出匯入設定檔

# Trace

本月集中在實作各家的帳號登入功能，實現登入同時註冊會員、以及從帳號提供網站取得會員的各種資料。接著則要開始進行排程功能的開發。

1. 已實作項目
    + [#16 Soeasy - 整合資料擷取與資料匯入以實作商家資料同步程式](https://bitbucket.org/flashaim-trace-team/trace/issue/16)
    + [#25 會員 - 提供 Facebook 帳號登入前台](https://bitbucket.org/flashaim-trace-team/trace/issue/25)
    + [#26 會員 - 提供以 Yahoo 帳號登入前台](https://bitbucket.org/flashaim-trace-team/trace/issue/26)
    + [#28 會員 - 登出功能](https://bitbucket.org/flashaim-trace-team/trace/issue/28)
1. Review 團隊的實作項目
    + [#20 後臺 - 管理員認證](https://bitbucket.org/flashaim-trace-team/trace/issue/20)
    + [#22 後臺 - soeasy 預設景點排序](https://bitbucket.org/flashaim-trace-team/trace/issue/22)
    + [#27 設定熱門景點](https://bitbucket.org/flashaim-trace-team/trace/issue/27)

# Fansbee

本月加入了新人**信宇**參與討論，並協助 **POC (Proof of Concept)** 的開發。漸漸地也看到拖拉擺放模組來製作網頁的模樣。讓人覺得又進展了很多，也更能具體地測試我們的設計與想法了。

# 公司內部員工訓練

這是最後一次員工訓練課程，課程內容是 *MySQL Performance Tuning* 。同樣也是受益良多，大夥都熱烈討論。而往後則由我們內部人員互相開課，想必會是更為精彩（還好我不是排第一個 XD）。

# 其他

1. 協助客戶欲榮的伺服器資料庫安裝與管理
    * 安裝 phpMyAdmin 
    * 協助匯入資料庫資料
1. 協助維護 Mashup 1.0 的伺服器
1. 協助 Mashup 1.0 的商家 Domain Name 設定與問題排除
1. 協助解決 TaTa 遇到的 YG Searcher 問題
    * 在 Windows 下，新版 Chrome 會禁止**非經由 Chrome Market 所安裝的 Extension**
        - 暫時使用匯出匯入功能保留設定檔
1. 協助計畫 S1/S2 伺服器升級 MySQL
    * survey MySQL 5.1 升級 5.5 的影響
1. 協助解決 S1 上 phpMyAdmin 無法使用之問題 
    * 安裝另一份獨立的 phpMyAdmin

# 後記

爬樓梯不要用跑的......(攤）
