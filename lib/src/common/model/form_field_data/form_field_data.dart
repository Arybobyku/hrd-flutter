/// Used in BlocSelector
class FormFieldData<T> {
  final List validate;

  final T? value;
  final String? key;

  FormFieldData({
    this.validate = const [],
    this.value,
    this.key,
  });

  bool get hasEmptyField => validate.any((element) {
    bool validation = element == null;
    if (element is List || element is Map) {
      validation = validation || element.isEmpty;
    }
    if (element is String) {
      validation = validation || element.trim().isEmpty;
    }

    return validation;
  });
}
