
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'final.dart';
// import 'package:country_code_picker/country_code_picker.dart';


class Search extends StatefulWidget {

  var title , code;
  Search({ this.title  });


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  var _verificationCode;


  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );


  Widget build(BuildContext context) {
    //  var widget;

    return Scaffold(
        key: _scaffoldkey,
        body: SingleChildScrollView(
            child: Stack(
              //      Column(
                children: [

                  Container(
                    padding: const EdgeInsets.fromLTRB(80, 400, 0, 0),

                    child: Text(
                      '${widget.title}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'OpenSans',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 100, 0, 0),
                    child: PinPut(
                      fieldsCount: 6,
                      withCursor: true,
                      textStyle: const TextStyle(
                          fontSize: 25.0, color: Colors.white),
                      eachFieldWidth: 40.0,
                      eachFieldHeight: 55.0,
                      // onSubmit: (String pin) => _showSnackBar(pin),
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.fade,
                      onSubmit: (pin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Final()),
                                      (route) => false);
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          _scaffoldkey.currentState!
                              .showBottomSheet((context) => Container(
                            color: Colors.red,
                            child : Text('wrong code'),
                          ));
                        }
                      },
                    ),


                    ),


                ]

            )
        )

    );
  }



  _verifyPhone() async
  {
    await FirebaseAuth.instance.verifyPhoneNumber(

        phoneNumber: '${widget.title}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Final()),
                      (route) => false);
            }
            else
              {
                print('not logged in');
              }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }


void initState() {
  // TODO: implement initState
  super.initState();
  _verifyPhone();
}

}
