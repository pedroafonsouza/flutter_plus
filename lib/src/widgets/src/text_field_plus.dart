import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../flutter_plus.dart';
import '../../../src/components/src/text_field_mask_plus.dart';

class TextFieldPlus extends StatelessWidget {
  /// TextFieldPlus padding
  final EdgeInsets? padding;

  /// TextFieldPlus margin
  final EdgeInsets? margin;

  /// TextFieldPlus height
  final double height;

  /// TextFieldPlus width
  final double? width;

  /// TextFieldPlus alignment
  final Alignment? alignment;

  /// TextFieldPlus backgroundColor
  final Color? backgroundColor;

  /// TextFieldPlus controller
  final TextEditingController? controller;

  /// TextFieldPlus focusNode
  final FocusNode? focusNode;

  /// TextFieldPlus textInputType
  final TextInputType? textInputType;

  /// TextFieldPlus textCapitalization
  final TextCapitalization textCapitalization;

  /// TextFieldPlus textAlign
  final TextAlign textAlign;

  /// TextFieldPlus textAlignVertical
  final TextAlignVertical textAlignVertical;

  /// TextFieldPlus onChanged action
  final Function(String)? onChanged;

  /// TextFieldPlus onTap action
  final Function()? onTap;

  /// TextFieldPlus onEditingComplete action
  final Function()? onEditingComplete;

  /// TextFieldPlus onSubmitted action
  final Function(String)? onSubmitted;

  /// TextFieldPlus mask -> (+##) #####-#####
  final String? mask;

  /// TextFieldPlus placeholder [TextPlus]
  final TextPlus? placeholder;

  /// TextFieldPlus textInputAction
  final TextInputAction textInputAction;

  /// TextFieldPlus maxLength
  final int? maxLength;

  /// TextFieldPlus maxLines
  final int? maxLines;

  /// TextFieldPlus cursorColor
  final Color? cursorColor;

  /// TextFieldPlus cursorRadius
  final double cursorRadius;

  /// TextFieldPlus cursorWidth
  final double cursorWidth;

  /// TextFieldPlus showCursor -> true or false
  final bool showCursor;

  /// TextFieldPlus enabled -> true or false
  final bool? enabled;

  /// TextFieldPlus autocorrect -> true or false
  final bool autocorrect;

  /// TextFieldPlus autofocus -> true or false
  final bool autofocus;

  /// TextFieldPlus obscureText -> true or false
  final bool obscureText;

  /// TextFieldPlus readOnly -> true or false
  final bool readOnly;

  /// TextFieldPlus onlyNumbers -> true or false
  final bool onlyNumbers;

  /// TextFieldPlus textColor
  final Color? textColor;

  /// TextFieldPlus fontSize
  final double? fontSize;

  /// TextFieldPlus fontWeight
  final FontWeight? fontWeight;

  /// TextFieldPlus fontStyle
  final FontStyle? fontStyle;

  /// TextFieldPlus letterSpacing
  final double? letterSpacing;

  /// TextFieldPlus wordSpacing
  final double? wordSpacing;

  /// TextFieldPlus fontFamily
  final String? fontFamily;

  /// TextFieldPlus prefixWidget
  final Widget? prefixWidget;

  /// TextFieldPlus suffixWidget
  final Widget? suffixWidget;

  /// TextFieldPlus textDecorationPlus
  final TextDecorationPlus? textDecorationPlus;

  /// TextFieldPlus radius
  final RadiusPlus? radius;

  /// TextFieldPlus border
  final BorderPlus? border;

  /// TextFieldPlus shadows
  final List<ShadowPlus>? shadows;

  /// TextFieldPlus gradient
  final GradientPlus? gradient;

  /// ButtonPlus skeleton
  final SkeletonPlus? skeleton;

  /// TextFieldPlus inside Center widget
  final bool isCenter;

  /// TextFieldPlus inside Expanded widget
  final bool isExpanded;

  final List<TextInputFormatter>? inpuFormatters;

  TextFieldPlus({
    this.enabled,
    this.isCenter = false,
    this.isExpanded = false,
    this.padding,
    this.margin,
    this.height = 50,
    this.width,
    this.radius,
    this.border,
    this.shadows,
    this.gradient,
    this.skeleton,
    this.alignment,
    this.backgroundColor,
    this.controller,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.mask,
    this.maxLength,
    this.maxLines,
    this.autocorrect = false,
    this.autofocus = false,
    this.obscureText = false,
    this.onlyNumbers = false,
    this.focusNode,
    this.onChanged,
    this.readOnly = false,
    this.cursorColor,
    this.textAlignVertical = TextAlignVertical.center,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
    this.textDecorationPlus,
    this.placeholder,
    this.cursorRadius = 2,
    this.cursorWidth = 2,
    this.showCursor = true,
    this.prefixWidget,
    this.suffixWidget,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
    this.inpuFormatters,
  });

  static ContainerPlus? _containerPlus;

  @override
  Widget build(BuildContext context) {
    return _buildContainerPlus()!;
  }

  ContainerPlus? _buildContainerPlus() {
    _containerPlus = ContainerPlus(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 4),
      margin: margin,
      isCenter: isCenter,
      isExpanded: isExpanded,
      alignment: alignment,
      color: backgroundColor,
      height: height,
      width: width,
      skeleton: skeleton,
      border: border,
      gradient: gradient,
      radius: radius,
      shadows: shadows,
      // notifyParent: () => setState(() {}),
      child: _buildTextField(),
    );
    return _containerPlus;
  }

  Widget _buildTextField() {
    return CupertinoTextField(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 4),
      autocorrect: autocorrect,
      enabled: enabled,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      keyboardAppearance: Brightness.dark,
      cursorColor: cursorColor,
      textAlign: TextAlign.start,
      obscureText: obscureText,
      readOnly: readOnly,
      textAlignVertical: textAlignVertical,
      keyboardType: onlyNumbers == true && textInputType == null
          ? TextInputType.number
          : textInputType,
      maxLines: maxLines,
      maxLength: maxLength,
      // maxLengthEnforced: true,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      showCursor: showCursor,
      cursorRadius: Radius.circular(cursorRadius),
      cursorWidth: cursorWidth,
      placeholder: placeholder?.text,
      placeholderStyle: _buildPlaceholderTextStyle(),
      style: _buildTextStyle(),
      inputFormatters: _getFormatters(),
      prefix: prefixWidget,
      suffix: suffixWidget,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      // remove native decoration
      decoration: null,
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      backgroundColor: Colors.transparent,
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: textDecorationPlus?.textDecoration,
      decorationColor: textDecorationPlus?.color,
      decorationStyle: textDecorationPlus?.decorationStyle,
      decorationThickness: textDecorationPlus?.decorationThickness,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      wordSpacing: wordSpacing,
    );
  }

  TextStyle? _buildPlaceholderTextStyle() {
    if (placeholder == null) return null;
    return TextStyle(
      backgroundColor: placeholder!.backgroundColor,
      color: placeholder!.color,
      fontSize: placeholder!.fontSize,
      fontWeight: placeholder!.fontWeight,
      fontStyle: placeholder!.fontStyle,
      decoration: placeholder!.textDecorationPlus?.textDecoration,
      decorationColor: placeholder!.textDecorationPlus?.color,
      decorationStyle: placeholder!.textDecorationPlus?.decorationStyle,
      decorationThickness: placeholder!.textDecorationPlus?.decorationThickness,
      letterSpacing: placeholder!.letterSpacing,
      fontFamily: placeholder!.fontFamily,
      wordSpacing: placeholder!.wordSpacing,
      height: placeholder!.height,
    );
  }

  List<TextInputFormatter> _getFormatters() {
    var textInputFormatters = [];

    if (inpuFormatters != null && inpuFormatters!.isNotEmpty) {
      textInputFormatters.addAll(inpuFormatters!);
    }

    if (maxLength != null) {
      //   var maxLengthFormatter = LengthLimitingTextInputFormatter(maxLength);
      //   textInputFormatters.add(wmaxLengthFormatter);
      textInputFormatters.add(MaxLengthTextInputFormatter(maxLength));
    }

    if (mask != null) {
      var maskFormatter =
          TextFieldMaskPlus(mask: mask!, filter: {"#": RegExp(r'[0-9]')});
      textInputFormatters.add(maskFormatter);
    }

    if (onlyNumbers == true) {
      // textInputFormatters.add(WhitelistingTextInputFormatter.digitsOnly);
      textInputFormatters.add(FilteringTextInputFormatter.digitsOnly);
      // textInputFormatters.add(DecimalTextInputFormatter());
    }

    return textInputFormatters.map((e) => e as TextInputFormatter).toList();
  }
}

class MaxLengthTextInputFormatter extends TextInputFormatter {
  final int? maxLength;

  MaxLengthTextInputFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength!) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  CurrencyTextInputFormatter({
    this.locale,
    this.name,
    this.symbol,
    this.decimalDigits,
    this.customPattern,
    this.turnOffGrouping = false,
  });

  final String? locale;
  final String? name;
  final String? symbol;
  final int? decimalDigits;
  final String? customPattern;
  final bool turnOffGrouping;

  num _newNum = 0;
  String _newString = '';

  void _formatter(String newText, bool isNegative) {
    final format = NumberFormat.currency(
      locale: locale,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
      customPattern: customPattern,
    );
    if (turnOffGrouping) {
      format.turnOffGrouping();
    }

    _newNum = num.parse(newText);
    if (format.decimalDigits! > 0) {
      _newNum /= pow(10, format.decimalDigits!);
    }
    _newString = (isNegative ? '-' : '') + format.format(_newNum).trim();
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final isInsertedCharacter =
        oldValue.text.length + 1 == newValue.text.length &&
            newValue.text.startsWith(oldValue.text);
    final isRemovedCharacter =
        oldValue.text.length - 1 == newValue.text.length &&
            oldValue.text.startsWith(newValue.text);

    if (!isInsertedCharacter && !isRemovedCharacter) {
      return oldValue;
    }

    final isNegative = newValue.text.startsWith('-');
    var newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    // If the user wants to remove a digit, but the last character of the
    // formatted text is not a digit (for example, "1,00 €"), we need to remove
    // the digit manually.
    if (isRemovedCharacter && !_lastCharacterIsDigit(oldValue.text)) {
      final length = newText.length - 1;
      newText = newText.substring(0, length > 0 ? length : 0);
    }

    _formatter(newText, isNegative);

    if (newText.trim() == '') {
      return newValue.copyWith(
        text: isNegative ? '-' : '',
        selection: TextSelection.collapsed(offset: isNegative ? 1 : 0),
      );
    } else if (newText == '00' || newText == '000') {
      return TextEditingValue(
        text: isNegative ? '-' : '',
        selection: TextSelection.collapsed(offset: isNegative ? 1 : 0),
      );
    }

    return TextEditingValue(
      text: _newString,
      selection: TextSelection.collapsed(offset: _newString.length),
    );
  }

  static bool _lastCharacterIsDigit(String text) {
    final lastChar = text.substring(text.length - 1);
    return RegExp('[0-9]').hasMatch(lastChar);
  }

  /// Get String type value with format such as `$ 2,000.00`
  String getFormattedValue() {
    return _newString;
  }

  /// Get num type value without format such as `2000.00`
  num getUnformattedValue() {
    return _newNum;
  }

  /// Method for formatting value.
  /// You can use initialValue with this method.
  String format(String value) {
    final isNegative = value.startsWith('-');
    final newText = value.replaceAll(RegExp('[^0-9]'), '');
    _formatter(newText, isNegative);
    return _newString;
  }
}
