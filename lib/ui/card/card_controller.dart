import 'package:card_scanner/utils/rx/text_field_validator_controller.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final RxBool isAllValid = RxBool(false);
  final Rxn<CardDetails> _cardDetails = Rxn();
  final CardScanOptions _scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    validCardsToScanBeforeFinishingScan: 1,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.belowCardNumber,
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  final Rxn<dynamic> onError = Rxn();
  final Rxn<dynamic> onSuccess = Rxn();

  final TextFieldValidatorController nameTextValidatorController =
      TextFieldValidatorController();
  final TextFieldValidatorController cardNumberTextValidatorController =
      TextFieldValidatorController();
  final TextFieldValidatorController expiryDateTextValidatorController =
      TextFieldValidatorController();
  final TextFieldValidatorController cvvTextValidatorController =
      TextFieldValidatorController();

  void scanCard() {
    CardScanner.scanCard(scanOptions: _scanOptions).then((cardDetails) {
      nameTextValidatorController.textController.text =
          cardDetails?.cardHolderName ??
              _cardDetails.value?.cardHolderName ??
              "";

      cardNumberTextValidatorController.textController.text =
          cardDetails?.cardNumber ?? _cardDetails.value?.cardNumber ?? "";
      expiryDateTextValidatorController.textController.text =
          cardDetails?.expiryDate ?? _cardDetails.value?.expiryDate ?? "";

      // TODO-lkirov (13 Sep 2023): In this package there is no scan for CVV, investigate further

      _cardDetails(cardDetails);
    }, onError: onError.trigger);
  }

  void submit() {
    onSuccess.trigger(true);
  }

  void validateAll(_) {
    isAllValid(nameTextValidatorController.textController.text.isNotEmpty &&
        cardNumberTextValidatorController.textController.text.isNotEmpty &&
        expiryDateTextValidatorController.textController.text.isNotEmpty &&
        cvvTextValidatorController.textController.text.isNotEmpty);
  }
}
