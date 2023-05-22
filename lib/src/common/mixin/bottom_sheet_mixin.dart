import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

mixin BottomSheetMixin {
  Future<T?> showBottomPopup<T>(
    BuildContext context, {
    required Widget content,
    bool flexible = false,
    double heightScreen = 0.9,
    BorderRadius? borderRadius,
    bool hideTopStripe = false,
    bool isDismissible = true,
    bool dragScroll = false,
  }) {
    late final Widget childWidget;

    if (dragScroll) {
      childWidget = content;
    } else if (flexible) {
      childWidget = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!hideTopStripe) ...[
            const SizedBox(height: 20),
          ],
          content
        ],
      );
    } else {
      childWidget = LayoutBuilder(
        builder: (context, size) {
          return SizedBox(
            width: size.maxWidth,
            height: size.maxHeight * heightScreen,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!hideTopStripe) ...[
                  const SizedBox(height: 20),
                ],
                Expanded(
                  child: content,
                ),
              ],
            ),
          );
        },
      );
    }

    return showModalBottomSheet<T?>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: true,
      backgroundColor: DartdroidColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
      ),
      builder: (context) => AnimatedPadding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: childWidget,
      ),
    );
  }
}
