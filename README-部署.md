# 🍅 番茄王国 - 部署指南

## 快速开始

你的域名：**andyzeng.xin**

---

## 🚀 三种部署方案

### 方案1️⃣：Vercel（最简单，5分钟搞定）

**适合：** 快速演示、测试

**步骤：**
1. 访问 [vercel.com](https://vercel.com)
2. 用GitHub账号登录
3. 点击 "New Project"
4. 拖拽整个 `web homework` 文件夹
5. 等待部署完成
6. 获得网址：`https://xxx.vercel.app`

**绑定域名：**
- Vercel项目 → Settings → Domains
- 添加：`andyzeng.xin`
- 在阿里云DNS添加CNAME记录

**优点：**
- ✅ 完全免费
- ✅ 自动HTTPS
- ✅ 全球CDN加速
- ✅ 无需服务器管理

**缺点：**
- ⚠️ 需要访问外网
- ⚠️ 国内访问可能较慢

---

### 方案2️⃣：阿里云服务器（完全控制）

**适合：** 正式使用、长期运营

**费用：** 
- 轻量应用服务器：60-100元/年
- 学生优惠：9.9元/月

**步骤：**

#### 1. 购买服务器
- 进入 [阿里云控制台](https://www.aliyun.com)
- 产品：轻量应用服务器
- 配置：1核2G、1-5M带宽
- 系统：CentOS 7.9 或 Ubuntu 20.04

#### 2. 配置DNS解析
进入阿里云DNS控制台，添加记录：

| 记录类型 | 主机记录 | 记录值 |
|---------|---------|--------|
| A | @ | 你的服务器IP |
| A | www | 你的服务器IP |

#### 3. 连接服务器
```bash
# Windows用户使用PuTTY或WinSCP
# 或在阿里云控制台直接"远程连接"
```

#### 4. 安装Nginx
```bash
# CentOS
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Ubuntu
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

#### 5. 上传文件

**方法A：使用WinSCP**
- 下载 [WinSCP](https://winscp.net/)
- 连接服务器（SFTP，端口22）
- 上传到：`/usr/share/nginx/html/`
- 将 `index-mobile-enhanced.html` 重命名为 `index.html`

**方法B：使用提供的批处理**
- 双击运行：`部署脚本-上传到服务器.bat`
- 输入服务器IP和密码
- 自动上传

#### 6. 配置Nginx
```bash
sudo cp nginx.conf /etc/nginx/conf.d/tomato.conf
sudo nginx -t
sudo systemctl restart nginx
```

#### 7. 配置HTTPS（推荐）
```bash
sudo yum install certbot python3-certbot-nginx -y
sudo certbot --nginx -d andyzeng.xin -d www.andyzeng.xin
```

#### 8. 访问测试
- http://andyzeng.xin
- https://andyzeng.xin

---

### 方案3️⃣：腾讯云静态托管（免费）

**适合：** 国内用户、教学项目

**步骤：**
1. 访问 [腾讯云云开发](https://console.cloud.tencent.com/tcb)
2. 创建环境（免费版）
3. 进入"静态网站托管"
4. 上传 `index-mobile-enhanced.html`
5. 设置为默认首页
6. 绑定域名 `andyzeng.xin`

**优点：**
- ✅ 完全免费
- ✅ 国内访问快
- ✅ 自动HTTPS

---

## ⚠️ 重要提示

### DNS配置问题
根据你的截图，当前DNS服务器是Cloudflare的，需要：
1. 进入阿里云控制台
2. 域名管理 → andyzeng.xin → DNS修改
3. 改为阿里云DNS：
   - dns9.hichina.com
   - dns10.hichina.com
4. 等待24-48小时全球生效

### 备案要求
⚠️ **使用国内服务器（阿里云/腾讯云）必须备案**
- 备案时间：15-30天
- 费用：免费
- 不想备案：使用香港服务器或Vercel

### 照片功能说明
- LocalStorage存储在客户端浏览器
- 静态托管可以正常使用
- 但照片不会同步到服务器
- 清除浏览器数据会丢失
- 如需真正的后端存储，需要开发服务端API

---

## 📁 部署文件清单

### 必需文件
- ✅ `index-mobile-enhanced.html` - 增强版（推荐）
- ✅ `index-standalone.html` - 基础版

### 配置文件（已准备好）
- ✅ `vercel.json` - Vercel配置
- ✅ `nginx.conf` - Nginx配置示例
- ✅ `.vercelignore` - Vercel忽略文件

### 工具脚本
- ✅ `部署脚本-上传到服务器.bat` - 快速上传工具

---

## 🎯 推荐流程

### 第一次部署（测试）
```
1. 使用Vercel快速部署
2. 测试功能是否正常
3. 获得临时网址演示
```

### 正式部署（长期使用）
```
1. 购买阿里云服务器
2. 配置DNS解析
3. 上传网站文件
4. 配置HTTPS
5. 绑定域名
```

---

## 💡 快速命令参考

### 查看Nginx状态
```bash
sudo systemctl status nginx
```

### 查看Nginx日志
```bash
sudo tail -f /var/log/nginx/tomato_access.log
sudo tail -f /var/log/nginx/tomato_error.log
```

### 重启Nginx
```bash
sudo systemctl restart nginx
```

### 测试配置
```bash
sudo nginx -t
```

### 查看服务器IP
```bash
curl ifconfig.me
```

---

## 📞 获取帮助

查看详细指南：
- `🌐服务器部署完整指南.txt` - 超详细步骤
- `🎯最终使用指南-请看这里.txt` - 功能说明

---

## ✨ 下一步

1. **选择部署方案**（推荐从Vercel开始）
2. **配置DNS解析**（必需）
3. **测试访问**
4. **配置HTTPS**（推荐）
5. **分享给学生使用**

---

**祝部署顺利！🍅**
