---
layout: post
title: '工作紀實 2015年 3月'
date: 2015-02-24 02:06
comments: true
categories: 
---
# Trace

雖說目前已進入*收尾*的階段，不過還是有好幾件事情要先處理。例如修改與安裝認証憑證給測試網址使用（http://trace.ddns.net），當然這是因為 Yahoo API 不太友善所致，其他兩家的登入系統只需要去後台改一下*參照網域*就好了呢。

中間發生一個比較少見的狀況，正式機呼叫（搜便利） Soeasy API 發生 SSL 連線問題（HTTPs）。安全連線的其中一個安全要件是驗證網站的身份（從瀏覽器的角度去看），而身份則是透過**受信任的憑證**作為識別的依據。數位憑證通常是成串，下層的憑證會有上層的憑證之簽名，用來擔保憑證的正確性（最上層的憑證直接受到所有人的信任）。這次的問題就在於 Soeasy API 所使用的憑證鏈當中的*第2個憑證*不受作業系統信任所導致：「VeriSign Class 3 Secure Server CA - G3」。最後解決的方法是*手動安裝此憑證到作業系統以暫時解決問題*。附帶一提的是，*瀏覽器不依賴作業系統的判斷所以無此問題*，瀏覽器使用內建的信任清單。

這專案開發了許久，雖然請對方一起測試網站，不過似乎都沒有動靜？反而三天兩頭對方的 API 回傳的資料，文字編碼都會出錯...

已完成：

1. [trace-61: 無法在正式機上使用 Facebook 帳號登入](https://bitbucket.org/flashaim-trace-team/trace/issue/61)
1. [trace-62: 修改佈署腳本讓伺服器目錄不被清除](https://bitbucket.org/flashaim-trace-team/trace/issue/62)

Review 團隊的實作項目：

1. [trace-7: API - 景點照片](https://bitbucket.org/flashaim-trace-team/trace/issue/7)
1. [trace-63: 前台 - 排程頁面下方熱門景點遮蔽問題](https://bitbucket.org/flashaim-trace-team/trace/issue/63)
1. [trace-64: 前台 - angular 在 render 畫面時會顯示出 template html](https://bitbucket.org/flashaim-trace-team/trace/issue/64)
1. [trace-65: 前台 - 景點照片](https://bitbucket.org/flashaim-trace-team/trace/issue/65)

# Native Ads Searcher (NADS)

本月快速地把 NADS 的主要功能都完成，讓同事們能夠先用到。優先開發的項目還是以各個**搜尋器**為主。當然使用介面方面還沒能開始完善，就請先多多包涵了。整體系統架構就如同 1月網誌提到的架構圖，只是還沒開發 *Admin* 網站（現階段不需要）。系統採用 Docker 虛擬機器技術建構，用上了 4台 Docker 虛擬機器分別執行不同程式，可獨立運作與更新程式。經過這次的開發，讓我熟悉了怎麼達成 DevOps 。也使得 NADS 可以隨時移到任何地方，可以非常輕易地建置第二套系統。

不過還是撞到了正式機無法建立 Docker 虛擬機的問題（暈），因為建置 docker 時，會將資料夾內的所有檔案傳送給建置程式，導致太慢。慢到我以為當機了，真是不經一事不長一智，哈！改至獨立空目錄裡建置虛擬機器就行囉~

截至目前，搜尋器支援 **Yahoo 電腦版**與**手機版首頁**。同時，搜尋器也已經可以**自動登入 Yahoo 帳號**，使用不同身份進行搜尋。搜尋器由我手動進行設定，目前啟用 `2個站 * (1組訪客 + 4 組身份) = 10 個搜尋器`，身份有：

1. 男 & 18歲以下
1. 男 & 18歲以上
1. 女 & 18歲以下
1. 女 & 18歲以上

中間有個小插曲，某位客戶即使公司提供了照片也依然不信任，希望我們能夠讓他進入系統實際操作。原本系統沒有要開放使用，所以單純地鎖定 **flashaim.com** 網域，其他網域無法註冊與登入 NADS。為此，我設計了**白名單機制**，只有列在白名單內的帳號才能註冊與登入。這才讓客戶能夠信服（當然還有因為他們廣告也被找到了），只能說信任是很困難的 XD

已完成：

1. [nads-1: web searcher - design and implement a searcher for Yahoo Taiwan mobile page](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/1)
1. [nads-2: user site - design and create main page](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/2)
1. [nads-5: report service - design and implement report service](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/5)
1. [nads-6: database - create database server](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/6)
1. [nads-8: user site - auth. user by Flashaim Google Account](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/6)
1. [nads-10: report service - support fuzzy keyword comparison](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/10)
1. [nads-11: user site - support pagging report data and show detail reports](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/11)
1. [nads-14: user site - filter invalid/invisible char when inputting keywords.](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/14)
1. [nads-16: web searcher - login Yahoo ID before searching](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/16)
1. [nads-17: user site - registry domain support white-list](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/17)
1. [nads-18: build - fail to build docker image on server](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/18)
1. [nads-24: web searcher - support searching Yahoo Taiwan](https://bitbucket.org/flashaim-rd/native-ads-searcher/issue/24)

## FAQ

* 整個系統只有 10 個搜尋器，同時替所有人設定的文字做搜尋
* 每個搜尋器輪流執行，一次運作一個
* 2.0 的搜尋器執行在伺服器裡面（1.0 版是跑在每個人的 Chrome 裡）

# 其他

1. 協助測試裕融的網站速度問題
    + 測試
        - IE 8、IE 9、IE 10、IE 11 @ Windows 7
        - Chrome 41、Firefox 36 @ Ubuntu 14.04
    + 無法重現客戶描述之問題：*比舊網站慢3~4秒*
    + 可能的原因有
        - 新的伺服器處理速度較慢
        - 客戶網路速度
        - 客戶網路防火牆的干擾
1. 協助 ERP 2.0 （阿信）
    + 協助設定 Linux crontab 定時執行特定 PHP 程式
1. 聽 SBIR 寫作課程
    + 3/13
    + 3/27

