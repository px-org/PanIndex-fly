# PanIndex-fly

**如果想指定版本，请在`fly.toml`配置文件中设置环境变量`PAN_INDEX_VERSION`，为空将使用Release最新版。**

1. 安装[fly cli](https://fly.io/docs/hands-on/install-flyctl/)
2. 注册，绑卡（已有账号请跳过）`flyctl auth signup`
3. 登录`flyctl auth login`
4. Git拉取本仓库代码`git clone https://github.com/libsgh/PanIndex-fly.git`
5. 进入代码根目录执行`flyctl launch`
6. 按照提示，输入你的应用名称
7. 创建postgres数据库，记住`DATABAST_URL`
8. 构建完成后，会询问是否部署（deploy），这里选否，因为我们要重新设置下postgre url
9. 重新设置下DATABAST_URL
   ```
    flyctl secrets set DATABASE_URL=<第七步记下的url>?sslmode=disable
   ```
10. 步骤7，8，9是解决pg ssl错误， 会在后面的版本中优化
11. 最后执行`flyctl deploy`部署，地址：https://appName.fly.dev
12. 可以绑定自己的域名，会有一个ipv4地址，cname和a应该都可以请自行尝试

### 相关
[PanIndex](https://github.com/libsgh/PanIndex)