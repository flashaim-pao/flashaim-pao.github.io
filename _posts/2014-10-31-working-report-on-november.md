---
layout: post
title: '工作紀實 11月'
date: 2014-10-31 10:11
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---

# Yahoo 圖文廣告找尋程式

Chrome Stable 自從 **39 版**之後，修改了 Content Security Policy 規格，以致於許多人的 YG Searcher 無法繼續使用。此外，**Windows 版** Chrome Stable 會禁止非由 Chrome Store 安裝的 Extension，必須改為使用 [Chrome Canary](https://www.google.com/intl/zh-TW/chrome/browser/canary.html?platform=win) 版。然而 Canary 版的設定與正式版不同，因此 YG Searcher 不相容此種版本。因此開發了 1.2.0 版解決此兩大問題，同時還加上同事們回饋裡希望加入的新功能。

1. version 1.2.0
    + [ygs-14: 支援 Chrome Stable 39 版與 Chrome Canary 版](https://bitbucket.org/flashaim-rd/yahoo-gemini-searcher/issue/14)
        - 修改為新版 Content Security Policy 規範
        - 支援測試版的環境配置
    + [ygs-15: 批次刪除記錄](https://bitbucket.org/flashaim-rd/yahoo-gemini-searcher/issue/15)
    + [ygs-16: 批次下載記錄](https://bitbucket.org/flashaim-rd/yahoo-gemini-searcher/issue/16)

# Trace

本月開始進行 Trace 最重要的功能**「旅遊排程」**的開發，冠宇則同步開發景點相關的功能，讓速度可以加快。此外，還修正了若干問題。依照目前的進度來看是有點緊，尤其是還有其他工作要忙。希望開發能一切順利，才不會影響員工旅遊時的心情。

1. 已實作項目
    + [#31 排程 - 排程管理頁面](https://bitbucket.org/flashaim-trace-team/trace/issue/31)
    + [#32 排程 - 排程 RESTful API](https://bitbucket.org/flashaim-trace-team/trace/issue/32)
    + [#33 使用 Google 登入時，經常被瀏覽器阻擋彈出視窗。](https://bitbucket.org/flashaim-trace-team/trace/issue/33)
1. Review 團隊的實作項目
    + [#5: API - 景點搜尋](https://bitbucket.org/flashaim-trace-team/trace/issue/5)
    + [#34 收藏 - 景點收藏 REST API](https://bitbucket.org/flashaim-trace-team/trace/issue/34)
    + [#37 API - 景點查詢條件調整](https://bitbucket.org/flashaim-trace-team/trace/issue/37)
    + [#38 景點 - 所有頁面熱門景點效果](https://bitbucket.org/flashaim-trace-team/trace/issue/38)

# PayPal 快速結帳

由於 SSL 有重大安全性漏洞，PayPal 將於今年度12月3日禁止網站使用 SSL v3 與 PayPal 建立 HTTPs 連線，需改為 TLS v1 以上版本。而公司所開發的 PayPal 快速結帳系統依然是使用舊版 SDK，不支援 TLS 。經過問題的分析與初步嘗試解決後，得出需要升級 SDK 的結論。不過新版 SDK 的作法與以往不同，因此必須要改寫原有的程式。目前仁哥、洲哥與我還在進行升級當中，希望能趕在 12/3 之前完成。

1. 協助分析 PayPal SSL 連線升級問題
    + 12/3 前 PayPal 將禁止使用 SSLv3 連接 PayPal，必須改為使用 TLS 連接
1. 協助快速結帳系統升級 PayPal SDK 至最新版本 （進行中）

# ERP

1. 協助阿信排除 PHP 的 MIME 錯誤
1. 協助阿信解決 MySQL 連線管理界面問題
    * cpanel 強制停用過期的 phpmyadmin

# 其他

1. 協助排除裕融網站伺服器問題
    * 管理 Apache 伺服器並排除 log 檔過大問題
    * 分析 log 找尋問題徵兆
        + 每週日早上 4 點左右會發生 Apache 故障
