
import 'dart:async';

import 'package:flutter/material.dart';
import 'search.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:international_phone_input/international_phone_input.dart';

void main()
{

  runApp(MaterialApp(
    home: Gumaan(),
  ));


}
class  Gumaan extends StatefulWidget {

  @override

  GumaanState createState() => GumaanState();
}

class GumaanState extends State< Gumaan> {

  TextEditingController _emailTEC = TextEditingController();
  //var _email;
var phone;
  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phone =internationalizedPhoneNumber;
      print(phone);


    });
  }

  Widget build(BuildContext context)
  {


    return Scaffold(

        body: SingleChildScrollView(
            child: Stack(
              //      Column(
                children: [



                  // Container(
                  //   margin: EdgeInsets.fromLTRB(20, 300, 0, 0),
                  //   child: TextField(
                  //     // obscureText: true,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 20,
                  //       fontFamily: 'OpenSans',
                  //     ),
                  //     controller: _emailTEC,
                  //     //   keyboardType: TextInputType.emailAddress,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       contentPadding: EdgeInsets.only(top: 14.0),
                  //       // prefixIcon: Icon(
                  //       //   Icons.lock,
                  //       //   color: Colors.white,
                  //       // ),
                  //       hintText: 'Enter your Phone number ',
                  //       hintStyle: TextStyle(
                  //         color: Colors.white, // <-- Change this
                  //         fontSize: null,
                  //         fontWeight: FontWeight.w400,
                  //         fontStyle: FontStyle.normal,
                  //       ),
                  //     ),
                  //
                  //        maxLength: 10,
                  //        keyboardType: TextInputType.number,
                  //        // controller: _controller,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.blueAccent,
                  //       width: 5,
                  //     ),
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: const Color(0xff7cb1b6),
                  //   ),
                  // ),
                  //

                  // SizedBox(
                  //   height: 100,
                  // ),
                  Container(

                    margin:EdgeInsets.fromLTRB(10, 200, 0, 0),

                    child : InternationalPhoneInput(

                       decoration: InputDecoration.collapsed(hintText: 'Enter your number'),
                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: phone,
                      initialSelection: 'PAK',
                      enabledCountries: ['+92', '+1', '+91' , '90'],
                      showCountryCodes: true
                  ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(20, 380, 0, 0),
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        // var _email = _emailTEC.text;
                        //  print(_email);

                        //   Search();

                        // title: _email
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Search(  title: phone,)),
                            );



                      },
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),





                ]
            )
        )
    );




  }
}