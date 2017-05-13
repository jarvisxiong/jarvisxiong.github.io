title: Hexo Blog
author: Jarvis Xiong
tags:
  - Hexo
categories: []
date: 2017-05-08 12:19:00
---
## Hexo Blog搭建过程

### 1.安装Nodejs
最新版的nodejs如果编译安装比较麻烦，需要升级c++到4.8.0，所以直接用了官网提供的二进制执行文件

### 2.安装Hexo客户端和管理module
``` bash
$ npm install -g hexo-cli
$ hexo init blog
$ cd blog
$ npm install
$ git clone https://github.com/iissnan/hexo-theme-next themes/next
$ npm install --save hexo-admin
$ hexo new page "tags"
```
### 3.配置site的_config.yml

``` bash
theme: next
language:zh-Hans
```
### 4.配置theme的_config.yml

``` bash
avatar:path  设置头像
disqus:ture  需要先注册disqus账号
```

### 5.启动server

``` bash
$ cd blog
$ hexo server
$ 或者
$ hexo server >> std.log 2>&1 &
```
### 6.预览

``` bash
http://localhost:4000/
or
config nginx upstream
```

### 7.停止Server

``` bash
$ ps -ef | grep hexo | grep -v grep | awk '{print $2}' | xargs kill
```
### 8.参考
[令狐葱](https://github.com/jiji262/jiji262.github.io)