import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/screens/ProKitLauncher.dart';
import 'package:prokit_flutter/main/screens/ProKitWebLauncher.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class AppSplashScreen extends StatefulWidget {
  static String tag = '/ProkitSplashScreen';

  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    afterBuildCreated(() async {
      setValue(appOpenCount, (getIntAsync(appOpenCount)) + 1);

      //await 2.seconds.delay;
      await appStore.setLanguage(getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage), context: context);

      if (isWeb || isLinux) {
        ProKitWebLauncher().launch(context, isNewTask: true);
      } else {
        ProKitLauncher().launch(context, isNewTask: true);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/app/app_icon.png', height: 200, fit: BoxFit.fitHeight),
      ),
    );
  }
}
