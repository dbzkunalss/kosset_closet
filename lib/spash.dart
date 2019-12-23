import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kosset_closet/login_screen.dart';
//import 'package:kosset_closet/number_of_days.dart';
import 'constants/color.dart';
import 'homescreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 @override
  initState() {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
              if (currentUser == null)
                {Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()))}
              else
                {
                  print(currentUser.uid),
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()))
                }
            })
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
      
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kosset",
                style: TextStyle(
                    color: pinkColorShadow,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w900,
                    fontSize: 75),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: CircularProgressIndicator(
                  // backgroundColor: pinkColorShadow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() => runApp(AnimatedContainerApp());

// class AnimatedContainerApp extends StatefulWidget {
//   @override
//   _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
// }

// class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
//   // Define the various properties with default values. Update these properties
//   // when the user taps a FloatingActionButton.
//   double _width = 50;
//   double _height = 50;
//   Color _color = Colors.green;
//   BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('AnimatedContainer Demo'),
//         ),
//         body: Center(
//           child: AnimatedContainer(

//             // Use the properties stored in the State class.
//             width: _width,
//             height: _height,
//             decoration: BoxDecoration(
//               color: _color,
//               borderRadius: _borderRadius,
//             ),
//             // Define how long the animation should take.
//             duration: Duration(seconds: 1),
//             // Provide an optional curve to make the animation feel smoother.
//             curve: Curves.fastOutSlowIn,
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.play_arrow),
//           // When the user taps the button
//           onPressed: () {
//             // Use setState to rebuild the widget with new values.
//             setState(() {
//               // Create a random number generator.
//               final random = Random();

//               // Generate a random width and height.
//               _width = random.nextInt(300).toDouble();
//               _height = random.nextInt(300).toDouble();

//               // Generate a random color.
//               _color = Color.fromRGBO(
//                 random.nextInt(256),
//                 random.nextInt(256),
//                 random.nextInt(256),
//                 1,
//               );

//               // Generate a random border radius.
//               _borderRadius =
//                   BorderRadius.circular(random.nextInt(100).toDouble());
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
