hexo generate
mdkir -p ../deploy/jarvisxiong.github.io
cp -R public/* ../deploy/jarvisxiong.github.io
cd ../deploy/jarvisxiong.github.io
git init 
git remote add origin git@github.com:jarvisxiong/jarvisxiong.github.io.git
git pull
git add .
git commit -m “update”
git push origin master
