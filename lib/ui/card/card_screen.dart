import 'package:card_scanner/res/colors.dart';
import 'package:card_scanner/res/dimensions.dart';
import 'package:card_scanner/ui/card/card_controller.dart';
import 'package:card_scanner/utils/extension/rx_extensions.dart';
import 'package:card_scanner/utils/rx/text_field_validator_controller.dart';
import 'package:card_scanner/utils/ui/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends GetWidget<CardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        extraLarge.toSpace(),
        _buildTopText(),
        extraLarge.toSpace(),
        _buildCardHolderName(),
        large.toSpace(),
        _buildCardNumber(),
        large.toSpace(),
        _buildExpiryDate(),
        large.toSpace(),
        _buildCVV(),
        large.toSpace(),
        _buildScanButton(),
        const Spacer(),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildScanButton() {
    return Center(
      child: InkWell(
        onTap: () {
          controller.scanCard();
        },
        child: Container(
          color: Colors.blue,
          width: 200,
          height: 48,
          child: const Center(
            child: Text(
              "Scan",
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: small),
      child: Text(
        "Please, fill all the field to proceed further, you can use the scan button to populate some of the fields",
      ),
    );
  }

  Widget _buildCardHolderName() {
    return controller.nameTextValidatorController.validation.build(
      (validation) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: small),
        child: ParentTextField(
          title: "Card holder name",
          child: _buildTextField(
            controller.nameTextValidatorController,
            "John Doe",
            controller.validateAll,
          ),
        ),
      ),
    );
  }

  Widget _buildCardNumber() {
    return controller.cardNumberTextValidatorController.validation.build(
      (validation) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: small),
        child: ParentTextField(
          title: "Card number",
          child: _buildTextField(
            controller.cardNumberTextValidatorController,
            "XXXX XXXX XXXX XXXX",
            controller.validateAll,
          ),
        ),
      ),
    );
  }

  Widget _buildExpiryDate() {
    return controller.expiryDateTextValidatorController.validation.build(
      (validation) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: small),
        child: ParentTextField(
          title: "Expiry date`",
          child: _buildTextField(
            controller.expiryDateTextValidatorController,
            "05/22",
            controller.validateAll,
          ),
        ),
      ),
    );
  }

  Widget _buildCVV() {
    return controller.cvvTextValidatorController.validation.build(
      (validation) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: small),
        child: ParentTextField(
          title: "CVV",
          child: _buildTextField(
            controller.cvvTextValidatorController,
            "XXX",
            controller.validateAll,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextFieldValidatorController textFieldValidatorController,
    String hintText,
    Function(String) onChanged,
  ) {
    return textFieldValidatorController.validation.build(
      (validation) => SizedBox(
        child: TextFormField(
          textInputAction: TextInputAction.done,
          controller: textFieldValidatorController.textController,
          decoration: _inputDecoration(hintText, validation.error != null),
          onChanged: onChanged,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String? hint, bool isError) {
    return InputDecoration(
      hintText: hint,
      alignLabelWithHint: true,
    );
  }

  Widget _buildSubmitButton() {
    return controller.isAllValid.build(
      (isAllValid) => InkWell(
        onTap: isAllValid ? () {} : null,
        child: Container(
          width: double.maxFinite,
          height: 48,
          color: primaryColor.withOpacity(isAllValid ? 1 : 0.25),
          child: const Center(child: Text("Submit")),
        ),
      ),
    );
  }
}
