---
layout: post
title: '工作紀實 2015年 12月'
date: 2015-12-30 16:00
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# α 產品

這個月在趕緊收尾，然而**莫非定律**顯靈，測試機網路不通（新總部）、爬蟲跑到當機、寄信超過限額被鎖定、爬蟲被鎖定、B開始轉換客戶帳號...突然發生很多問題呢。但是見招拆招，一個一個解開。當然眼前最重要還是能盡快正式上線囉，還剩下一點收尾跟測試，加油吧！α 產品小組！

## Review 的項目

* #292: 專家建議 user api
* #331: 後台使用者管理的上傳文件需要顯示圖片
* #314: 官網收到結帳成功動作後需要寄發信件
* #315: 後台確認收到使用者款項寄發信件
* #339: 後台使用者列表有兢爭者排序優先

## Review 並接續修改的項目

* #307: 新增競爭者的頁面調整提示敘述

## 完成的項目

* #291: 將競爭者爬蟲改為循序執行並取消立即分析
* #295: G API 串接與帳戶分析連結
* #334: B Ads 帳戶分析支援以微軟帳號連結
* #297: G 帳戶分析整合進原生廣告分析器並提供前端呼叫的 API
* 撰寫佈署測試機與正式機的SOP
* 帳戶分析的卡片若沒有關鍵字則停用「立即改善」按鈕
* 帳戶分析切換平台同時切換回第一個頁籤
* 連結帳戶後跳往帳戶分析頁面
* 測試並調整Y圖片搜尋爬蟲的Timeout時間
* 修改程式從系統直接設定服務信件的轉寄
    + 主要為官網的表單需轉寄給相關人員
    + α@flashaim.com 被 GM 封鎖轉寄
* 修正佈署與開發環境之問題（docker compose）
    + 自動重開
    + 修改符合開發環境（不自動重開）

## 執行中的項目

* #335: 將 docker-compose 設定分離為測試與正式，並開啟 container（伺服器）自動重啟。
* #340 B帳戶分析使用特定帳號會分析失敗
* 架設 docker distribution (registry v2)
    + postponed... 公司網路不穩定

# MS 產品

仁哥本月通知我，之後要調往 MS 產品協助建置新的系統架構，藉以改善日益緩慢的系統反應速度。不過，還是得等待 α 產品能穩定運作之後了。因此，本月依舊零星協助處理問題，除了設定網域以外，小倩請我協助找出客戶無法使用正常網址進入網站的問題。只能用一個不尋常的網址才能登入，但這樣與搜尋引擎的搜尋結果不符，造成困擾。好在我了解 URL 的組成規格，馬上就看出到混入了不合法的字元。查詢之下，居然是看不見的*無寬度空白*，也難怪輸入的時候會沒發現。也還好有這經驗，讓我著手設計新架構時，會記得要驗證使用者輸入的網址。另一方面，也協助啟動 MS 產品的 MySQL long query log，這功能會將花費太多時間存取資料庫的程式記錄下來，才能讓工程師們曉得哪些程式需要改善。截至目前為止，有記錄到數條，或許有機會連帶改善系統效能。

* 協助設定網域：共 10 組
* 協助排除客戶網址問題
    + 開帳戶時混入了無寬度空白（UTF-8 為 E2808B）
    + 修正方法：找到後更改名稱 `mv s?ophie sophie`
* 協助啟動資料庫的 SQL 跑太慢的記錄功能 

# NADS

好久沒有寫到 NADS 了，這個月也因為台南總部搬遷的網路問題，導致 NADS 一直無法成功讓使用者登入。登入流程到授權為止都會成功，但是在最後跟 NADS 跟 Google 教握 refresh token 的時候會出錯。這是由於 NADS 主機（Flashaim NAS）無法成功聯繫 Google ，因為 DNS 解析封包沒得到回應，最後公司網路搞定後才成功啟動。我也順便修改 NADS 的佈署腳本，使其 crash 時可以自動重開。

# Container Summit 2015

這個月參加了兩天由 iThome 主辦的 [Container Summit 2015](http://containersummit.ithome.com.tw/) ，雖然主題叫 **Container** 但實際上都是環繞在出現才**兩年**的 *Docker* 身上。雖然僅僅兩年，但是各大公司紛紛支援，就可以知道其火紅程度。像 Google 雲端（Google Compute Engine）已經支援 Docker 甚至寫了一整套 Docker 叢集管理器 [Kubernetes](http://kubernetes.io/) ；另一邊微軟不僅讓旗下多個工具支援 Docker ，最令我佩服的是他們推出了原生 Windows 版本的 Docker Runtime！要知道 Docker 是倚賴著 Linux Kernel，所以讓 Windows Kernel 能直接執行 Docker 是相當不容易的！這也證明了微軟是認真在挑戰自我，值得鼓掌！（欸～那個賣水果的，出個聲音好嗎？）

我接觸 Docker 約莫有一年，勉強算是早期採用者吧！NADS 跟 α 產品可都有用上呦。是說，跌跌撞撞也遇到不少問題就是了 XD 然而這個活動請來各家 vendor 跟許多先進來演講，讓我又學到了好幾課。除了瞭解到以前的用法不夠好，也得知了許多技巧與經驗。看來得來好好改進一下當前的開發、建置與佈署，也開始自己架設 Docker Registry 在公司裡（可惜因為網路問題還沒弄好）。去年場如果有聽到，說不定我就不會撞到這些問題了呀（爆）！

筆記：https://github.com/flashaim/whitebook/wiki/Container-Summit-2015

# 其他

月初去香港幾天散散心 & 終於踏進很酷炫的新總部！Bravo！

![新總部](http://user-image.logdown.io/user/5845/blog/5862/post/402212/LrMpCX0hS0SnTJe1PY7F_Selection_005.jpg)