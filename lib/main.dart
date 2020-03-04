import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_picker/PickerLocalizationsDelegate.dart';
import 'package:zucc_helper/config/global.dart';
import 'package:zucc_helper/config/global_config.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/store/table_provider.dart';
import 'config/router_manager.dart';


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
        ],
        title: "zucc-helper",
        theme: ThemeData(primaryColor: GlobalConfig.basicColor),
        onGenerateRoute: Router.generateRoute,
        initialRoute: RouteName.home,
      ),
    );
  }
}