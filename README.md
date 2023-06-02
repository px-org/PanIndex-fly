# PanIndex-fly

## 部署

1. 安装 [Flyctl](https://fly.io/docs/hands-on/install-flyctl/)
2. 注册，绑卡（已有账号请跳过）`flyctl auth signup`
3. 登录`flyctl auth login`
4. Git 拉取本仓库代码`git clone https://github.com/libsgh/PanIndex-fly.git`
5. 进入代码根目录执行`flyctl launch`
6. 输入你的应用名称（留空回车则自动生成）
7. 选择部署区域
8. 根据提示创建 Postgres 数据库，创建完成后选择连接数据库
9. 询问创建 Redis 数据库，选择`N`
10. 选择立刻部署，完成后会出现类似`https://crimson-sea-4968.fly.dev/`的访问地址

## 其他事项

- 在本地仓库代码中手动指定[版本号](https://github.com/px-org/PanIndex/releases)，在`Dockerfile`配置文件中进行设置，使用`flyctl deploy`完成上传更新

- 自己的域名可在应用管理面板中的`Certificates`进行绑定

- 如需使用其他数据库，则部署时取消创建 Postgres 数据库，然后使用环境变量指定数据库链接

  ```shell
  flyctl secrests set DATABASE_URL=<数据库链接>
  ```

## 相关
[PanIndex](https://github.com/libsgh/PanIndex)