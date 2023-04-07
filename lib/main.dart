import 'package:dia/firebase_options.dart';
import 'package:dia/view_model/sign_in_checkbox.dart';
import 'package:dia/views/auth/user_create_initial_profile.dart';
import 'package:dia/views/auth/user_register.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'view_model/create_init_profile_providers.dart';

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
        create: (context) => CreateInitProfileProviders(),
      ),
    ],
    child: EasyLocalization(
        fallbackLocale: const Locale('en', 'EN'),
        path: "assets/lang",
        supportedLocales: const [Locale("tr", "TR"), Locale("en", "EN")],
        child: GetMaterialApp(home: const MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const CreateInitialProfile(),
    );
  }
}
