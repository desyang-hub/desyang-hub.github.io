---
# the default layout is 'page'
icon: fas fa-user-circle
order: 4
description: 探索我的技术旅程、技能栈与联系方式
---

<div class="profile-container" markdown="1">

<!-- 头部简介区域 -->
<div class="profile-header" markdown="1">
  <img src="../assets/img/favicons/web-app-manifest-512x512.png" 
     alt="Avatar" 
     class="profile-img">
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

<div class="contact-buttons">
  <!-- Email 按钮：链接已修复，图片文字已添加 -->
  <a href="mailto:desyang@qq.com" target="_blank" class="contact-btn-wrapper">
    <img src="https://img.shields.io/badge/Email-desyang@qq.com-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email">
  </a>
  
  <!-- GitHub 按钮：链接已修复，图片文字已添加 -->
  <a href="https://github.com/desyang-hub" target="_blank" class="contact-btn-wrapper">
    <img src="https://img.shields.io/badge/GitHub-@desyang--hub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
  </a>
</div>

</div>

<style>
/* 自定义样式 */
.profile-container {
  animation: fadeIn 0.8s ease-in-out;
}

.profile-header {
  /* 关键：启用 Flex 布局 */
  display: flex;
  flex-direction: column; /* 子元素垂直排列 */
  align-items: center;    /* 水平居中 (Cross Axis) */
  justify-content: center;/* 垂直居中 (Main Axis) - 可选，看你是否需要 */
  
  text-align: center;     /* 兜底：让文字内容也居中 */
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
  
  /* 关键：确保图片作为块级元素处理，避免底部留白 */
  display: block; 
  /* 在 Flex 容器下，align-items: center 已经生效，这里不需要 margin: 0 auto */
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

/* 包装器：确保点击区域正确 */
.contact-btn-wrapper {
  display: inline-block;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  text-decoration: none !important; /* 强制去除下划线 */
  border-radius: 6px;
  line-height: 0; /* 消除图片底部常见的微小空隙 */
  cursor: pointer;
}

/* 关键：确保图片和链接本身都能响应点击 */
.contact-btn-wrapper img {
  border-radius: 6px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  transition: filter 0.2s ease;
  /* 防止某些主题给图片添加奇怪的指针样式 */
  pointer-events: auto; 
}

/* 悬停效果：上浮 + 阴影加深 */
.contact-btn-wrapper:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 15px rgba(0,0,0,0.2);
}

.contact-btn-wrapper:hover img {
  filter: brightness(1.05); /* 稍微变亮 */
}

/* 暗色模式适配 */
@media (prefers-color-scheme: dark) {
  .contact-btn-wrapper img {
    box-shadow: 0 4px 6px rgba(0,0,0,0.4);
  }
  .contact-btn-wrapper:hover {
    box-shadow: 0 8px 15px rgba(0,0,0,0.5);
  }
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>