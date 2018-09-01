---
layout: post
title: '[無言] 撞到 Docker 的 issue...'
date: 2015-03-10 14:28
image: ''
description: ''
categories:
    - 雜談
tags:
    - 知識科技

---
https://github.com/docker/compose/issues/622

這 issue 只會發生在 `docker-compose up` (or `start`) ，而我平常開發是用 `run` 或是直接用 Eclipse 啟動 debug 模式。

遠端伺服器裡面我裝的是有問題的 1.4.0 版（之前裝的），當時已經 `build` 下去 *container* 了。即使隨後升級到 Docker 1.5.0 ，也是會遇到同樣的問題。

由於我 *command* 是設定成跑 `gradle clean run` ，所以我一直以為是 *Gradle* 的 multiple projects 設定有錯，找了半天才發現是 *docker-compose* 沒有把 *volume* 掛上去（暈倒）。

看了一~~~長串的討論才發現新版已經修好了，但是要 `docker-compose rm` 清除所有的 *conainter* 之後重建才行。真是被打敗了，囧

*Github* 裡面的 issue comments 滿滿地哀嚎，許多人都撞到這 issue，看來我並不寂寞（？），哈。
