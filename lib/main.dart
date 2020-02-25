import 'package:flutter/material.dart';
import 'package:zucc_helper/app.dart';
import 'package:zucc_helper/config/global.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/store/table_provider.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Global.init().then((e) => runApp(ZuccHelperApp()));
}


class ZuccHelperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => TableProvider())
      ],
      child: MaterialApp(
        title: "zucc-helper",
        home: App(),
        theme: ThemeData(
            primaryColor: GlobalConfig.basicColor
        ),
      ),
    );
  }
}