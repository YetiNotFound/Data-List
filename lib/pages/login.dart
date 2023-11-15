import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:data_item/pages/data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
late Color myColor;
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

String? _emailError;
  String? _passwordError;

 String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
      return null; 
  }

  // Validator function for password field
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null; 
  }

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: AssetImage("assets/images/sunset.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(myColor, BlendMode.dstATop)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text("MY DATA APP",
                    style: myStyle.myTextStyle(),
                    ),
                      SizedBox(height: 20.0),
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: 280,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Login",
                              style:TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              )
                              ),
                              SizedBox(height:10.0),
                              TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Example: kuda@gaming.com',
                                errorText: _emailError,
                                ),
                              ),
                              SizedBox(height:10.0),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Use correct password',
                                errorText: _passwordError,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              MouseRegion(
                                onEnter: (_) => setState(() => isHovered = true),
                                onExit: (_) => setState(() => isHovered = false),
                                child: TextButton(
                                  onPressed: () {
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: isHovered ? Colors.blueAccent : Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height:20.0),
                              ElevatedButton(
                                onPressed: () {
                                  if (_validateEmail(_usernameController.text) == null &&
                                      _validatePassword(_passwordController.text) == null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProductListPage()),
                                    );
                                  } else {
                                    setState(() {
                                      _emailError = _validateEmail(_usernameController.text);
                                      _passwordError = _validatePassword(_passwordController.text);
                                    });
                                  }
                                },
                                child: Text("Login"),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
   
  }
}

class myStyle {
  static TextStyle myTextStyle({
  double fontSize = 25,
    FontWeight fontWeight = FontWeight.bold
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Color.fromRGBO(255, 255, 255, 0.6)
      ),
    );
  }
 

}