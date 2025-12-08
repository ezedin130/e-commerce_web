
import 'package:flutter/material.dart';

class ReUsableTextfield extends StatefulWidget {
   ReUsableTextfield({
    super.key,
    required this.text,
    required this.obscure,
    required this.icon,
     required this.controller,
     this.maxLines,
    this.isPassword = false,
  });
  final String text;
   bool obscure;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLines;


  @override
  State<ReUsableTextfield> createState() => _ReUsableTextfieldState();
}

class _ReUsableTextfieldState extends State<ReUsableTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      obscureText: widget.obscure,
      controller: widget.controller,
      decoration:  InputDecoration(
        isDense: true,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            widget.obscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              widget.obscure = !widget.obscure;
            });
          },
        )
            : null,
        hintText: widget.text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
    );
  }
}
