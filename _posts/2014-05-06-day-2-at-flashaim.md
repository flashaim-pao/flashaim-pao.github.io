---
layout: post
title: 'Day 2 at Flashaim'
date: 2014-05-06 02:51
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 新人日誌
    - 知識科技
 
---
# MySQL 叢集實驗
首先研讀官方以及第三方的文件，並調查 Mashup 主機的軟體環境，包含 OS 以及 MySQL 版本等。確認後即安裝多台虛擬機器，得以進行叢集實驗。組成如下：
 + Management Node x 1: 原 Mashup 主機（CentOS 5.5） 
 + SQL Node & Data Node x 2: 額外的主機（Ubuntu 12.04）
 
以此結構作為配置，僅需 **3** 台主機，而 Management Node 可位於 Mashup 主機上，表示僅需多開 **2** 台即可。同時，Mashup 網站可改為連線至叢集即可，無須升級原主機內的 MySQL 版本，可稍微減少轉移時的操作。

在建立本地端 Mashup 測試環境時，由於缺乏佈署（Deployment）文件。因此即便匯入 RD 測試主機的資料庫內容，也無法正確讓網站使用正確的設定去執行。這部份還需要詢問團隊其他人才行。目前就以單純的資料庫去測試之後建立好的 MySQL 叢集。

然而 MySQL Cluster NDB 7.3 的官方說明甚至第三方的安裝步驟，都卡在 *ndb_mgmd* 無法正確讀取參數。研判是 7.3 版的說明文章並未更新。甚至官方設定檔範例都無法正確被識別。因此，待降版後繼續叢集之實驗。

# MySQL Replication 
是另一種達成 MySQL 叢集（Cluster）的技術，雖然僅適合用於讀取多而寫入少的情境，但一般網站與 Mashup 都算是符合此情境。由於 MySQL Cluster 的先天設計所致，必須使用 **NDB Database Engine** 。然而轉換資料庫引擎會遇到**相容性問題**，即使都是 MySQL 也是如此。若採用 Replication 技術則可不必轉換至 NDB Database Engeine。（但轉移至 InnoDB 從各方面來看，都是必要的）

雖然 MySQL 提供 Master-Slave Replication ，但是並非 Real-Time 且仍手動 fail-over。因此有第三方設計了 Master-Master Replication，提供更強的功能。常見如下：
 + Tungsten Replicator
 + Galera Cluster
   - 此為 MariaDB 官配 Cluster 系統，MariaDB 是 MySQL 發明人因不滿 Oracle 而開發相容於 MySQL 的 RDBMS

與 MySQL Cluster NDB 相比，Replication 技術有幾個好處：
 + 記憶體消耗不增加
  - MySQL NDB 將 index 全數放於記憶體，以致於記憶體要求大得多
 + 相容性高且限制少
    NDB 的相容性較差且限制較大，例如 transaction 的能力僅剩下讀取能受交易保證

綜合以上，我認為 Replication 也是個考慮的選項，待下次的團隊會議中提出討論。

# Mashup 網站負載測試計畫
**負載測試（Load Testing）**用來測試系統的承載量與**壓力測試（Stress Testing）**不同。後者是在超越系統極限時，用來觀察系統的反應（崩潰或損壞等）。負載測試是目前 Mashup 在朝向**高可用性（High Availability）**時，必先量測的數據。

目前調查了常見的負載/壓力測試工具，選定功能較強的測試工具 **JMeter** 。並以 Mashup 首頁做了最簡化的測試，待與團隊討論測試計畫後，才進行測試以免影響網站正常運作。
