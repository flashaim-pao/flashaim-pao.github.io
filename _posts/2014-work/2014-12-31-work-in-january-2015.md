---
layout: post
title: '工作紀實 2015年 1月'
date: 2014-12-31 08:39
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# Trace

Trace 專案來到尾聲了，本月終於完成**自動排程功能**，把**排程編輯器**給補完了。由於規劃路徑這樣的問題到了一定的規模（景點數量）就沒辦法得到最佳解（最短距離），因此設計第二組演算法用於較大的規模（目前是設定為12個點以上）。這裡我採用了 **[Ant System](http://goo.gl/E4VnwE)** （第一組是使用 [Branch & Bound](http://goo.gl/gc9G1v)），易於實作且效能不差（若要更複雜的演算法就之後再說吧 XD）。

另外，也把剩下的主功能都給收了尾，還修了一些 bug 與問題（記憶體問題還真難抓到**癥結**...）。主機方面則是可以使用 [Linode](http://linode.com) 的虛擬主機服務，**便宜好用而且速度很快**。不過可惜的是*東京機房*一位難求，只好先屈就於*美西機房*。另外也已經跟客服溝通過，等今年初東京第二機房蓋好再轉移過去了。目前已經完成網站的佈署，之後就看對方測試的狀況。

1. 已實作項目
    + [#1 使用 B&B 演算法建立路徑規劃 API](https://bitbucket.org/flashaim-trace-team/trace/issue/1)
    + [#29 排程 - 排程編輯器](https://bitbucket.org/flashaim-trace-team/trace/issue/29)
    + [#30 排程 - 由「我的收藏」頁面新增排程](https://bitbucket.org/flashaim-trace-team/trace/issue/30)
    + [#46 排程 - 以啟發式演算法實作排程自動排序](https://bitbucket.org/flashaim-trace-team/trace/issue/46)
    + [#51 排程 - 熱門排程頁面](https://bitbucket.org/flashaim-trace-team/trace/issue/51)
    + [#52 會員 - 「我的喜好」頁面](https://bitbucket.org/flashaim-trace-team/trace/issue/52)
    + [#53 Bug - 離島排程無回應(綠島)](https://bitbucket.org/flashaim-trace-team/trace/issue/53)
    + [#57 Memory leak - Trace 放置一陣子後會因為記憶體不足而崩潰](https://bitbucket.org/flashaim-trace-team/trace/issue/57)
    + [#59 佈署網站至正式機](https://bitbucket.org/flashaim-trace-team/trace/issue/59)
1. Review 團隊的實作項目
    + [#35 收藏 - 景點收藏點擊愛心頁面套用](https://bitbucket.org/flashaim-trace-team/trace/issue/35)
    + [#36 後台 - console Soeasy 景點 Tab 分類](https://bitbucket.org/flashaim-trace-team/trace/issue/36)
    + [#43 景點-首頁 Detail 內容圖片愛心 icon 按鈕無功能](https://bitbucket.org/flashaim-trace-team/trace/issue/43)
    + [#45 後台 - console 設定熱門排程](https://bitbucket.org/flashaim-trace-team/trace/issue/45)
    + [#48 API - 熱門排程列表](https://bitbucket.org/flashaim-trace-team/trace/issue/48)
    + [#54 console - debug 模式調整](https://bitbucket.org/flashaim-trace-team/trace/issue/54)
    + [#56 console - Auth Seesion 檢查](https://bitbucket.org/flashaim-trace-team/trace/issue/56)

# Fansbee

經過了幾次會議後，決定先進行可行性實驗。因此跟 Tina 主席討論了兩組**分眾實驗**，主要目的是要了解*有分眾的網站是否在轉換率上優於未分眾的網站*。此外我也負責與 **Tina 主席**一起實作第一組實驗，目前就等待進行多人的實驗。

1. 協助規劃網頁分眾實驗
1. 協助製作實驗1之程式
    + 整合 Google 帳號**偵測性別**並引導至對應的主頁
    + 有一半的機率會讓**已偵測到性別的使用者**仍然走**預設頁面**（A/B Test）
    + 埋入 Google Analytics 追蹤碼

# Native Ads Searcher (NADS)

也就是 **YG Searcher 2.0**，一個最大的轉變是 2.0 為一個網站服務。使用者不必再安裝於自己的電腦裡，只需要上這網站內搜尋歷史記錄即可。NADS 會 24/7 不斷的去爬原生廣告，無需使用者去驅使才會去爬網站。事實上，網站型的系統是 YG Searcher 1.0 當初的目標，只是延宕到 2.0 才有機會去實現。

目前規劃的架構會分為 `User Site`、`Admin Site`、`RESTful Report Service` 以及 `Web-based Searcher`，圖中的實線是資料流；虛線則是控制流。
<img class="center" src="http://user-image.logdown.io/user/5845/blog/5862/post/247986/8o9b3duhRMYOUs89PMkw_Selection_001.png" alt="NADS資料流簡圖">

目前實作上一改之前使用 [Vagrant](https://www.vagrantup.com/) 虛擬機開發環境，而是改採 [Docker](https://www.docker.com/) 搭配 [Fig](http://www.fig.sh/) 作為開發，用以達到更深入的**自動化佈署**。讓開發用的環境更接近實際上線的環境，減少人工也減少錯誤。目前使用的狀況相當順利，也讓我更為熟悉 Docker 的使用方法與訣竅。

另外 `Web-based Searcher` 也改採 [SlimeJS](http://slimerjs.org/) 而不是 **Chrome Extension**。SlimeJS 是一套**網頁自動化測試**框架，特色是使用 [Gecko](http://zh.wikipedia.org/zh-tw/Gecko) 這套用來打造 Firefox 的核心程式（也可以看成是輕量版的 Firefox）。相較於之前的 Chrome Extension，SlimeJS 能不受 Sandbox 的侷限而且可以在文字模式下執行。如此可以大幅簡化開發的難度，而且耗用的資源更小。雖然是**網頁自動化測試**框架，但用於自動化爬網站也是非常合適呢。（Web-based Searcher 這取名很冗長但是個伏筆，就拭目以待吧）

1. [nads-1: 設計並實作 Yahoo Mobile 首頁的搜尋器（尚未完成）](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/1)
    + 目前完成
        * 使用 Docker 虛擬機器建立開發環境
        * 使用 SlimerJS 開啟網頁
        * 截圖


# 其他

1. 協助大夥記錄第三方程式庫的授權
    * [製作共用文件](http://goo.gl/nLVRP1)
    * 記錄所用到的第三方程式庫授權 
    * 協助識別授權是否有問題
1. 協助 GIT 相關問題排除
    * 小葉、思宇
1. 協助建立裕融新伺服器的連線以提供洲哥開發程式之用
1. 協助解決 Mashup 的時間偏移問題
    
      
