import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _obscureTextNotifier.value = widget.obscureText;
    super.initState();
  }

  toggleObscureText() {
    _obscureTextNotifier.value = !_obscureTextNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, obscureText, child) {
        return TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, size: 20) : null,
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: toggleObscureText,
                    icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                  )
                : null,
          ),
          obscureText: obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      },
    );
  }
}
