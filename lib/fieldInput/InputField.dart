


import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key,

    required this .fieldController ,
    required this.label ,
    this.obscurePasswordText = false,
    required this.preFixIcon ,
    this.validator
  });
  // الخواص المختلفة في التصميم
  final String label ;
  final bool obscurePasswordText ;
  final TextEditingController fieldController ;
  final IconData preFixIcon  ;
  final String? Function(String?)? validator ;

  @override
  Widget build(BuildContext context) {
    return
      TextFormField
      (
        controller: fieldController ,
        obscureText: obscurePasswordText,
      validator: validator,
      decoration: InputDecoration
        (
        prefixIcon: Icon(preFixIcon),
          label: Text(label),
          border: OutlineInputBorder()
      ),);
  }
}