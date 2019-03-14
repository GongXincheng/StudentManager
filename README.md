# 学生信息管理系统

## 项目介绍
   ##### 个人学习中写的简单的学生信息管理系统。使用SOA架构：工程拆分成服务层、表现层两个工程，添加单点登录系统。并使用Nignx作为反向代理服务器。
    
## 功能
院系、专业、学生信息的增删改、条件查询，学生头像的上传，一键导出Excel表格，列表分页，用户访问列表，及其访问人数统计，专业、院系人数统计，用户的登录、注册

## 软件架构
### 后端技术：
* Spring Framework: 容器
* SpringMVC: MVC框架
* Mybatis: ORM框架
* MyBatis Generator: MyBatis逆向工程
* PageHelper（MyBatis分页插件）
* Dubbo: 分布式服务框架进行项目间通信
* ZooKeeper: 分布式协调服务
* redis: 分布式缓存数据库
* Maven: 项目构建管理

### 前端框架：
* jQuery:javascript框架
* Bootstrap:前端响应式框架
* Echarts:图表统计
* wow.js && animate.css : 动画效果


#### 安装

* 使用tomcat热部署