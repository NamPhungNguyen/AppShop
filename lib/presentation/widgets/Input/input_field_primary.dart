import 'package:flutter/material.dart';

class InputFieldPrimary extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;
  final Icon icon;

  const InputFieldPrimary({
    super.key,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
    required this.icon,
  });

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
        prefixIcon: widget.icon,
        hintText: widget.labelText,
        border: const OutlineInputBorder(),
        fillColor: const Color(0xFFF3F3F3),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.5
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          borderSide: const BorderSide(
            color: Colors.red, // Set border color when focused and there is an error
            width: 2, // Set border thickness
          ),
        ),
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
