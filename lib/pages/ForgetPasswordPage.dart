import 'package:flutter/material.dart';


class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mot de passe oublié",style: TextStyle(fontSize:20 ),),
            SizedBox(height: 16,),
            Text("Paece que tout le monde peut oublier son mot de passe, n'ayez aucune crainte vous pouvez renitialiser votre mot de passe",style: TextStyle(fontSize:13,color: Colors.grey),),
            SizedBox(height: 32,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Mot de passe",
                prefixIcon: Icon(Icons.password_outlined)
              ),
            )
          ],
        ),
      ),
    );
  }
}
