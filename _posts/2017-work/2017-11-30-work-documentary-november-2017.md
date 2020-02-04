---
layout: post
title: '工作紀實 2017年 11月'
date: 2017-11-30 15:24
image: ''
description: ''
categories:
    - 工作紀實
tags:
    - 月報
    - 知識科技
 
---
# FSB 產品

月初我代表公司應邀到 **LINE** 的場子去**發表 FSB**，出發前還**感冒發燒**了 囧。雖然短短才*五分鐘*，而且我也不乏面對很多人的經驗.......但我還是**很緊張**呀！尤其是**直播**的攝影機對著我瞧。但能傳播出去，對產品的幫助是很大的。是說，在這塊台灣市場，我們**跑得還真是快**呢～

隨著時間的發酵，越來越多商家認同而且購入這個產品了！但是一則以喜、一則以憂。憂心在於，為了**趕功能上架**，所以我們省略了很多**軟體工程**。因此，軟體品質與系統效能便無法被顧及。尤其是後者，越多人使用代表**效能瓶頸**越快被撞到，這個月裡面就發生了好幾起。幸好以開發經驗與仔細地推敲之下，效能問題都還能一一找出並化解。當然，最終還是會撞到單一台主機的**物理上限**。不過目前的優化成果來看，是幫我們買到下了一些時間。讓我們還有時間得以建構新的**叢集系統**來因應未來。

## 完成項目

* #792 一對一聊天己瀏覽加入姓名
* #1015 一對一對話新增訊息種類並顯示數量
* #1016 使用滑鼠滾輪載入一對一歷史訊息
* #1044 一對一對話後台的瀏覽器通知壞了
* #1048 客戶的產品不多但是點選選單卻延遲很久
    + 協助找出效能瓶頸與解決方案
* #1062 一對一對話的已讀標記增加更多資料
* #1064 管理員閱讀一對一對話後訊息沒有被標示誰讀取 
* #1106 後台一對一上傳1mb限制改為4mb，php調高為4mb 
* 使用 Partiton 優化訊息儲存資料表

# MS 產品

因為本月零星的一些狀況，也有協助開發與解決 MS 產品的需求與問題。

* 協助建立簡訊發送伺服器
    + 使用其他主機
    + 為了能固定 IP 而且不受主機停機影響
* 協助調查與解決前台會員無法使用 Facebook 登入之問題
    + Facebook Login 的後台補上正確設定即可

# 鍋專案

多人使用的情境下，**平行處理**會遇到的問題是必須被好好考慮的。不過這方面的技術比較**深入**，而且當**人少**的時候是很難發現問題的。因此，本月便協助了此專案所遇到的平行處理導致資料錯誤（Race Condition），使用一些關聯式資料庫的技巧解決此一問題。是說，合作廠商的 API 開得很難用就是了，沒有考慮*使用情境*。

* 協助解決票碼重複問題
    + 使用 unique index 排除重複
    + 使用 insert ... select 解決同步操作問題
* 協助建置正式機環境與 SSL/HTTPs

# 會員機器人專案

這是個棘手的專案，因為並非是我們熟悉的**開發環境**。再加上佈署的限制，所以很繁複且常常遇到問題。例如，無法跟 API 通訊的問題就卡了好幾天，苦於找不到癥結。但最後抽絲剝繭的結果，是對方的**防火牆開錯了**。

## 完成項目

* 協助安裝 Windows 伺服器環境
* 協助解決開發環境問題 (Laravel Tinker)
* #3 Routing in RESTful style is not working
* 協助檢視無法與 API 主機通訊之問題

# 其他

* 修復 NAS 主機硬體
    + 將主機都移出機房

# 後記

幾乎每週的半夜停機更新，本週又奮戰到四點半，然後起床就感冒發燒了...這個月好像感冒發燒好幾次，呵呵～好暈。