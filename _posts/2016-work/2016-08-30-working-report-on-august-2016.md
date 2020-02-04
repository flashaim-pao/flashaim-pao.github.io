---
layout: post
title: '工作紀實 2016年 8月'
date: 2016-08-30 16:00
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# Alpha 產品

這個月除了支援其他專案與產品外，依然持續進行 Alpha 產品的新爬蟲系統。也因此更動了資料的組織，連動改寫相關的*資料庫存取程式*。改的範圍很廣，甚至相關的 *RESTful API* 也需要隨之改寫。當然，為了能降低錯誤發生的機會，也補上了大量的*單元測試案例（Unit Test Cases）*。這邊我看還有場持久戰要打，畢竟*前端程式*也要隨著修改才行。

## 執行中的項目

* BC #347 Worker 重新改以 Selenium WebDriver 建置更穩定的網頁爬蟲
    + 改寫資料組織以符合新的爬蟲架構
    + 改寫 RESTful API 符合新的資料組織

# Matrix

悄悄地又經過了一個月的討論與腦力激盪，這當中我提出了 Matrix 最重要的 *UI 系統*以及*儲存系統*的主架構設計。UI 方面，我配合 Mustache Partial 提出 Cascade controller 設計達到*拆解程式模組*的初衷甚至達成可由後端控制的通用 AJAX 架構。而儲存架構方面，我嘗試設計全面採用 NoSQL 的架構，並且從各方面研究可行性。屏除了傳統關聯式資料庫之後，可以輕易的達成儲存叢集系統以及高可用性，也能簡單地提高網站承載力。畢竟我們是小團隊，所以在設計上我得同時考量 DevOps 的施行難度。機器很重要，但*人*更重要。當然，我思考了電子商務網站對於儲存需求的各種面向，分成了 5 個子系統。再根據個別的特性，挑選了兩種迥異的 NoSQL 資料庫，分別是 Cassandra (BigTable) 以及 Couchbase (Document-based)。下個月開始，會先進行 proof of concept (POC) 來做為細部設計的依據。我想，這是一個頗大的工程挑戰，除了能帶給公司正面的幫助外，還希望能藉此讓大夥的技術力提升到另一個境界。

## 設計

* Cascade controller/View Model
    + 搭配 Mustache Partial
    + 共通 AJAX 程式
        - 可直接由後端程式控制
* NoSQL database clusters
    + 5 種儲存子系統
        - 包含 Clustering file storage/service
    + 使用 2 類 NoSQL 資料庫叢集
        + Apache Cassandra (BigTable)
        + Couchbase (Document-based)
    + High Available: Master-Master Replication
* 詳見 [Matrix 設計草案](https://github.com/flashaim/whitebook/wiki/matrix_draft)（需要有 Github 權限才能看）

# HFRE 產品

本月也協助了此專案的前端程式，畢竟這專案挺趕的，而前端程式的難度較高。對方要求的特效其實沒有表面看起來的簡單，某些效果的加成會讓難度直線上升，所以最後還是得用上狀態機與延遲技術才實現。一點也馬虎不得，哈～

* 協助撰寫頁面的效果程式
    1. 外頁水平展開特效
    1. 內頁垂直展開效果
    1. 主選單箭頭跟隨特效
    1. 次選單展開特效
    
# VIP 產品

* 協助修正 BrowserSync 在 Docker for Mac 底下無法反映檔案修改的問題
   + 掛在 volumes 若重疊將使得 file monitoring 失效（使用 Mac 虛擬機器的狀況下）

# FMM 產品

* 協助建置正式機
    + 同時協助轉移測試機的資料至正式機
    + 協助設定網域名稱對應

# 其他

* 協助修復 Flashaim NAS 的主機故障問題
    + 硬體故障待修復
* 重建測試主機
    + 由於 Flashaim NAS 硬體故障所以使用另一台主機作為測試機
    + 重建作業系統以及測試伺服器環境
* 重建 Docker Registry 伺服器
* 協助設定客戶的 domain name
    + 設定使用 Namecheap 的免費 DNS 主機
    + 設定 domain name 對應
* 協助製作跳板連接*客戶主機*的 FTP server
    + 客戶主機鎖定公司的 IP
    + R&D 有從外界連接的需求
* 停機維護 S3 及 S4
    + 需要把檔案儲存路徑改至更大的磁碟上
    + 製作維護頁面
        - 使用獨立的臨時主機（因為 S3 與 S4 要整個停機）
* 協助 ERP 伺服器無法啟動問題
    + MariaDB 更新版本不相容當前的環境設定
* 協助阿信重置開發環境
        
    
