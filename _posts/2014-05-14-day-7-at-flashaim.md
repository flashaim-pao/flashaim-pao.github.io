---
layout: post
title: 'Day 7 at Flashaim'
date: 2014-05-14 01:52
comments: true
categories: 
---
# MySQL Master-Master Replication 實驗
由於 Mashup 的 Customer Table 超過 MySQL NDB Cluster 的 row size 上限，因此今天早上則研究第三方 Cluster 解決方案。以常見的 **Master-Master Replication Cluster** 而言，第三方選擇有：
1. MySQL-MMM (Multi-Master Replication)
1. Galera Cluster

MMM 因為先天架構不理想，因此並未達到真正的 HA (High-Avaliability)。因此才有 Galera 的誕生，用來達成真正 HA 的 Cluster 。而 MariaDB 的官配 Cluster 便是 Galera （簡單說，就是有人背書），之後的實驗將基於 Galera 進行。而我調查的結果發現，Galera 也是採用 **GPL v2** 授權，因此可以放心使用於商業用途。

## InnoDB 實驗
果不其然遇到了問題：`ERROR 1214 (HY000) at line 451887: The used table type doesn't support FULLTEXT indexes`。簡單的說，InnoDB 不支援建立**全文搜尋**的**欄位索引**。所幸 MySQL **5.6** 之後，InnoDB 支援全文搜尋。不過由於 Ubuntu 12.04 官方僅到 MySQL 5.5，因此得手動自行安裝 5.6 之版本。

# Network Time Protocol (NTP)
電腦硬體裡的**Real-Time Clock(RTC)**並非相當準確，又或者是主機板上的電池快沒電時。某客戶遇到時間偏移的現象，而且校正後隔一段時間仍然會有數十分鐘的偏移。這時可以定時執行網路校時來解決時間問題，因應而生的網路協定即為 **NTP**。

台灣有官方的 NTP Server：http://www.stdtime.gov.tw/ ，需要校時的電腦只需要用戶程式即可。Linux 上常見的用戶程式為 *ntpclient*。

# SSL 憑證
雖然帳號認證是透過 Google 的認證服務(OAuth 2.0)，且 Google 在過程裡提供了 SSL 加密。然而認證階段過後，瀏覽器與伺服器之間仍然沒有加密。表示只要監聽到 session ID 就可以假裝成其他人與伺服器溝通了。

當然，許多台廠或大廠（如 Verisign）的價格過於昂貴。而 Godaddy 的 SSL 憑證則便宜許多，同時他也是國外知名的 Web Hosting 廠商。最有彈性也最貴的 Wildcard SSL （可用於所有子網域）也僅一年八千台幣，是可以考慮的對象。
http://www.godaddy.com/ssl/ssl-certificates.aspx

# RD 週會
下午則是本週的週會，主要也是討論 Mashup 相關的議題。不過目前主要討論重點是 Mashup Mall，目前還有許多功能正在開發當中，微調的項目也頗多，畢竟手持裝置的 Web 是比較難開發的。另外，拖拉式的調整方法挺有趣的，而且也相當實用。
