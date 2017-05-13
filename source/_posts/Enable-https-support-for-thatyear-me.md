title: Enable https support for thatyear.me
author: Jarvis Xiong
tags: []
categories: []
date: 2017-05-11 12:24:00
---

### 1.证书选择
  >https 证书有很多颁发者，处于费用的考虑（毕竟这个博客已经从日更变为月更到现在是年更），没必要每年花费个几百上千的去买证书，于是就是用了 Let’s Encrypt 提供的免费 https 证书。
  
  >证书的生成在Let’s Encrypt 网站上有详细的步骤说明。对于绝大多数的主机，只需要在 [cert](https://certbot.eff.org/) 上选择操作系统以及 http 服务器的类型，就可以通过脚本一键生成证书了。
  
  >[https://certbot.eff.org/#centosrhel7-nginx](https://certbot.eff.org/#centosrhel7-nginx)
  
#### 2.nginx编译

编译 nginx 的时候需要参数 --with-http_ssl_module
参考[官网配置](http://nginx.org/en/docs/http/configuring_https_servers.html)
```
 server {
        listen 443 ssl;
        listen [::]:443 ssl ipv6only=on;
        ssl_certificate /etc/letsencrypt/live/thatyear.me/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/thatyear.me/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/thatyear.me/chain.pem;
        location  / {
    #        root    /data/www/helloworld;
    #        index   index.html;
            proxy_pass http://hexo_server;
  }
```
  
#### 3.问题
执行过程中可能需要依赖库
证书有效期是90天，需要自动更新
```
0 0 1 */3 * bash /path/to/certbot-auto renew
```
