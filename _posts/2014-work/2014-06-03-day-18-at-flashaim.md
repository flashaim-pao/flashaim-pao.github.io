---
layout: post
title: 'Day 18 at Flashaim'
date: 2014-06-03 06:56
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 新人日誌
    - 知識科技
 
---
# 同步 Mashup SVN 儲存庫到 Git 儲存庫（Bitbucket）
為了明天能順利讓開發 Mashup 的大夥們過渡到 Git，所以我今天幫他們將目前 Mashup 在 Subversion 裡面的 commit，手動同步到 Git Repo. 裡，並上傳到 BitBucket。

# 建立 Mashup 開發用的虛擬機器及開發環境
明天還有一個任務是教大夥搭配 Git 控管程式碼，並使用各自獨立的虛擬機器進行開發與測試，因此我先幫大家先建立好這樣一個虛擬機器，讓虛擬機器跑在公司內的主機裡。

## 建立虛擬機器並安裝 XUbuntu
起初是採用 Ubuntu ，然而 Ubuntu 版本的桌面環境 Unity 有許多大大小小的毛病。尤其是在虛擬機器內，由於 3D 加速的較慢且 Unity 預設使用 3D 桌面，以致於反應不良。因此改採用 Xubuntu 這款資源需求少的版本，除了其桌面環境改為使用 XFCE 以外，其他部份與 Ubuntu 完全相同。

## 建置 Mashup 開發測試環境
除了建立虛擬機器外，還要建立開發環境才行，否則大夥各自裝一次太困難了。不過建立 Mashup 環境沒有文件而且需要許多手動設定，花了我不少時間去排除問題。看來若是 Mashup 上線機器垮了要從作業系統重建的話，時間上花的比我想得還要多得多。不過經過這次的實作，也可以當作災難發生的預演且累積經驗。萬一真的發生，就可以更快還原了。
然而最後還是有幾個頁面有許些問題，還要靠專責開發 Mashup 的同事們來排除問題了。

# 準備明天 Mashup 開發流程的說明
找了一些資料並研讀，決定好明天要說明的內容。希望我說的內容，大家可以很容易的吸收。而且可以真正地幫助大家改善流程，避免合作開發所發生的種種問題。

