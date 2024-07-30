import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/pages/first.dart';



class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // User? _user;

  // @override 
  // void initstate(){
  //   super.initState();
  //   _auth.authStateChanges().listen((event){
  //     setState((){
  //       _user = event;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/hero.png',
                  height: 320,
                  // fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 20), // Adds 20 pixels of vertical spacing
              const Center(
                child: Text(
                  "Budget Tracking",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10), // Adds 20 pixels of vertical spacing
              Center(
                child: Text(
                  "Digitally control and manage you spend automatically",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10), // Adds 20 pixels of vertical spacing
              ElevatedButton.icon(
                onPressed: () {
                  // _handleGoogleSignIn();
                  signInWithGoogle(context);
                },
                icon: Image.asset('assets/images/google.png',
                    height: 32, width: 32),
                label: const Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black.withOpacity(0.125)),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Adds 20 pixels of vertical spacing
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/home'); // Replace '/home' with your actual route
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Want to skip sign up? ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "Click here",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

signInWithGoogle(BuildContext context) async {
  // try {
  //   GoogleSignIn googleSignIn = GoogleSignIn();

  //   // Sign out from Google to force account selection every time
  //   await googleSignIn.signOut();

  //   // Attempt to sign in
  //   GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //   if (googleUser != null) {
  //     GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

  //     AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  //     String? userName = userCredential.user?.displayName;

  //     print(userCredential);
  //     print(userName);

  //     if (userCredential.user != null) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomePage(user: userName), // Make sure to pass userName to HomePage
  //         ),
  //       );
  //     }
  //   } else {
  //     // Handle sign-in failure here if needed
  //     print("Google sign-in was cancelled or failed.");
  //   }
  // } catch (error) {
  //   print("Error during Google sign-in: $error");
  // }




  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  
  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken
  );
  
  UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  // print(userCredential);
  // print(userCredential.user?.displayName);

  String? userName = userCredential.user?.displayName;

  if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(userName: userName),
          ),
        );
      }
}

// signInWithGoogle(BuildContext context) async {
//   try {
//     GoogleSignIn googleSignIn = GoogleSignIn();

//     // Attempt to sign in
//     GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     if (googleUser != null) {
//       GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

//       AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // String? userName = userCredential.user?.displayName;

//       print(userName);

      // if (userCredential.user != null) {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Home(userName: userName),
      //     ),
      //   );
      // }
//     } else {
//       // Handle sign-in failure here if needed
//       print("Google sign-in was cancelled or failed.");
//     }
//   } catch (error) {
//     print("Error during Google sign-in: $error");
//   }
// }


}