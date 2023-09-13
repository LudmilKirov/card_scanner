import 'package:card_scanner/ui/card/card_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCardController extends Mock implements CardController {}

void main() {
  late CardController controller;

  setUp(() {
    controller = MockCardController();
  });

  test('validateAll sets isAllValid correctly', () {
    controller.nameTextValidatorController.textController.text = "John";
    controller.cardNumberTextValidatorController.textController.text = "1234";
    controller.expiryDateTextValidatorController.textController.text = "12/25";
    controller.cvvTextValidatorController.textController.text = "123";

    controller.validateAll(null);

    expect(controller.isAllValid.value, true);
  });

  test('validateAll sets isAllValid incorrectly', () {
    controller.nameTextValidatorController.textController.text = "John";
    controller.cardNumberTextValidatorController.textController.text = "1234";
    controller.expiryDateTextValidatorController.textController.text = "12/25";

    controller.validateAll(null);

    expect(controller.isAllValid.value, false);
  });
}
