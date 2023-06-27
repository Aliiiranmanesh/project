import 'package:flutter/material.dart';

class ObscureToggleButton extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  bool obscureText;

  ObscureToggleButton({
    required this.controller,
    super.key,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<ObscureToggleButton> createState() => _ObscureToggleButtonState();
}

class _ObscureToggleButtonState extends State<ObscureToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.right,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off),
              color: Colors.grey,
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[700],
              ),
            ),
            alignLabelWithHint: false,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            )),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
