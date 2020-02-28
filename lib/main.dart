import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_picker/PickerLocalizationsDelegate.dart';
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
        localizationsDelegates: [
          PickerLocalizationsDelegate.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('zh', 'CH'),
          const Locale('ko', 'KO'),
          const Locale('it', 'IT'),
          const Locale('ar', 'AR'),
          const Locale('tr','TR')
        ],
        title: "zucc-helper",
        home: App(),
        theme: ThemeData(
            primaryColor: GlobalConfig.basicColor
        ),
      ),
    );
  }
}