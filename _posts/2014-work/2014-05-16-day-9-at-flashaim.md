---
layout: post
title: 'Day 9 at Flashaim'
date: 2014-05-16 01:25
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 新人日誌
    - 知識科技
 
---
# MySQL Cluster 建置實驗

延續昨天的實驗，最終建立了 3 台 MySQL Nodes，並且修正了一些設定上的錯誤。值得注意的是，Galera Cluster 的第一台 Node 必須使用特別的參數啟動 `sudo /etc/init.d/mysql restart --wsrep-cluster-address="gcomm://"`。簡單說就是不能指定叢集的 IP。

接著匯入 Mashup 的 dump SQL 檔，這次成功的匯入了。因為基本上，Galera Cluster 是透過內部攔截指令的執行，因此不需要修改 table engine 。隨後則重設 HAProxy 的設定，並修改 Mashup 的資料庫連線設定。也成功讓 Mashup 總後台啟動了。

為了實驗叢集的可用性，進行失效模擬（Failure Simulation） 。模擬任一節點損壞，將其中一個節點 MySQL 行程強制刪除 `killall -9 mysqld`。修改資料庫後，再重啟一個節點，資料果然有正確復原。實驗成功，接著要與團隊討論叢集實際建立的時間了。

# Load Test Plan

今天研究了一下如何使用 JMeter 進行 load test ，其中 **ramp up** 時間參數用來控制 **Concurrent Users** 多久以後才會到達設定的數量。讓 Web Server 有時間暖機達到較佳的狀態（例如載入尚未執行過得程式片段至記憶體 或 將一些檔案快取至記憶體當中），才能有較精準的測試數據。此外，由於這類效能測試沒辦法再平時執行，所以要先跟團隊討論執行的時間。





