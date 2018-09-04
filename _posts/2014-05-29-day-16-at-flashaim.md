---
layout: post
title: 'Day 16 at Flashaim'
date: 2014-05-29 02:17
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 新人日誌
    - 知識科技
 
---
# Mashup 2.0

今天安軒和我討論了 Mashup 2.0 概念更深入的探討，起因是安軒發現了原概念模糊之處。簡單地說，若條件僅能作用在頁面的選擇上。當複數條件同時相依時，必須建立相當多同樣目的之頁面。且隨著條件增加，承非線性增加（條件的組合數，也就是 n 階層）。

中間的討論是條件改在附加在模組身上，然而這樣會導致排版更複雜化。最後我們討論出了一個結果，也就是在模組與頁面之間增加一個「群組」的概念。而條件則是能附加在頁面與群組身上，同時顧及概念簡化與彈性不重複的需求。此外，也定義模組分為「未啟動」與「啟動中」兩個狀態，廠商挑中一個**未設定/無內容**的模組，經過設定/填入內容後便為啟動狀態，接著可以**重複**組合為**群組**。而用多個**群組**結合進**頁面**：

    模組 >>> 模組（啟動中） >>> 群組（可附加條件） >>> 頁面 （可附加條件）
    
不過這只是我們當下產生的想法與共識，還需要更加的琢磨，相信還能更好的。

# Trace 行程規劃

持續實作分支設限法當中，由於習慣以測試驅動開發（[Test-driven development][TDD]），而且實作演算法這情形很適合用上。便先撰寫測試程式，讀取 [TSPLIB](http://www.iwr.uni-heidelberg.de/groups/comopt/software/TSPLIB95/) 的案例用於測試。如此一來調整演算法，也不擔心發生錯誤而沒發現。

[TDD]: http://en.wikipedia.org/wiki/Test-driven_development