import 'package:flutter/material.dart';

class InputFieldPrimary extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  const InputFieldPrimary({
    Key? key,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputFieldPrimary> createState() => _InputFieldPrimaryState();
}

class _InputFieldPrimaryState extends State<InputFieldPrimary> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
