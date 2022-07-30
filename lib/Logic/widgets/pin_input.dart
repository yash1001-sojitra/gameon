// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputField extends StatefulWidget {
  final int length;
  final void Function(bool)? onFocusChange;
  final void Function(String) onSubmit;

  const PinInputField({
    Key? key,
    this.length = 4,
    this.onFocusChange,
    required this.onSubmit,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late final TextEditingController _pinPutController;
  late final FocusNode _pinPutFocusNode;
  late final int _length;

  Size _ContainerSize(BuildContext context) {
    return const Size.square(50);
  }

  @override
  void initState() {
    _pinPutController = TextEditingController();
    _pinPutFocusNode = FocusNode();

    if (widget.onFocusChange != null) {
      _pinPutFocusNode.addListener(() {
        widget.onFocusChange!(_pinPutFocusNode.hasFocus);
      });
    }

    _length = widget.length;
    super.initState();
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  PinTheme _getPinTheme(
    BuildContext context, {
    required Size size,
  }) {
    return PinTheme(
      height: size.height,
      width: size.width,
      textStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff088F81).withOpacity(0.1),
        border: Border.all(color: const Color(0xff088F81).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(7.5),
      ),
    );
  }

  static const _focusScaleFactor = 1.15;

  @override
  Widget build(BuildContext context) {
    final size = _ContainerSize(context);
    final defaultPinTheme = _getPinTheme(context, size: size);

    return SizedBox(
      height: size.height * _focusScaleFactor,
      child: Pinput(
        obscureText: true,
        obscuringWidget: const Text(
          "*",
          style: TextStyle(
              color: Color(0xff088F81),
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),
        length: _length,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: size.height * _focusScaleFactor,
          width: size.width * _focusScaleFactor,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: const Color(0xff088F81)),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        onCompleted: widget.onSubmit,
        pinAnimationType: PinAnimationType.scale,
      ),
    );
  }
}
