---
layout: post
title: '工作紀實 9月'
date: 2014-08-29 11:13
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---

# Yahoo 圖文廣告找尋程式

由業務部來的程式需求，需要自動化搜尋 Yahoo 手機版網站的圖文廣告，用於判斷廣告是否投放成功。由於網頁是採用 *Load on demand* 設計，需要驅動 Yahoo 的程式才能正確且持續載入新項目資料。此外還要能自動登入指定的 Yahoo 帳號，因為不同帳號登入會影響廣告的投放條件。因此，我和冠宇分別設計了 **Chrome Extension** 搭配**網站管理界面**來達成需求。我負責的 Chrome Extension 接受後端網站傳來的參數，會自動執行網站登入、掃描廣告並且回報結果至後端網站。目前完成的項目有：

1. 程式系統架構設計
1. 建立開發用環境
1. 建立給網站使用的虛擬機（位於 http://vm.flashserv.net:10202）
1. 設計與實作 Chrome Extension
    - 初版已完成

# Trace

本月已整合*搜便利*的資料匯入與分析，同時繼續開發網站的各個功能。

1. 與小葉討論 Mobile 版的 UI/UX 設計
1. 程式重構
    + 重組織為 Maven Parent Project with children
    + 根據重構更新建置腳本（自動化編譯與佈署至伺服器）
1. 已實作項目
    + [#18 首頁 iPad 下拉沒有拉取預設景點的下一頁](https://bitbucket.org/flashaim-trace-team/trace/issue/18/)
    + [#21 會員 - 提供 Google 帳號登入前台](https://bitbucket.org/flashaim-trace-team/trace/issue/21)
1. Review 團隊的實作項目
    + [#14 soeasy - 撈取 Y! 資料存成 xml](https://bitbucket.org/flashaim-trace-team/trace/issue/14)

# Fansbee

這個月早上的會議集中在討論編輯器相關的議題上，尤其是細部的設計。另外安軒和 Tina 還用上了 InVision 設計了互動性的雛型，讓討論更為順暢。

# Mashup

1. 將原本的 rsync 完整備份改用 rsnapshot 程式進行**增量式備份**，以節省儲存空間。
    + Database 備份維持原來的策略與腳本檔
1. 協助重設伺服器設定以提昇 Google PageSpeed Insights 分數
    + 啟動靜態檔案的快取時間檔頭
    + 啟動 HTTP 壓縮傳輸功能

# ERP 2.0

1. 協助 Vagrant 開發工具的問題排除

# 公司內部員工訓練

本月上了一次員工訓練課程，講述的內容正是 **Google PageSpeed Insights** 的各項改善。

# 其他

1. 協助查詢**裕融**主機的資訊
1. 協助建立 RD 共用程式庫與相關規則文件
1. 協助 S1 與 S2 兩台伺服器的系統更新
