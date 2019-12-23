import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

TextFormField textfield(String hint, Icon icon,
    {bool obt: false, TextInputType keyboard: TextInputType.emailAddress, Function validator, TextEditingController cnt, Widget suffix }){
  return TextFormField(
      obscureText: obt,
      keyboardType: keyboard,
      style: TextStyle(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: pinkColor)),
        hintText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey),
        prefixIcon: icon,
        suffix: suffix,
      ),validator: validator,controller: cnt,);
}

// Padding otpBoxThing(TextEditingController textController, bool enabler) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 30),
//     child: Container(
//         width: 50,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: Color.fromARGB(56, 225, 225, 225),
//             borderRadius: BorderRadius.circular(4.0)),
//         child: TextField(
//           keyboardType: TextInputType.phone,
//           inputFormatters: [
//             LengthLimitingTextInputFormatter(1),
//           ],
//           enabled: enabler,
//           controller: textController,
//           onChanged: (text){
//             if(text.length > 0){
              
//             }
//           },
//           autofocus: false,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 24.0, color: Colors.white),
//         )),
//   );
// }
