## zucc_helper

### About

##### 一个还不错的课程表app 基于flutter编写



### Structure(省略默认配置文件)

```
├─assets
│  └─images   //静态资源
├─lib
│  │  app.dart
│  │  main.dart  //程序入口
│  │
│  ├─components
│  │  ├─animations
│  │  │      scale_animation.dart  //封装的动画
│  │  │
│  │  ├─drawer
│  │  │  │  main_drawer.dart //home页抽屉
│  │  │  │
│  │  │  └─child_cmp
│  │  │          better_drawer.dart  //抽屉widget
│  │  │
│  │  ├─expansion
│  │  │      better_expansion.dart  //扩展列表
│  │  │
│  │  └─topbar
│  │          top_bar.dart   //首页的顶部栏
│  │          top_bar_item.dart
│  │
│  ├─config  //配置相关
│  │      global.dart   //全局配置(这里和provider的逻辑有点混乱，需要重构)
│  │      global_config.dart
│  │      network_config.dart  //网络请求配置
│  │      school_data.dart  //学校时间信息
│  │
│  ├─models  //模型相关
│  │      response_model.dart //后端响应模型
│  │      school_model.dart  //学校模型
│  │      table_model.dart  //课程表模型
│  │      user_model.dart  //用户模型
│  │
│  ├─network
│  │      requests.dart  //封装dio
│  │      table_request.dart  //课程表相关请求
│  │      user_request.dart  //用户相关请求
│  │      utils_request.dart //导入课表相关
│  │
│  ├─router
│  │      custom_router.dart  //router跳转相关(没用上,后来觉得还是默认的好)
│  │
│  ├─store //状态管理
│  │      base.dart
│  │      profile_provider.dart  //个人信息 权限等的状态管理
│  │      table_provider.dart  //课程表的状态管理
│  │
│  ├─utils  //工具类
│  │      data_helper.dart  //数据持久化处理
│  │      pick_data.dart    //选择器的选项文件
│  │      snack_bar.dart	//在默认snack_bar基础上封装的snack_bar
│  │      table_date.dart	//计算相关
│  │      table_maker.dart  //课程表初始化
│  │
│  └─views
│      ├─connection   //拉取教务处课表视图
│      │  │  connection.dart
│      │  │
│      │  └─child_cmp
│      │          check_code.dart  //二维码显示widget
│      │          data_form.dart   //登录教务平台界面
│      │
│      ├─create_class
│      │      create_class.dart   //新建课程界面
│      │
│      ├─home
│      │  │  home.dart  //首页(显示课程表)
│      │  │
│      │  └─child_cmp
│      │      ├─classes_map
│      │      │      class_card_item.dart  //课程表组件
│      │      │      class_time_item.dart  //课程表组件(左侧时间线)
│      │      │      main_classes_map.dart //课程表主体
│      │      │
│      │      └─day_bar
│      │              day_bar.dart    //顶端显示周次
│      │              day_bar_item.dart   //顶端显示周次组件的items
│      │
│      ├─login
│      │  │  login.dart   //登录视图
│      │  │
│      │  └─child_cmp
│      │          login_form.dart   //登录表单
│      │          split_line.dart   //分割线widget
│      │
│      └─settings       //设置视图
│          │  settings.dart   //设置
│          │
│          └─child_cmp
│                  about.dart    //关于弹框
│                  accout_settings.dart   //账户设置
│                  class_settings.dart  //课程设置
│                  personalized_settings.dart   //个性化设置(暂未开发)
│                  set_password.dart  //重置密码组件
│
├─preview     //项目预览图片(见下面)
│      1.jpg
│      2.jpg
│      3.jpg
│      4.jpg
│      5.jpg
```





### Preview

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/1.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/2.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/3.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/4.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/5.jpg)



### Acknowledgement

##### 部分界面样式参照了网上的ui设计图

##### 首页课程表的布局参照了华为应用商店的一款课程表app

2020年3月1日23:14:21
