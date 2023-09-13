import 'package:card_scanner/ui/card/card_controller.dart';
import 'package:get/get.dart';

Future inject() async {
  Get.create(() => CardController(), permanent: false);
}
