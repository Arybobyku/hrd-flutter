import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

class DropDownWidget extends StatefulWidget {
  final Widget? titleOption;
  final String? title;
  final bool isRequired;
  final TextStyle? titleStyle;
  final TextStyle? fieldStyle;
  final String? hint;
  final TextStyle? hintStyle;
  final bool? isMaterial;
  final String? attribute;
  final Map? selectedItem;
  final List? items;
  final String? customErrorWithoutValidator;
  final TextStyle? customErrorWithoutValidatorStyle;
  final Function(Map<dynamic, dynamic>?)? callbackWithoutValidator;
  final FormFieldValidator? validators;
  final TextAlign? errorMessageAlign;

  const DropDownWidget({
    Key? key,
    this.titleOption,
    this.title = '',
    this.titleStyle,
    this.isRequired = false,
    this.fieldStyle,
    this.hint,
    this.hintStyle,
    this.isMaterial = false,
    this.attribute,
    this.selectedItem,
    this.items,
    this.customErrorWithoutValidator,
    this.customErrorWithoutValidatorStyle,
    this.callbackWithoutValidator,
    this.validators,
    this.errorMessageAlign = TextAlign.left,
  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> with WidgetMixin {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  List<DropdownMenuItem<Map>>? _dropdownMenuItems;

  Map<dynamic, dynamic>? _selectedItem;
  bool _isErrorCustomMessage = false;
  bool _isErrorWithValidatorKey = false;
  TextStyle defaultStyle = DartDroidFonts.normal(fontSize: 14)!;

  @override
  void initState() {
    super.initState();
    _isErrorWithValidatorKey = _fieldKey.currentState?.hasError ?? false;
    if (widget.hint == null &&
        widget.items != null &&
        widget.items!.isNotEmpty) {
      _selectedItem = widget.items![0];
    }

    if (widget.fieldStyle != null) {
      defaultStyle = widget.fieldStyle!;
    }

    if (widget.selectedItem != null) {
      _selectedItem = widget.selectedItem;
    }

    _dropdownMenuItems = buildDropDownMenuItems(widget.items ?? []);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _formState?.setAttributeValue(widget.attribute, _selectedItem);
    // });
  }

  List<DropdownMenuItem<Map>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Map>> items = [];
    for (Map listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem['value'],
            style: widget.fieldStyle,
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items?.isEmpty ?? false) {
      _dropdownMenuItems = buildDropDownMenuItems(widget.items ?? []);
    }
    if (widget.customErrorWithoutValidator?.isNotEmpty ?? false) {
      _isErrorCustomMessage = true;
    }
    bool _hasError = _isErrorWithValidatorKey || _isErrorCustomMessage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    text: widget.title,
                    style: widget.titleStyle ??
                        DartDroidFonts.normal(
                          fontSize: 16,
                          color: DartdroidColor.greyLighten8,
                        ),
                    children: [
                      if (widget.isRequired) ...[
                        TextSpan(
                          text: ' *',
                          style: DartDroidFonts.normal(
                            color: DartdroidColor.redDarken40,
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              ),
              verticalSpace5,
            ],
          ),
        Container(
          key: widget.key,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                color: DartdroidColor.greyLighten30,
                width: 1,
              )),
          alignment: Alignment.centerLeft,
          child: DropdownButtonFormField(
            key: _fieldKey,
            style: widget.fieldStyle ??
                defaultStyle.copyWith(color: DartdroidColor.black),
            validator: widget.validators,
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            decoration: const InputDecoration(
              iconColor: DartdroidColor.primary,
              isDense: true,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              errorMaxLines: 1,
              errorStyle: TextStyle(color: Colors.transparent, fontSize: 0),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                gapPadding: 0,
              ),
            ),
            value: _selectedItem,
            hint: Text(
              '${widget.hint ?? _selectedItem}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.hintStyle ??
                  defaultStyle.copyWith(color: DartdroidColor.grey),
              textAlign: TextAlign.start,
            ),
            items: _dropdownMenuItems,
            onChanged: widget.callbackWithoutValidator ??
                (value) {
                  setState(() {
                    _selectedItem = value as Map?;
                  });
                  // _formState?.setAttributeValue(widget.attribute, value);
                },
          ),
        ),
        if (_hasError && widget.customErrorWithoutValidator != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              "${widget.customErrorWithoutValidator ?? _fieldKey.currentState?.errorText}",
              textAlign: widget.errorMessageAlign,
              style: widget.customErrorWithoutValidatorStyle ??
                  DartDroidFonts.bold(
                      fontSize: 10, color: DartdroidColor.primary),
            ),
          ),
        ],
      ],
    );
  }
}
