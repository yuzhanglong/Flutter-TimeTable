## zucc_helper

### About

##### 一个还不错的课程表app 基于flutter编写
##### 对应后端项目地址 https://github.com/yuzhanglong/zucc_helper_backend



### Acknowledgement

##### 部分界面样式参照了网上的ui设计图

##### 首页课程表的布局参照了华为应用商店的一款课程表app



### Structure(省略默认配置文件)

```
├─assets
│  └─images   //静态资源
├─lib
│  │  main.dart    // 程序入口
│  │
│  ├─components   // 组件
│  │  ├─animations    // 动画相关
│  │  │      scale_animation.dart
│  │  │
│  │  ├─drawer
│  │  │  │  main_drawer.dart
│  │  │  │
│  │  │  └─child_cmp
│  │  │          better_drawer.dart
│  │  │
│  │  ├─topbar
│  │  │      top_bar.dart
│  │  │      top_bar_item.dart
│  │  │
│  │  └─mini_widgets
│  │          text_field_for_show.dart
│  │          better_expansion.dart
│  │
│  ├─config     // 配置
│  │      global_config.dart
│  │      network_config.dart
│  │      school_data.dart
│  │      provider_manager.dart
│  │      router_manager.dart
│  │      storage_manager.dart
│  │
│  ├─models   // 模型
│  │      school_model.dart
│  │      login_model.dart
│  │      profile_model.dart
│  │      response_model.dart
│  │      table_model.dart
│  │
│  ├─network   // 网络请求相关
│  │      profile_request.dart
│  │      requests.dart
│  │      table_request.dart
│  │      utils_request.dart
│  │
│  ├─router   // 路由相关
│  │      custom_router.dart
│  │      router_manager.dart
│  │
│  ├─store   // 状态管理
│  │      profile_provider.dart
│  │      table_provider.dart
│  │
│  ├─utils  // 工具
│  │      data_helper.dart
│  │      pick_data.dart
│  │      snack_bar.dart
│  │      table_date.dart
│  │      table_maker.dart
│  │
│  └─views  // 视图
│      ├─connection
│      │  │  connection.dart
│      │  │
│      │  └─child_cmp
│      │          check_code.dart
│      │          data_form.dart
│      │
│      ├─create_class
│      │      create_class.dart
│      │
│      ├─home
│      │  │  home.dart
│      │  │
│      │  └─child_cmp
│      │      ├─classes_map
│      │      │      class_card_item.dart
│      │      │      class_time_item.dart
│      │      │      main_classes_map.dart
│      │      │      bottom_show.dart
│      │      │
│      │      └─day_bar
│      │              day_bar.dart
│      │              day_bar_item.dart
│      │
│      ├─login
│      │  │  login.dart
│      │  │
│      │  └─child_cmp
│      │          split_line.dart
│      │          login_form.dart
│      │
│      ├─settings
│      │  │  settings.dart
│      │  │
│      │  └─child_cmp
│      │          about.dart
│      │          accout_settings.dart
│      │          personalized_settings.dart
│      │          set_password.dart
│      │          class_settings.dart
│      │
│      └─common
│              not_found.dart
│
├─preview   // 预览
│      1.jpg
│      2.jpg
│      3.jpg
│      4.jpg
│      5.jpg
│
```



### Preview

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/1.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/2.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/3.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/4.jpg)

![](https://github.com/yuzhanglong/zucc_helper/blob/master/preview/5.jpg)

2020年3月1日23:14:21
