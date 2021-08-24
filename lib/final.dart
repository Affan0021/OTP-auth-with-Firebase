import 'package:flutter/material.dart';


class Final extends StatefulWidget {
  const Final({Key? key}) : super(key: key);


  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
        child: Stack(
        //      Column(
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(20,400, 0, 0),
            child: Text(
              'Ban jau ga na Freelancer ?',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),



            )


          )






]
    )

)
    );
        }
}
