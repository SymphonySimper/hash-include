import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/router.dart';
import 'package:hashinclude/theme/app_state.dart';
import 'package:hashinclude/theme/app_themes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(AppStateAdapter());
  final appStateBox = await Hive.openBox('appStateBox');
  if (appStateBox.get("appState") == null) {
    appStateBox.put("appState", AppState());
  }
  ScreenUtil.init(designSize: Size(360, 640), allowFontScaling: false);
  runApp(
    ValueListenableBuilder(
      valueListenable: Hive.box('appStateBox').listenable(),
      builder: (context, box, widget) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Hive.box('appStateBox').get('appState');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compile Anywhere',
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
