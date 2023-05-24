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
    bool _validation = element == null;
    if (element is List || element is Map) {
      _validation = _validation || element.isEmpty;
    }
    if (element is String) {
      _validation = _validation || element.trim().isEmpty;
    }

    return _validation;
  });
}
