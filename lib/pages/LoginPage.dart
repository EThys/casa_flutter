import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makao_test/pages/AccountTypePage.dart';
import 'package:makao_test/pages/HomePage.dart';
import 'package:makao_test/pages/RegisterPage.dart';
import 'package:makao_test/utils/Routes.dart';
import 'package:provider/provider.dart';

import '../controllers/AuthentificationCtrl.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
            child:Padding(
              padding:EdgeInsets.only(right: 24.0,top:90.0,left:24.0,bottom:24.0),
              child: Column(
                children: [
                  headerLogin(),
                  loginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey[400],
                        ),
                      ), SizedBox(width: 16),
                        Text("Ou avec", style: TextStyle(color: Colors.grey[700])), SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey[400],),
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("asset/google.png"),
                          ),
                        ),
                      ) ,SizedBox(width: 15,height: 90,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("asset/facebook.png"),
                          ),
                        ),
                      )

                    ],
                  )

                ],
              ),
            )
        ),
      ),
    );
  }
}

class loginForm extends StatefulWidget {
  const loginForm({super.key});

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  String? _usernameError;
  String? _passwordError;
  bool _obscureText = true;
  bool _hasMinLengthError = false;
  bool _hasUppercaseError = false;
  bool _hasLowercaseError = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String ? errorValidator =  "";

  Future<void> _submitForm() async {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _usernameError = null;
      _passwordError = null;
    });

    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        if (_usernameController.text.isEmpty) {
          _usernameError = "Le nom d'utilisateur est requis.";
        }
        if (_passwordController.text.isEmpty) {
          _passwordError = "Le mot de passe est requis.";
        }
      });
      return; // Arrêter l'exécution si des champs sont vides
    }
    if (!_isPasswordValid) {
      setState(() {
        _passwordError = "Le mot de passe ne respecte pas nos critères de sécurité.";
      });
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        );
      },
    );


    Map<String, dynamic> userData = {
      "username": _usernameController.text,
      "password": _passwordController.text,
    };
    var ctrl = context.read<AuthentificationCtrl>();
    var res = await ctrl.login(userData);

    // Fermer le dialogue de chargement
    Navigator.of(context).pop();

    if (res.success == true) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.thumb_up, color: Colors.white, size: 60),
                SizedBox(height: 20),
                Text(
                  "Connexion réussie !",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, Routes.homeRoute);
      });
    } else {
      _passwordController.clear();
      setState(() {
        if (res.data != null && res.data!['message'] != null) {
          String errorMessage = res.data!['message'];
          print("BABABABBABABBABABA: $errorMessage");

          if (errorMessage == "Utilisateur non valide") {
            _usernameError = errorMessage;
            _passwordError = null;
          } else if (errorMessage == "Mot de passe incorrecte") {
            _passwordError = errorMessage;
            _usernameError = null;
          } else {
            _usernameError = errorMessage;
            _passwordError = errorMessage;
          }
        }
      });
    }
  }

  void _PasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = value.isNotEmpty && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _hasMinLengthError = value.length < 6;
      _hasUppercaseError = !RegExp(r'[A-Z]').hasMatch(value);
      _hasLowercaseError = !RegExp(r'[a-z]').hasMatch(value);
      _isPasswordValid = !(_hasMinLengthError || _hasUppercaseError || _hasLowercaseError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            TextFormField(
              onSaved: (username) {
                // Password
              },
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Nom d'utilisateur",
                suffixIcon: Icon(Icons.person),
                    // ? (_isEmailValid
                    // ? Icon(Icons.check, color: Colors.green)
                    // : Icon(Icons.close, color: Colors.red))
                    // : null
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),errorText: _usernameError,
                errorStyle: GoogleFonts.lato(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 36),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password_outlined),
                labelText: "Mot de passe",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _PasswordVisibility,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),errorText: _passwordError,
                  errorStyle: GoogleFonts.lato(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  )
              ),
              onChanged: _validatePassword,
            ),
            if (_passwordController.text.isNotEmpty) ...[
              if (_hasMinLengthError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 16),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Le mot de passe doit contenir au moins 6 caractères.",
                          style: GoogleFonts.lato(
                            color: Colors.red,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],

            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Flexible(
                        child: Text(
                          "Se souvenir de moi",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mot de passe oublié",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Text("Se connecter", style: GoogleFonts.lato(fontSize: 15, color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.accountTypeRoute);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Text("Créer un compte", style: GoogleFonts.lato(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class headerLogin extends StatefulWidget {
  const headerLogin({super.key});

  @override
  State<headerLogin> createState() => _headerLoginState();
}

class _headerLoginState extends State<headerLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("Connectez-vous",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),), SizedBox(height: 8,),
            Text("Un monde de possibilités vous attend. Connectez-vous pour le découvrir", style: TextStyle(fontSize: 15, color: Colors.grey[700])),],
    );
  }
}


