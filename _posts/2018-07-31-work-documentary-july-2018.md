---
layout: post
title: '工作紀實 2018年 7月'
date: 2018-07-31 15:33
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技

---
# 課程

先感謝公司替研發技術部安排了一系列精彩的課程，足足六堂全天的課。除了兩天以外，都集中在本月。課程涵蓋了軟體工程與網頁前端程式技術，兩位講師深入淺出的授課與安排適當的實作，相信大夥都得到了扎實的訓練，而且課程的反應也十分熱烈。然而，為求教育訓練的成效，我特別規定大夥在這一系列訓練結束後，要將課程所學應用到手上的產品或案件上。並且需要具備一定規模的應用，並通過我的考核才行。此外，「師父領進門，修行看個人」，各門技術更加深入的題目，還需要大夥各自持續去研究了。對於我而言，大部份是我已具備已久的技能。不過，「溫故而知新」，因此也令我有所斬獲。況且一些新的發展，也能靠課程獲得。因此我也是收穫匪淺，已經開始期待明年會有什麼更棒的課程了。

# ERP

由於財會部門在使用 ERP2 的時候，偶而會發生被強制登出的現象。由於發生時機呈現隨機性，因此開發小組長久以來，一直無法找出真正的原因並解決。而在 ERP2 更換主機硬體之後，發生頻率變得更高以致於嚴重影響使用者的作業效率，所以本月我親自跳進來協助調查與解決問題。

乍看之下，會讓人懷疑是硬體問題。但根據我對於電腦軟硬體的了解，這理應是軟體問題而非硬體。經過一番調查之後，終於讓我發現是 Session 資料損毀所致，**而且必定會於 AJAX 回應後發生**。下一步就是要找出，是什麼隨機造成 Session 損毀？經過更多的調查後發現，是程式所使用的框架（Framework）的 bug 所致，而恰好 ERP2 滿足所有發生的條件。發生主因是框架的 Session 管理程式在平行執行環境（concurrent）有機率會發生 Race condition ，導致 session 無法通過安全檢查。又身份授權資料是存於 session ，此時使用者就會被登出。目前將 session 管理程式底層的資料存取層驅動程式（data storage driver），從檔案系統改為 Redis 資料庫（簡單說，拿掉發生的條件之一），測試至今尚未再度發生。

## 已完成

* #365 session driver 改用 Redis

# FSB

## review

* FSB - 地址的資訊錯誤 #1722

# 其他

* Flashaim NAS
    + 修復 AMD CPU 會隨機凍結系統的問題
        - 此款 CPU 的早期版本有一個 bug 使得安裝於 Linux 上會隨機凍結
        - 是 CPU 節電系統的 bug
        - 根據官方提供的 workaround 關閉節電模式並更新 BIOS 至今未再發生凍結
    + 重建為 server 版系統
* Mashup MySQL slave 損毀
    + bin log relay 因為 NAS 主機異常而損壞
    + 由於 master 的 bin log 正常
        - 修復 slave 上的 bin log
        - 參考：https://dba.stackexchange.com/questions/53893/mysql-relay-log-corrupted-how-do-i-fix-it-tried-but-failed
* 協助調查客戶產品被改為1元的記錄

# 後記

本月突然開始忙起了面試應徵者，比起以往多了許多，其中不乏有豐富經驗的返鄉工程師。這對公司是個好現象，希望研發技術部能逐漸壯大，一同研發更棒的產品。