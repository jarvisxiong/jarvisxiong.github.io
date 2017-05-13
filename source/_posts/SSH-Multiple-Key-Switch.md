title: SSH Multiple Key Switch
author: Jarvis Xiong
tags: []
categories: []
date: 2017-05-11 20:36:00
---
>github使用SSH与客户端连接。如果是单用户（first），生成密钥对后，将公钥保存至github，每次连接时SSH客户端发送本地私钥（默认~/.ssh/id_rsa）到服务端验证。单用户情况下，连接的服务器上保存的公钥和发送的私钥自然是配对的。但是如果是多用户（first，second），我们在连接到second的帐号时，second保存的是自己的公钥，但是SSH客户端依然发送默认私钥，即first的私钥，那么这个验证自然无法通过。不过，要实现多帐号下的SSH key切换在客户端做一些配置即可

Multiple SSH Keys settings for different github account
=================================================================


create different public key
---------------------------------

create different ssh key according the article [Mac Set-Up Git](https://help.github.com/articles/set-up-git/)

	$ ssh-keygen -t rsa -C "your_email@youremail.com"

Please refer to [github ssh issues](https://help.github.com/categories/authenticating-to-github/) for common problems.

for example, 2 keys created at:

	~/.ssh/id_rsa_activehacker
	~/.ssh/id_rsa_jexchan

then, add these two keys as following

	$ ssh-add ~/.ssh/id_rsa_activehacker
	$ ssh-add ~/.ssh/id_rsa_jexchan

you can delete all cached keys before

	$ ssh-add -D

finally, you can check your saved keys

	$ ssh-add -l


Modify the ssh config
---------------------------------

	$ cd ~/.ssh/
	$ touch config
	$ subl -a config

Then added

	#activehacker account
	Host github.com-activehacker
		HostName github.com
		User git
		IdentityFile ~/.ssh/id_rsa_activehacker

	#jexchan account
	Host github.com-jexchan
		HostName github.com
		User git
		IdentityFile ~/.ssh/id_rsa_jexchan


Clone you repo and modify your Git config
---------------------------------------------

clone your repo
	git clone git@github.com:activehacker/gfs.git gfs_jexchan

cd gfs_jexchan and modify git config

	$ git config user.name "jexchan"
	$ git config user.email "jexchan@gmail.com" 
 
	$ git config user.name "activehacker"
	$ git config user.email "jexlab@gmail.com" 

or you can have global git config
	$ git config --global user.name "jexchan"
	$ git config --global user.email "jexchan@gmail.com"


then use normal flow to push your code

	$ git add .
	$ git commit -m "your comments"
	$ git push