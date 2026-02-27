---
title: 如何在 GitHub 上使用 Jekyll 搭建个人网站
date: 2026-01-06 19:00:00 +0800
categories: [misc]
tags: [Jekyll]     # TAG names should always be lowercase
---

在当今数字时代，拥有一个属于自己的个人网站不仅是展示技术能力的方式，也是记录思考、分享知识的绝佳平台。而 **Jekyll + GitHub Pages** 的组合，正是零成本、高效率搭建静态个人网站的黄金搭档。本文将手把手教你如何从零开始，在 GitHub 上部署一个基于 Jekyll 的个人网站。

## 什么是 Jekyll 和 GitHub Pages？

- **Jekyll** 是一个用 Ruby 编写的静态网站生成器。它将 Markdown 或 HTML 文件转换为完整的静态网站，无需数据库或后端服务。
- **GitHub Pages** 是 GitHub 提供的免费静态网站托管服务。只要将符合规范的代码推送到指定分支（如 `main` 或 `gh-pages`），GitHub 就会自动构建并发布你的网站。

两者结合，你只需写 Markdown，就能拥有一个专业、快速、安全的个人博客！

## 第一步：创建 GitHub 仓库

1. 登录你的 [GitHub 账号](https://github.com)。
2. 创建一个名为 `{username}.github.io` 的新仓库（`{username}` 替换为你的 GitHub 用户名，例如 `dasyang.github.io`）。
   > ⚠️ 仓库名必须严格匹配，否则 GitHub Pages 无法识别为主页。
3. 初始化时可选择添加 `README.md`，但非必需。

## 第二步：本地安装 Jekyll（可选但推荐）

虽然 GitHub Pages 会在云端自动构建，但在本地预览能极大提升写作体验。

### 安装依赖（以 macOS/Linux 为例）：
```bash
# 安装 Ruby（建议使用 rbenv 或 rvm 管理版本）
sudo apt install ruby-full build-essential zlib1g-dev  # Ubuntu
# 或 brew install ruby  # macOS

# 安装 Jekyll 和 Bundler
gem install jekyll bundler
```

### 创建新站点（或克隆模板）：
你可以从头创建：
```bash
jekyll new my-site
cd my-site
bundle exec jekyll serve
```
也可以直接使用现成的主题（如 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)、[Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/)）作为起点。

> 💡 对于新手，强烈建议使用成熟主题，避免从零配置。

## 第三步：配置并推送代码到 GitHub

1. 将你的 Jekyll 项目文件（包括 `_config.yml`、`_posts`、`Gemfile` 等）放入本地仓库目录。
2. 确保 `_config.yml` 中包含以下关键配置（以用户主页为例）：
   ```yaml
   title: 你的网站标题
   email: your-email@example.com
   description: 网站描述
   baseurl: ""          # 用户主页留空
   url: "https://yourusername.github.io"
   github_username: yourusername
   ```
3. 提交并推送到 GitHub：
   ```bash
   git init
   git add .
   git commit -m "Initial commit: deploy Jekyll site"
   git branch -M main
   git remote add origin https://github.com/yourusername/yourusername.github.io.git
   git push -u origin main
   ```

## 第四步：等待 GitHub Pages 自动部署

推送成功后，GitHub 会自动触发 Pages 构建。通常 1–2 分钟内，你就可以通过以下地址访问你的网站：

```
https://yourusername.github.io
```

> 🔍 可在仓库的 **Settings > Pages** 中查看部署状态和自定义域名选项。

## 第五步：撰写你的第一篇博客

所有博客文章应放在 `_posts` 目录下，文件命名格式为：
```
YYYY-MM-DD-title.md
```

例如：
```markdown

---
layout: post
title: "Hello World!"
date: 2026-01-06 19:00:00 +0800
categories: [随笔]
---

欢迎来到我的个人网站！🎉  
这是由 Jekyll + GitHub Pages 驱动的第一篇文章。
```

每次推送新文章，GitHub 都会自动重新构建网站，无需额外操作。

## 小贴士

- 使用 `bundle exec jekyll serve --livereload` 在本地实时预览。
- 主题配置请仔细阅读所选主题的文档。
- 可通过 `CNAME` 文件绑定自定义域名（如 `example.com`）。
- 所有内容均为静态文件，天然具备高性能与安全性。

## 结语

借助 Jekyll 和 GitHub Pages，你无需服务器、不用写后端，就能拥有一个完全属于自己的网站。更重要的是——**写作本身才是核心**。技术只是工具，思想才是内容。

现在，轮到你了：写下你的第一行文字，让世界听见你的声音。

---

> 🌐 本博客即由 Jekyll 生成，源码托管于 [GitHub](https://github.com/dasyang/dasyang.github.io)。  
> © 2026 by desyang. All rights reserved.