import 'package:provider/provider.dart';
import 'package:zucc_helper/store/profile_provider.dart';
import 'package:zucc_helper/store/table_provider.dart';

List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider(
      create: (context) => ProfileProvider()
  ),
  ChangeNotifierProvider(
      create: (context) => TableProvider()
  ),
];