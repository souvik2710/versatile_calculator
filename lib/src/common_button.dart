import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class CommonElevatedButton extends HookConsumerWidget {
 final bool isCapsule;
 final  String buttonText;
 final Function()? onbuttonPressed;
 final  double insideVerticalPadding;
 final double outSidePadding;
 final  double verticalOutsidePadding;
 final double sizeType;
 final Color colorType;
 final double width;
 final double height;
 final FontWeight textFontWeight;
  //isMobile, insideVerticalPadding, outSidePadding are optional
  //CommonElevatedButton

  CommonElevatedButton({
    this.isCapsule = false,
    required this.buttonText,
    required this.onbuttonPressed,
    this.insideVerticalPadding = 18.0,
    this.outSidePadding = 5.0,
    this.verticalOutsidePadding = 0.0,
    required this.sizeType,
    required this.colorType,
    this.width = double.infinity,
    // this.height = double.infinity,
    // this.width = 100.0,
    this.height = 35.0,
    this.textFontWeight = FontWeight.normal
  });
// DineOrderColors.buttonOrangeColor
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorState = useState(colorType);
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: outSidePadding,vertical: verticalOutsidePadding),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorState.value,
            side: BorderSide(
              width: 1.0,
              color: colorType,
            ),
            // onPrimary: colorType == ButtonColorType.light ? Color(0xFF005FB8):Colors.white,
            onPrimary: colorType == ButtonColorType.light
                ? Colors.white
                : Colors.white,
            // onPrimary: isDark? isMobile ? Colors.white : Colors.white: Color(0xff518dd1),
            //shadowColor: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.symmetric(vertical: insideVerticalPadding),
            shape: RoundedRectangleBorder(
              borderRadius: isCapsule
                  ? BorderRadius.circular(20.0)
                  : BorderRadius.circular(0.0),
            ),

            elevation: 0,
          ),
          onHover: (bool v) {
            // colorState.value = Colors.white;
          },
          // focusNode: ,
          onFocusChange: (var v) {
            // colorState.value = colorType;
            colorState.value = Colors.white;
          },
          onPressed: onbuttonPressed,
          child: Center(
            child: Text(
              '$buttonText',
              style: TextStyle(
                  fontFamily: "proxima",
                  fontSize: sizeType,
                  fontWeight: textFontWeight
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonSizeType {
  static double small = 11.0;
  static double medium = 14.0;
  static double large = 19.0;
}

class ButtonColorType {
  static const Color dark = Color(0xFF005FB8);
  // static const Color light = Color(0xfff3f9ff);
  static const Color light = Color(0xFF005FB8);
  static const Color danger = Colors.red;
}