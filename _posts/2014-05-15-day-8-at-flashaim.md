---
layout: post
title: 'Day 8 at Flashaim'
date: 2014-05-15 01:45
comments: true
categories: 
---
# MySQL Master-Master Replication 實驗
手動安裝 MySQL 5.6 於 Ubuntu 12.04 Server，使用 ondrej 的 PPA (Personal Package Archives)。將 sql 檔的 table engine 改為 InnoDB 後，成功匯入而無昨天的錯誤（Fulltext index）。

# 建立 Mashup 測試環境
今天感謝大夥的幫忙，問了大夥（尤其是**洲哥**）有哪些 php 檔案需要修改，才能連到不同的 MySQL 資料庫。最後也順利建立好測試環境，接著則是開始建立 Galera Cluster 。

## Galera Cluster 實驗
Galera Cluster 是透過 wsrep API 去控制 MySQL，才能達成**同步式** Multi-Master Replication。表示 MySQL 不能使用正常的版本，要使用 wsrep patched MySQL 才行，Galera 官方提供 patched MySQL Server 檔。另外，Galera 主程式（也就是 Galera Cluster 主程式）稱之為 Galera wsrep provider，也需要下載並安裝在 MySQL 上。

實驗過程果然遇到困難，首先是無法啟動的問題，而且看遍各個 log 檔都沒有找到蛛絲馬跡。網路上也沒有人遇到同樣的問題，然而我注意到 /var/log 內沒有 mysql 資料夾。建立此資料夾後，沒想到就可以正常啟動了（請容許我罵聲X）。
此外，MySQL Client 需要 5.6 版才能正常設定預設安全性設定，因此就如前述一樣，透過 ondrej 的 PPA 安裝。

## Split-brain 問題
當叢集發生節點錯誤時，非 master-slave 架構的叢集（例如 quorum-based system）將會所有節點中，投票表決下個頭是誰（換句話說，還是要有人當頭）。而 Split-brain 則是指，當發生某些狀況時，叢集會發生兩個（以上）的節點當頭。Galera 所使用的演算法，必須至少 3 台 MySQL Nodes 才不會發生 Split-brain。因此 Galera 方案會比 MySQL NDB Cluster 還多一台主機。至於 MySQL NDB 方案會少一台，是因為他的架構中有個 Management Node 防止 Split-brain。不過反過來說，當 Management Node 掛掉時，若 Data Node 也掛掉就會發生 Split-brain。而 Management Node 若只有一台，那就是叢集最擔心的**單點失效（Single point of failure）**。

## Load Balancer
官方建議的 Load Balancer 有：
1. HAProxy
1. Pen
1. Galera Load Balancer
因此，直接使用前次實驗的 HAProxy 即可。

## TL;DR
按照慣例，實驗步驟：[MySQL Master-Master Replication Experiment](https://docs.google.com/a/flashaim.com/document/d/1VwW1EQ7RGNa5vrfj2fpNFefW2x_lDSn1pU9jVhaWcVM/edit?usp=sharing)