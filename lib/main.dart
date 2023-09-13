import 'package:card_scanner/injector/injector.dart';
import 'package:card_scanner/ui/card/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await runMandatoryFutures();
  inject();

  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardScreen(),
    );
  }
}

Future<void> runMandatoryFutures() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
