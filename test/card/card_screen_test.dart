import 'package:card_scanner/ui/card/card_controller.dart';
import 'package:card_scanner/ui/card/card_screen.dart';
import 'package:card_scanner/utils/rx/text_field_validator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class CardControllerMock extends GetxController
    with Mock
    implements CardController {
  @override
  final TextFieldValidatorController nameTextValidatorController =
      TextFieldValidatorController();

  @override
  final TextFieldValidatorController cardNumberTextValidatorController =
      TextFieldValidatorController();

  @override
  final TextFieldValidatorController expiryDateTextValidatorController =
      TextFieldValidatorController();

  @override
  final TextFieldValidatorController cvvTextValidatorController =
      TextFieldValidatorController();

  @override
  final RxBool isAllValid = RxBool(false);
}

void main() {
  late CardController controller;

  setUp(() {
    controller = CardControllerMock();
    Get.put<CardController>(controller);
  });

  tearDown(() {
    Get.reset(); // Cleans up Getx controllers
  });

  group('CardScreen Widget Tests', () {
    testWidgets('Renders CardScreen with required fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CardScreen()));

      // Checking for top text.
      expect(
          find.text(
              'Please, fill all the field to proceed further, you can use the scan button to populate some of the fields'),
          findsOneWidget);

      // Checking for input fields.
      expect(find.widgetWithText(TextFormField, ''), findsNWidgets(4));
    });
    testWidgets('Has a scan and submit button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CardScreen()));

      // Checking for Scan button
      expect(find.widgetWithText(Container, 'Scan'), findsOneWidget);

      // Checking for Submit button
      expect(find.widgetWithText(Container, 'Submit'), findsOneWidget);
    });

    testWidgets('Tapping Scan button calls scanCard',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CardScreen()));

      // Find the Scan button and tap it.
      final scanButton = find.widgetWithText(Container, 'Scan');
      await tester.tap(scanButton);
      await tester.pumpAndSettle();

      // Verify that the method was called.
      verify(() => controller.scanCard()).called(1);
    });
  });
}
