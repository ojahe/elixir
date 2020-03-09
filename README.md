# Hello
基于
Elixir
 Phoenix
 Ecto
 jQuery
 Bootstrap 等技术的权限管理系统
 
 ●项目功能：包含一个web应用要用到的基本功能：系统参数配置，模块管理，数据字典，菜单管理，区域管理，公司管理，部门管理，角色管理，岗位管理，用户管理，权限管理，日志管理等。

● 关键技术：
1. Elixir编程语言
2.  Phoenix web开发框架
3.  Ecto 数据库访问框架
4.  jQuery 前端js库
5.  Bootstrap css样式库


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

引入bootstrap参考：
https://www.jianshu.com/p/7032b86d0204
Phoenix 引入完整 Boostrap
2016.07.20 14:19:27
字数 192
阅读 237
默认 Phoenix 只引入了 Bootstrap 的 CSS，没有引入 JQuery 和 bootstrap.js。这时，许多bootstrap的高级组件例如下拉菜单我们都没法使用。

这篇文章讲如何使用Brunch引入Bootstrap的其他文件。

我们下载 JQuery 的压缩包，将其中的 jquery.min.js 放在 vendor 目录下。
我们下载 bootstrap production 压缩包，并将其中的 bootstrap.min.js 放在 vendor 目录下。

如果需要将 vendor 目录下的 js 都合并到 app.js 的话，需要指定 vendor 目录
到 joinTo

这里需要注意的是Join到app.js时要注意引用顺序，先JQuery再Bootstrap

order: {
  before: [
    "web/static/vendor/js/jquery.min.js",
    "web/static/vendor/js/bootstrap.min.js"
  ]
}
如果需要单独添加，可以这样：

joinTo: {
    "js/app.js": /^(web\/static\/js)|(node_modules)/,
    "js/ex_admin_common.js": ["web/static/vendor/ex_admin_common.js"],
    "js/admin_lte2.js": ["web/static/vendor/admin_lte2.js"],
    "js/jquery.min.js": ["web/static/vendor/jquery.min.js"],
    "js/bootstrap.min.js": ["web/static/vendor/bootstrap.min.js"]
},
然后在 app.html 中引用即可：

<script src="<%= static_path(@conn, "/js/jquery.min.js") %>"></script>
<script src="<%= static_path(@conn, "/js/bootstrap.min.js") %>"></script>
<script src="<%= static_path(@conn, "/js/app.js") %>"></script>


Then load dependencies to compile code and assets:

# Initial setup
$ mix deps.get --only prod
$ MIX_ENV=prod mix compile

# Compile assets
$ npm run deploy --prefix ./assets
$ mix phx.digest
And now run mix release:

$ MIX_ENV=prod mix release
