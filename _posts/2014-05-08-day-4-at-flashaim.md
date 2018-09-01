---
layout: post
title: 'Day 4 at Flashaim'
date: 2014-05-08 02:12
comments: true
categories: 
---
延續前次的實驗，排除了數個困難後，算是成功建置 **MySQL 叢集**與**負載分配**（Load Balance）。
然而轉移目前資料庫的內容至測試叢集內，才能驗證轉移是否有其他問題存在。這部份仍需要其他同仁協助，測試成功後才能開始計畫實際的轉移。

目前架構如下圖所示（字好醜 囧）：
 + (a) 為目前 Mashup 主機架構，實際上兩個節點都在同一台主機。
 + (b) MySQL Cluster 理想最小架構，需要 **5 + 1 (Load Balancer)** 台主機，太多且無法符合現實狀況。
 + (c) 則為 Mashup 目前初步進行資料庫叢集化的合理結構
  - SQL Node 與 Data Node 合併在 1 台新主機（需要 2 套）
  - Management Node 與 Load Balancer 合併於原 Mashup 主機。

如此一來，僅需添加 **2 台**新主機即可。此外，無須升級原 Mashup 內的 MySQL，只要修改連線位址至叢集。

<img class="center" src="http://user-image.logdown.io/user/5845/blog/5862/post/197667/pDXsKKHmQ5O0Roq57M4v_Mashup_1%20by%20UPAD.png">

# MySQL Cluster NDB
MySQL Cluster NDB 建立完成，確定前次是因為**版本問題**所致。因此目前改為使用 MySQL Cluster NDB 7.2。需要注意的有 Data Node 的權限開放問題，由於是**遠端**連線資料庫，預設是不允許的。此外，要記得 **Debian Linux** 的 **init.d** 需要指令 *update-rc.d* 才能正確自動啟動服務。

# Load Balance
即便完成 MySQL 叢集化，也只是第一步，應用程式（Web App）依然**無法自動連接不同的節點**，需要另一個輔助系統才行。Load Balancer 即為這樣的系統，主要用來達成幾個目的：
 + 自動分配工作至不同的節點並平衡負載（如其名）
 + 斷線或錯誤則自動重連至其他節點

MySQL 官方提供了一套名為 **MySQL Proxy** 的 Load Balancer。然而多年過去，依然在 **alpha** 版。網路上也不乏錯誤或無法建置的文章，因此用於商轉的風險較高。最後則採用另一套泛用的 **HAProxy** 作為 Load Balancer，設定簡易且使用廣泛。

# 錯誤：連線遭封鎖
然而  Cluster 與 Loader Balancer 建置完成並測試時，卻發生錯誤訊息「*ERROR 1129 (00000): Host '10.0.2.4' is blocked because of many connection errors*」。問題是出在於：
  1. 由於預設 Data Node 的 MySQL Server 是沒有設定檔的
   - 因此最大連線錯誤次數為 10 （超過將封鎖對方）
  2. 用了 HAProxy 後，HAProxy 的預設錯誤嘗試超過上限

解決方法則是提高錯誤嘗試次數至合理數值即可。

# 實驗建置步驟
TL;DR
[MySQL Cluster NDB Experiment](https://docs.google.com/a/flashaim.com/document/d/1LoAhjvQwn6LzZwclFdGEHefjb_Dm9juC3i6uuq74_6Q/edit?usp=sharing)
（要先登入 Flashaim 的 Google 帳號才能開啟）