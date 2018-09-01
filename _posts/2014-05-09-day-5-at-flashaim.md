---
layout: post
title: 'Day 5 at Flashaim'
date: 2014-05-09 02:35
comments: true
categories: 
---
# Google Place
需求是能程式化發布商家位置至 Google Map 上。Google Place API 可以達成這一點，但是僅限於**共用金鑰的應用程式（App）**。簡單的說，Google Place API 是提供**客製化地圖**給你的 APP 使用，是沒有辦法發布回公開的 Google Map。

這是 Google 為了要防止地點資訊被濫用（如假冒、假地點等），需要透過驗證機制證明地點是有效的（機制有**電話**及**明信片**）所以並未提供 API 。而且是透過**另一個**不同的服務叫 [Google Place for BUsiness](http://www.google.com/business/placesforbusiness/)，每個商家可以登記 100 個地點。Google 還提供批次登記的功能，直接上傳列表檔案即可。

# Google AdWord API
提供程式化存取：
 + 廣告活動管理
  - 出價、預算設定等
 + 廣告管理
  - 廣告參數、投放方式、時段等
 + 報表
  - 各種統計與成效報告

透過報表 API 當中的 *AdGroupCriterionService* 似乎可以得知 *First Page Bid Estimates*，或許是個有用的資訊？不過我對於關鍵字廣告的相關知識還很薄弱，還得請同事們多多幫忙了。

另外搜尋到一個相關的網站，或許值得一看：[WordSteam](http://www.wordstream.com/)

# SOAP (Simple Object Access Protocol)
Google AdWord API 以 SOAP 所開發。SOAP 是種標準化的 API 協定，可用於以 SOA （Service-Oriented Architecture）所設計的系統中。其國際標準由 W3C 所制定，為 **Web Services** 規格之一，應用廣泛且不限於 Web。Java 提供 JAX-WS 等規格輔助開發者，可簡化 Web Services 的開發。而我曾運用 SOAP 開發過系統，所以算是有此方面經驗。