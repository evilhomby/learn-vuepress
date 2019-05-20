npm run docs:build

cd docs/.vuepress/dist

git init

git add .

git commit -m 'deploy'

git push -f https://github.com/evilhomby/learn-vuepress.git master:gh-pages

cd -