---
# the default layout is 'page'
icon: fas fa-user-circle
order: 4
description: 探索我的技术旅程、技能栈与联系方式
title: 关于我
---

<div class="profile-container" markdown="1">

<!-- 头部简介区域 -->
<div class="profile-header" markdown="1">
  <img src="../assets/img/favicons/web-app-manifest-512x512.png" alt="Avatar" class="profile-img">
  <h1>👋 你好，我是 <span style="color: var(--primary-color);">desyang</span></h1>
  <p class="lead">🚀 <strong>全栈开发者 | 开源爱好者 | 终身学习者</strong></p>
  <p class="typing-text">致力于用代码改变世界</p>
</div>

<!-- 技能栈区域 -->
## 🛠️ 技术武器库

我热衷于探索新技术，以下是我目前主要使用的工具和技术：

| 领域 | 技能栈 |
| :--- | :--- |
| **💻 编程语言** | ![C++](https://img.shields.io/badge/C++-00599C?style=flat&logo=c%2B%2B&logoColor=white) ![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white) ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white) |
| **⚙️ 后端/架构** | ![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black) ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white) ![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white) |

<!-- 经历时间轴区域 -->
## 📜 成长轨迹

### 🎓 教育背景
- **计算机科学与技术 硕士**  
  📅 `2024` - `至今`
  > *主修课程：数据结构、操作系统、计算机网络、数据库、C++ 高级编程...*

<!-- 联系方式区域 -->
## 📬 联系我

无论是技术交流、项目合作还是单纯想交个朋友，都欢迎随时联系我！

<div class="contact-buttons" markdown="1">
  <a href="mailto:desyang@qq.com" target="_blank" class="contact-btn">
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=black" alt="Email">
  </a>
  <a href="https://github.com/desyang-hub" target="_blank" class="contact-btn">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
  </a>
</div>

</div>

<style>
/* 自定义样式 */
.profile-container {
  animation: fadeIn 0.8s ease-in-out;
}

.profile-header {
  text-align: center;
  margin-bottom: 2rem;
  padding: 2rem 1rem;
  background: var(--card-bg, #f8f9fa);
  border-radius: 15px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.profile-img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  border: 4px solid var(--primary-color, #2b85e4);
  margin-bottom: 1rem;
  transition: transform 0.3s ease;
  display: inline-block;
}

.profile-img:hover {
  transform: scale(1.05) rotate(5deg);
}

.typing-text {
  font-size: 1.1rem;
  color: var(--text-muted, #6c757d);
  font-style: italic;
  display: block;
  margin: 1rem 0;
}

p.lead {
  color: var(--text-color, #333); 
}

.contact-buttons {
  display: flex;
  justify-content: center;
  gap: 1.5rem;
  flex-wrap: wrap;
  margin-top: 2rem;
}

.contact-btn {
  display: inline-block;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  text-decoration: none !important;
  border-radius: 4px;
}

.contact-btn:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.contact-btn img {
  height: auto;
  max-width: 100%;
  display: block;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

@media (prefers-color-scheme: dark) {
  .profile-header {
    background: var(--card-bg, #212529);
  }
  p.lead {
    color: var(--text-color, #e0e0e0);
  }
}
</style>