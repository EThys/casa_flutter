import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
    );
  }
}

class loginForm extends StatefulWidget {
  const loginForm({super.key});

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  bool _isEmailValid = false;
  bool _obscureText = true;
  final _emailController = TextEditingController();

  void _PasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Adresse email",
                  suffixIcon: _isEmailValid
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.close, color: Colors.red),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)
                  )
                ),
                onChanged: _validateEmail,

              ),SizedBox(height: 36,),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    labelText: "Mot de passe",
                    suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),onPressed: _PasswordVisibility),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)
                    )
                ),
              ),SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                        children: [
                          Checkbox(value: true, onChanged: (value){}),
                          Flexible(child: Text("Se souvenir de moi",style: TextStyle(fontSize: 12)))
                        ]
                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text("Mot de passe oublié",style: TextStyle(fontSize: 12),))
                ],
              ),SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey),

                      ),
                    ),
                    child:Text("Connexion",style: TextStyle(fontSize: 15),)),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey),

                      ),
                    ),
                    child:Text("Créer un compte",style: TextStyle(fontSize: 15))),
              ),

            ],
          ),
        ));
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


