
import 'package:flutter/material.dart';

class ReUsableTextfield extends StatelessWidget {
   ReUsableTextfield({
    super.key,
    required this.text,
    required this.obscure,
    required this.icon,
    this.isPassword = false,
  });
  final String text;
  final bool obscure;
  final IconData icon;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration:  InputDecoration(
        isDense: true,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword ? IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: (){},
        ): null,
        hintText: text,
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
