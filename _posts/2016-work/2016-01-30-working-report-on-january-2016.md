---
layout: post
title: '工作紀實 2016年 1月'
date: 2016-01-30 16:00
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# α 產品

目前 α 產品暫時推遲並進入**封測階段**，人力則**移往 MS 產品** 解決燃眉之急。不過，本月依舊有一些進展，例如完成了 YG 前端程式、修正若干 bugs 等。不過封測過程也陸續出現一些問題，例如 B API 指定當日資料卻回傳昨天的資料；SDK 提供的物件序列化會導致無限迴圈等，甚至是資料量過大的問題（似乎都是某一家的問題呢...），也都陸續在修正當中。這邊要特別感謝 **Wendy** 仔細的測試與回報給我問題。

## Review 的項目

* #298: 實作 YG 前端顯示
* #331: 後台使用者管理的上傳文件需要顯示圖片
* #342: db migration V43

## Review 並接續修改的項目

* #307: 新增競爭者的頁面調整提示敘述

## 完成的項目

* #297: G 帳戶分析後端
* #340: B 帳戶分析使用特定帳號會分析失敗
    + 原因：B SDK 的資料無法直接轉為 JSON 
* 佈署測試機、正式機

## 執行中的項目

* #343: B 帳戶分析餘額計算不準確
* #345: B 帳戶分析因不明資料導致處理負擔過大而使伺服器無回應


# MS 產品
本月主要在執掌 MS 產品的 v1.1 分流計畫的執行。一開始我規劃了三個版本的演進，分別是 v1.1，v1.5 與 v2.0，而 v1.1 則是為了解決然眉之急，要在二～三週內進行雙主機帳戶分流。

<img class="center" src="http://user-image.logdown.io/user/5845/blog/5862/post/422554/z0jtJwcRBaLpzDowzaDz_PL98yaL1Rtei96UNx3k1_2016-01-29_214612.png" alt="PL98yaL1Rtei96UNx3k1_2016-01-29_214612.png">

而經過一週的施做與壓力測試後發現，新主機效能已足夠。雖然剛建置好新主機時，**每秒請求數僅大約 1.5~2.5 倍左右**且**錯誤率也接近 20%**（不包含資料庫無法連接的狀況）。但隨著我**進行各方面的調整**過後，每秒請求數便上升至 **3.34 倍** 且撐過壓力測試而**沒有發生錯誤**。 綜合各方面考量後，MS 產品v1.1 便放棄雙主機分流客戶，**直接轉移至新主機**。如此一來，便可**避免原計畫帶來的高昂維護成本**。

<img class="center" src="http://user-image.logdown.io/user/5845/blog/5862/post/422554/9FC5xRGLQC6rFcyKCGEQ_2016-01-29_214245.png" alt="2016-01-29_214245.png">

然而新主機的服務供應商，政策上禁止使用 SMTP 寄信，需改用其他方式。因此這個月也與信宇改寫寄信程式，目前新主機已可寄信。同時間，也檢視各項問題及全面地測試。此外，轉移新主機也必須要調整每個自訂網域的客戶，將其 DNS 做轉移的準備（簡單地說，就是改以 CNAME 來指向 MS 產品）。預期下個月第一週就能正式轉移過去新主機，希望一切順利並能解決速度問題！

* 協助分析 MS 產品嚴重無法開啟前台之問題
    + 資料庫連線未正確關閉
        - 同時連線數僅 150 超過的要等待
        - 未即時關閉的連線會佔用位子
    + 搜狗的爬蟲在爬 a????????
        - 洲哥暫時關閉客戶網站（現已啟用）
* 協助監視 MS 產品流量與主機狀況
    + 分析瀏覽紀錄（access\_log）
    + 監視前台即時流量（iftop）
    + 監視資料庫即時連線數（show processlist;）
    + 使用 GoAccess 分析流量狀況 [https://goo.gl/OPLvnn]()
* 協助阻擋不正當的網頁爬蟲（搜狗）
    + 以 IP 阻擋
    + 以瀏覽器類型（user-agent）阻擋
* 協助設定網域：共 5 組
* 客戶網域重設：與主機上的設定進行比對並修正
    + 原 61 組，比對後新增 20 組
* 協助解決 MS 產品目錄權限問題：apache/MS 產品+ 修改目錄建立的 PHP 程式
* 將程式版本控管 git 內的原始碼同步到最新狀態
* #11: GM api
    + 協助取代原呼叫的函式
    + 協助處理 OAuth2 認證與 G API
* 進行 MS 產品v1.1 分流計畫
    + 建立與設定新主機系統環境於 G 雲端主機
    + 整理資料與佈署 MS 產品至新主機
    + 建立與調整網頁伺服器與資料庫
        - Nginx, PHP-fpm, MySQL
    + 壓力測試 → 使用 JMeter
        - **調整主機**各項設定**提高承載力**
        - 修正程式的次要 bugs
        - [測試報告](https://goo.gl/izp6ye)
    + 擴大新主機的硬碟至 200GB
    + 同步舊主機檔案與資料庫至新主機
        - 演練與撰寫自動化腳本

# 後記

1/4~6 與全公司一起在台南總部工作真是熱鬧滾滾，連太陽也是熱力四射（？）...雖然不利於研發工作，但是可以體會到各部門的活力，感受到公司成長的動力，凝聚了每個人。最後一天還舉辦了業務簡報比賽，大家卯足全力在表現，煞是精彩。讓我回想起以前參加過的各種比賽，緊張刺激（汗）。

月初，老大公佈了我的升遷訊息，往後我要負起產品研發以及領導工程師的責任。謝謝公司與同事們的支持與肯定，我會努力扛起責任。希冀我能夠帶動公司整體的研發能力，也希望讓我們擁有與全世界競爭的實力。

最後，感謝大家為我慶生，照片看起來也越來越像大叔了呢（飄走）...