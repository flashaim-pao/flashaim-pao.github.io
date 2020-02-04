---
layout: post
title: '虛擬機器甘苦談'
date: 2014-06-08 13:16
image: ''
description: ''
categories:
    - 雜談
tags:
    - 知識科技

---
# 壓垮駱駝的最後一根稻草

**就是他 XX 的 License 呀!!! <囧>**

## 前情提要

為了解決 Flashaim NAS 主機的**效能問題**，也就是一次開 **9**台虛擬機器的問題。**Tina （大神）** 的提議很好，要用的時候才開。所以要提供一個界面給大家簡單**開關自己的虛擬機器**，而且還要能**簡易地連接至虛擬機器的桌面**。

Virtualbox 的**授權陷阱**很多就不提了，但是最終 **VRDP (VRDE)** 這個提供遠端桌面的功能不是 **GPL** 而是 **EUPL** 這個不可以商用的呀！！！

## 尋尋覓覓

還是找不到 Virtualbox 上面的解法，沒有任何第三方開發 **VRDP** 的替代品，而在 Guest 內部提供 RDP/VNC 在 Guest 出狀況時根本就廢了！（實際上也真的有發生）而請每個人裝 Virtualbox 仍然有其他問題，沒有完美的解法。

## KVM + WebVirtMgr

索性就換成 Liunux Kernal 內建的 **KVM（Kernal Virtual Machine）** 與 RedHat 開發的 **Libvirt** ！！！而且還找了一套 Web 版的 libvirt 管理界面 **WebVirtMgr**，畫面精美還蠻好用的呦！雖然安裝過程實在是頗複雜（免費的不要嫌！），但是 WebVirtMgr 使用的是 **novnc** 這個 **VNC Client** （真是逗趣的名字），因此只需要**網頁瀏覽器**就可以看到虛擬機器的桌面囉！不用裝任何軟體，**novnc** 會透過 VNC 跟 LibVirt 在內部溝通，然後使用 HTML5 呈現！

## OpenSource 萬歲

以上通通都是 OpenSource（GPL 跟 Apache ），免費也可以商用超棒，也不像 **Oracle** Virtualbox 那樣多陷阱（Oracle 的名聲......）！如果不嫌複雜跟高門檻的話，使用 OpenSource 軟體還蠻省錢的，哈！
