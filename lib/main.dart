import 'package:dia/constant/constants.dart';
import 'package:dia/firebase_options.dart';
import 'package:dia/view_model/appbar_viewmodel.dart';
import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/view_model/new_diary_viewmodels.dart';
import 'package:dia/view_model/new_routine_viewmodel.dart';
import 'package:dia/view_model/pick_image.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/view_model/routine_view.dart';
import 'package:dia/view_model/sign_in_checkbox.dart';
import 'package:dia/views/auth/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignInCheckbox(),
      ),
      ChangeNotifierProvider(
        create: (context) => PickImageBoolenValue(),
      ),
      ChangeNotifierProvider(
        create: (context) => TopicsContainerProivder(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppbarViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => NewRoutineViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => RoutineViewModel(),
      )
    ],
    //deneme
    child: EasyLocalization(
        fallbackLocale: const Locale('en', 'EN'),
        path: "assets/lang",
        supportedLocales: const [Locale("tr", "TR"), Locale("en", "EN")],
        child: const GetMaterialApp(home: MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: CustomColors.primaryPurple),
      home: LoginPage(),
    );
  }
}
