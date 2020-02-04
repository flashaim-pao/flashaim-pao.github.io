---
layout: post
title: '工作紀實 8月'
date: 2014-07-31 10:11
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# Trace

同樣是密集的開發中，根據回饋也持續改進原先寫好的程式。這個月搜便利那方終於提供 API ，然而彼此當初的認之有所不同。API 僅能用於抓取資料而沒有任何功能。其他的功能如搜尋等，就必須由我們這方實作。另外也必須撰寫程式去定時同步資料。

1. Soeasy API 的界接
   * 與 Soeasy 確認 API
   * 由於 API 綁定一組IP，所以在公司的 NAS 主機建立重導連線讓我們得以各自抓取資料用於測試
   * 以程式計算商家總類與商家總數
   * 實作 API XML 檔案解析器
1. 已實作項目
   * [#13: 首頁 - 根據 API 的變動增加預設景點的分頁顯示功能](https://bitbucket.org/flashaim-trace-team/trace/issue/13)
   * [#15: Soeasy - 解析 XML 並存至資料庫](https://bitbucket.org/flashaim-trace-team/trace/issue/15)
       - 以 Trace 目前所得到的資料而言，空間索引幫助不大因此不須建立
   * [重構程式碼](https://bitbucket.org/flashaim-trace-team/trace/issue/3)
1. Review 團隊的實作項目
   * [#14: soeasy - 撈取 Y! 資料存成 xml](https://bitbucket.org/flashaim-trace-team/trace/issue/14)
   * [#12: API - 熱門景點支援分頁](https://bitbucket.org/flashaim-trace-team/trace/issue/12)
   * [#10: 首頁 - 熱門推薦景點](https://bitbucket.org/flashaim-trace-team/trace/issue/10)
1. 於公司的 NAS 主機建立 QC 用的虛擬機器

# 公司內部訓練

公司請了工研信來替我們 RD 的工程師們上課。除了老師上課我們也會一起討論，教學相長我覺得蠻有意義的。目前上過得主題：
1. PHP Security
2. PHP Framework - Laravel

# Fansbee

每天上午持續參加發想與設計會議，幾乎佔了一半的工作時間了。經過這陣子的討論，越來越有樣子了。而且使用了許多工具來溝通、分享與製作雛型。

# Mashup

1. 協助判斷與測試導覽列於 Android 原生瀏覽器會不正常移位的問題
1. 協助修復 mashup QA 測試機的 git client 問題

# 疑難雜症

1. DNS 設定問題：machine-service.com.tw
   * S2 設定檔有錯導致無法重新啟動 apahce
      - mod\_bw.so 無法載入
   * 暫時解法：移至 S1
1. DNS 設定問題：elect-service.com.tw
   * 使用 S1
   * DNS 沒有指定 wildcard
1. 協助分析專案「屋頂上」遭入侵所使用的手法

# 其他感想

到高雄也生活有10年了吧！沒想到發生嚴重氣爆這種憾事，真是令人膽顫心驚。不只是捐了錢，8/7 那天也和同事們一起去當義工，流流汗。就如同當年 921 受到大家的幫助一樣，希望我盡的這些微薄之力也能真正幫助到災民們。

