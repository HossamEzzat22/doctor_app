import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {

  final String labelText;
  final bool isPassword;
  final TextEditingController controller;


  MyTextField({required this.labelText,required this.isPassword,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  obscureText:isPassword ,
                    controller:controller ,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: labelText,
                    )
                ),
              ),
            ),
          ]
      ),
    );
  }
}
