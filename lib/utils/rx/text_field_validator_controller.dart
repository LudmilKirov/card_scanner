import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TextFieldValidatorController {
  final TextEditingController textController = TextEditingController();
  final Rx<TextFieldValidationModel> validation =
      Rx<TextFieldValidationModel>(TextFieldValidationModel.initial());
}

/// Say we're validating a form.
/// - A field can have an error (normally it will be valid = false)
/// - A field might not have an error (and still be invalid, for example, when it's empty. We don't show errors in fields
/// that haven't been entered yet, but they're not valid - valid = false)
/// - A field might not have an error, and be valid (valid = true)
/// We create the static named constructor `initial` to say "this isn't valid, although there's no error"
class TextFieldValidationModel {
  final bool valid;
  final String? error;

  TextFieldValidationModel(this.valid, this.error);

  TextFieldValidationModel.initial()
      : valid = false,
        error = null;
}
