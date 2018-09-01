---
layout: post
title: '工作紀實 12月'
date: 2014-11-28 09:27
comments: true
categories: 
---
# Trace

這個月被瓜分了不少時間，而且不在當初規劃內。只能說計畫趕不上變化，主功能以外的次要功能只好延宕。不過主功能**排程編輯器**幾乎實作已完成，而其複雜度相當高，著實是個挑戰。然而卡在時間因素，否則還蠻多可以琢磨的地方，是比較可惜的部份。尚在製作中的自動排程還缺另一個演算法，但已有腹案所以不會花費太久。系統上線在即，剩餘的一些次要功能，就待之後陸續補齊。

1. 已實作項目
    + [#29 排程 - 排程編輯器](https://bitbucket.org/flashaim-trace-team/trace/issue/31)
        - 排程清單檢視
            - 顯示景點標記於地圖
            - 點擊景點移動地圖
            - 透過 GMap API 計算景點間的距離
        - 排程順序編輯
            - 滑鼠拖曳排列順序
            - 修改排程起點與開始時間
            - 儲存排程至後端
        - 支援已收藏的景點
            - 載入並顯示收藏的景點 
            - 加入景點至排程
        - 顯示行程路線
            - 透過 GMap API 取得導航路線
            - 繪製行程路線
            - 點擊路線以強調顯示
        - 自動重試 GMap API 呼叫（限額與限時）
1. Review 團隊的實作項目
    + [#35 收藏 - 景點收藏點擊愛心頁面套用](https://bitbucket.org/flashaim-trace-team/trace/issue/35)
    + [#39 景點 - 我的收藏頁面載入與挑選排程機制](https://bitbucket.org/flashaim-trace-team/trace/issue/39)
    + [#42: console-多操作幾次之後會無回應](https://bitbucket.org/flashaim-trace-team/trace/issue/42)
    + [#43: 景點-首頁 Detail 內容圖片愛心 icon 按鈕無功能](https://bitbucket.org/flashaim-trace-team/trace/issue/43)

# Fansbee

本月在**模組架構**上的討論著墨甚多，**模組架構**牽涉模組的*顯示*、*修改*與*製作*等規範，是 Fansbee 核心架構之一。必需要好好地設計，才能夠製作出構想中的模組以及應有的能力。待製作出模組後，拖曳式排版的頁面編輯器才有目標可以運作。因此，Proof of Concept（POC） 目前的實作重點便轉為模組架構的設計。我除了參與討論與協助初版架構的建立外，也提出了 **Fansbee Development Kit（FDK）**的構想。FDK 為一支跨平台的開發工具，可以協助大家開發模組程式。FDK 為指令式程式，提供簡單的數個指令可以達成：

1. fdk init
    + 將當前目錄作為模組開發專案，同時產生模組設定檔、模組範例檔（HTML CSS JS 檔等等）。
1. fdk watch
    + 執行後會執行一個簡單網頁伺服器，開發者可以在瀏覽器上即時預覽。同時會監視專案目錄，一有更動便立即更新瀏覽中的網頁。另外也會提供模組所需要的執行環境（相關的後端模擬程式、共用的 CSS 與 JS 檔案等等）。
1. fdk build
    + 執行後，會把模組專案內的檔案根據 Fansbee 的規格，打包並壓縮成為一個「模組包裝檔」。
1. fdk upload
    + 將包裝檔上傳到 Fansbee 後台當中，同時就註冊進去。當然，執行此指令需要輸入帳號密碼。

目前還在設計階段，但已獲得團隊的認可，預計明年初採用 Node.js 開發。

# PayPal 快速結帳

本月初發生了 PayPal 因安全性而即將禁止網站使用 SSL v3 與 PayPal 建立 HTTPs 連線的事件。因此協助洲哥、冠宇一同與 PayPal 工程師解決 PayPal 快速結帳網站的改版與測試。此外，由於目前僅在舊版 PayPal SDK 上解決問題，而舊版 PayPal Classic API 將來會被 PayPal 棄用。因此我也撰寫了使用新版 PayPal RESTful API 的 POC，也已成功界接。待將來安排時間後，再與洲哥一同改版系統使用新版 PayPal RESTful API。

1. 協助分析、修改與測試 PayPal 快速結帳系統
1. 測試 RESTful API 並整合至快速結帳網站（POC, pending）

# 其他

1. 協助分析與解決 https://payment.flashaim.com 的 SSL 憑證不受 MacOS 信任之問題
    * 在 MacOS 下，任何瀏覽器皆會發生
    * 安裝內含完整憑證的 CA 憑證包裹
        - 原本的檔案漏掉了**根憑證**
1. 協助分析與解決裕融 FTP 主機連線問題


    
    
      
