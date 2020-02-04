---
layout: post
title: 'Day 6 at Flashaim'
date: 2014-05-13 01:30
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 新人日誌
    - 知識科技
 
---
# Mashup MySQL Cluster
延續實驗，將 dump 出來的 Mashup Database 資料，匯入測試用的 Cluster：

1. 將 SQL 檔的 table engine 改為 *NDBCLUSTER* 才能匯入 MySQL Cluster 內
	- `sed -i 's/MyISAM/NDBCLUSTER/g' mashup-dump.sql`
1. 匯入 MySQL Cluster
	- `mysql -u root -p mashup < mashup-dump.sql`

然而匯入時，遇到了問題：`*ERROR 1005 (HY000) at line 5728: Can't create table 'mashup.customer' (errno: 140)*`

查詢 warning 得到：
```
mysql> show warnings;
+---------+------+---------------------------------------------------+
| Level   | Code | Message                                           |
+---------+------+---------------------------------------------------+
| Warning | 1296 | Got error 738 'Record too big' from NDB           |
| Error   | 1005 | Can't create table 'mashup.customer' (errno: 140) |
+---------+------+---------------------------------------------------+
2 rows in set (0.00 sec)
```
可以看到錯誤是 `Record too big`，主因是目前 MySQL Cluster NDB 的 table 的單一 Row Size（不包含*TEXT*與*BLOB*）僅支援最高 **14KB**！（MySQL Cluster NDB 7.0 以前，為 8KB - [reference](http://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-limitations-database-objects.html)）

而 *customer* 這張 table 顯然超過大小，因此無法匯入。由於 NDB 的限制不少，其實並不會太驚訝。看來得另尋方法，待明天開會後決定。

# MySQL 的 TCP source port 耗盡問題
在研究的過程裡，發現 MySQL Client 在 TCP 離線時有問題，沒有正確等待 TCP Session 的結束。會導致 Server 的 port 無法立即關閉該 port 以致於保留該 TCP 連線並等待 2 分鐘。若 MySQL Client 與 Server 位於同一台電腦很難發生此狀況，這是因為 Client 若與 Server 在同主機會直接透過 **loopback** 而擁有極快的回應時間，可在 Client 斷線前完成整個 TCP 結束流程。然而建立 Cluster 勢必是位於不同主機，因此有機會遇到此狀況，**只要同時間連線數夠多的話**。

有熱心網友提供多個解法：
+ Increasing source port range
+ Allow usage of source port in TIME\_WAIT
+ Using multiple IPs to get connected to a single server
+ Let HAProxy manage TCP source ports
+ Use MySQL persistant connections

萬一遇到的時候，可以透過上述方法解決。

# Regular Expression
洲哥問了我要怎麼用 Regular Expression（Regex） 測試出：
+ 長度為6~12位英數字**組合**(英文字大小寫視為不同)
+ 不可連續或重覆達三個字元以上

拆成兩個 Regex 比較簡單：
1. 字串要符合：`/(?:^\d[0-9a-zA-Z]*[a-zA-Z][0-9a-zA-Z]*$)|(?:^[a-zA-Z][0-9a-zA-Z]*\d[0-9a-zA-Z]*$)/`
	+ 有點長...我還沒想到比較短的寫法...
  + 長度得用 code 直接判斷
1. 搜尋結果必須為 -1 （表示不存在）：`([\d\w]).*\1.*\1`

不過第二條暫時不用了，因為對方還有待釐清此規則。
