---
layout: post
title: '工作紀實 7月'
date: 2014-07-01 02:09
comments: true
categories: 
---
# ERP 專案

* 本月協助 ERP 2.0 開發團隊，建立一個用於 QA 與展示用途的虛擬機器。

# Mashup 專案

Mashup 團隊剛導入 GIT ，因此由我協助大家熟悉與操作版本控管。

1. Git/SmartGit 個別教學
1. 分析與協助 mashup GIT 問題
   - 協助復原錯誤的 GIT 分支
1. 協助 Tina 解決 GIT 連線問題
1. 協助洲哥修復 GIT 檔案錯誤

# Fansbee 專案

持續地參與（幾乎）每天的 Fansbee 發想與設計會議，本月環繞在用戶建構網站的流程與界面上。

# Trace 專案

本月密集的進行開發工作，並且預先建立好開發所需的工具、環境、自動化建置等。

1. 建立前端開發環境，尤其是主要的前端開發語言 Dart 的開發工具。
1. 建立網站編譯環境以及自動化建置佈署
   - 建立正式伺服器於 Vagrant 內：Jetty Server 與 MariaDB
   - 建立編譯環境並撰寫自動化腳本
1. 解決 vagrant 開發環境在 Windows Host 所遇到的 symbolic link 問題
   - 經過測試多種解決方案後採用 rsync 方案（但會稍微變慢）
1. 已實作項目
   - #3 [首頁主要區域顯示預設景點](https://bitbucket.org/flashaim-trace-team/trace/issue/3)
   - #11 [API - 預設景點支援分頁](https://bitbucket.org/flashaim-trace-team/trace/issue/11)
1. Review 團隊的實作項目
   - #2 [[API] 提供預設景點清單](https://bitbucket.org/flashaim-trace-team/trace/issue/2)
   - #4 [API - 熱門推薦景點](https://bitbucket.org/flashaim-trace-team/trace/issue/4)
   - #9 [spot 回應 json 需增加 3 欄位](https://bitbucket.org/flashaim-trace-team/trace/issue/9)

# 其他部份

1. 協助分析 flash banner 載入之問題
   - 發現 swf 根本沒有被載入且主機一直未回應該網址的載入
   - 結果與推測一致，是對方防火牆擋下 swf 檔
1. 分析 ERP 寄信問題
   - 使用 GMail 主機收信
      + MX 已設定為 GMail 主機
   - 使用本機寄信
      + DNS/IP 正反解一致
      + https://hidomain.hinet.net/
   - 沒有 SPF 紀錄
1. 協助確認 s2.flashaim.com 上的 mod\_rewrite
