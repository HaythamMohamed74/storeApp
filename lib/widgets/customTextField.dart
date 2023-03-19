import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final  ValueChanged<String>? onChanged;
  TextInputType? keyboardType;

   CustomTextField({
    Key? key,
     this.keyboardType,
     this.labelText,
     this.hintText,
     this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:keyboardType ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
            color: Colors.blueAccent,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      onChanged: onChanged,
    );
  }
}
