---
layout: post
title: 'Day 10 at Flashaim'
date: 2014-05-20 01:59
comments: true
categories: 
---
# Mashup 負載測試

今天主要工作是使用 [Apache JMeter](http://jmeter.apache.org/) 進行 Mashup 網站的負載測試（Load Test），目的是找出**系統承載量**的極限。同時這數據也可以用來量測**程式的修改**對系統負載的影響。當然，也能用於量測**叢集環境**增加多少效能。

## Apache JMeter
是一套功能相當完善的**自動化測試工具**，無論是負載測試、壓力測試或是回歸測試（Regression Test）等都可使用。功能十分強大且彈性，不僅支援 Web ，其他通訊協定如 SOAP、FTP、Mail 甚至是 Database 都能測試。此外 JMeter 是使用 Java 開發，因此可以跑在任何的作業系統上，不受限制。

## 測試設定
目前以 `/qqqqqqqq` 這頁面為測試標的，隨意挑選當中的 20 個 URL 讓 JMeter 輪流測試：
```
/qqqqqqqq/index.php
/qqqqqqqq/index.php?page=product3_kind&style_id=55
/qqqqqqqq/?page=notice
/qqqqqqqq/?page=service
/qqqqqqqq/?page=product
/qqqqqqqq/?page=product_list&group_id=3812
/qqqqqqqq/?page=product_shop&p_id=33826
/qqqqqqqq/?page=product_shop&p_id=24208
/qqqqqqqq/?page=product_shop&p_id=27600
/qqqqqqqq/?page=product_shop&p_id=25979
/qqqqqqqq/?page=product3
/qqqqqqqq/?page=product3_kind&style_id=304
/qqqqqqqq/?page=product3_kind&style_id=73
/qqqqqqqq/?page=question
/qqqqqqqq/?page=question_content&q_id=1213
/qqqqqqqq/?page=question_content&q_id=1347
/qqqqqqqq/?page=inquiry_list
/qqqqqqqq/?page=traffic
/qqqqqqqq/?page=contact
/qqqqqqqq/?page=sitemap
```

此次只是先小規模測試，因此**同時使用者數**（Concurrent Users）使用 10 至 50 人（也就是執行緒數），每次增加 10 人共 5 回。由於 URL 清單共 20 項，因此 `loop` 設定為 20。由於同時使用者數不高，因此 `rampup` 設定為 1 秒，否則時間還沒到就測試結束了。

## 測試結果
[Mashup 小規模負載測試數據](https://docs.google.com/a/flashaim.com/spreadsheets/d/1l0P3gf98sS54jGH0OuKdNMKelTf6vYzI8tMfOXsh07I/edit?usp=sharing)
從測試數據可以看出，30 至 50 人的平均反應時間都在 450 至 500 微秒（ms）之間，表示離極限還有一段距離。因此還需要進一步的測試，這部份和仁哥討論後，會定在某個半夜沒人的時候，進行較大規模的測試（100 人以上）。數據當中可以發現 Threads 40 的時候，發生了錯誤。錯誤率約 **0.01%** 相當低，觀察錯誤訊息並無法判斷是 Mashup 還是我的電腦所在網路環境的問題。不過可以持續觀察是否有其他錯誤發生。