# 使用 Vuepress 建立網站

```bash
# 安裝 Vuepress
npm install -D vuepress
```

建立 docs 資料夾，當然也可以使用其他名稱。並在資料夾中建立 md 檔，預設的首頁是 index.md 或 about.md。

```bash
cd docs
echo '# Hello World' >> index.md
```

可在 package.json 中加入 scripts 或是直接執行 (但需要在專案資料夾執行)，即可在預設的 `http://localhost:8080` 查看網站

```bash
# 在專案資料夾執行 (docs 的上層資料夾)
node_modules/.bin/vuepress dev docs

# 依官網的教學設定 package.json 則在專案資料夾中任一層都可以執行
npm run docs:dev
```

確認預覽結果都沒問題，即可產生靜態檔案供發佈到 Github Pages 或其他主機上。

```bash
node_modules/.bin/vuepress build docs

npm run docs:build
```

檔案會放置在 `專案資料夾\docs\.vuepress\dist` 中

### 推送到 Github Pages

首先需先建立一個 Repo

由於 vuepress 每次執行 build 時會將 dist 資料夾刪後重建，因此 .git 資料夾也會被刪掉

所以每次都要執行以下指令，或可參考官網的 Deploy 章節建立 deoply.sh 來方便部署。

```bash
cd docs\.vuepress\dist
git init
git add .
git commit -m 'deploy'
# 強制推送後只會剩下當前的 commit 記錄
git push -f https://github.com/{username}/{repo-name}.git master:gh-pages
```

在 Github 專案項目 environment 的 Active Log 會有部署的記錄。(但只有專案擁有者看得到)

### 關於 Git 的管理

將專案資料夾 push 到 master 分支；而建立的靜態檔案則 push 到 gh-pages 分支。

當然 .gitignore 別忘了將 .vuepress/dist 給排除

```txt
node_modules
.vuepress/dist
```