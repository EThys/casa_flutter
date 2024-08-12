import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:EdgeInsets.only(right: 24.0,top:80.0,left:24.0,bottom:24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text("Créer un compte",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),), SizedBox(height: 8,),
              Text("Un monde de possibilités vous attend. Connectez-vous pour le découvrir", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
            SizedBox(height: 32,),
            Form(
              child: Column(
                children: [
                 Row(
                   children: [
                     Expanded(
                       child: TextFormField(
                         expands: false ,
                         decoration: InputDecoration(
                           labelText: ("Nom"),
                           prefixIcon: Icon(Icons.person),
                             border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent)
                            )
                         ),
                       ),
                     ),
                     SizedBox(height: 16,width: 14,),
                     Expanded(
                       child: TextFormField(
                         expands: false ,
                         decoration: InputDecoration(
                             labelText: ("Prénom"),
                             prefixIcon: Icon(Icons.person),
                             border: OutlineInputBorder(),
                             focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.blueAccent)
                             )
                         ),
                       ),
                     ),
                   ],
                 ), SizedBox(height: 16,),
                   Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           decoration: InputDecoration(
                               labelText: ("Adresse"),
                               prefixIcon: Icon(Icons.house_outlined),
                               border: OutlineInputBorder(),
                               focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.blueAccent)
                               )
                           ),
                         ),
                       ), SizedBox(height: 16,width: 14,),
                       Expanded(
                           child: TextFormField(
                             decoration: InputDecoration(
                                 labelText: ("Télephone"),
                                 prefixIcon: Icon(Icons.phone),
                                 border: OutlineInputBorder(),
                                 focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.blueAccent)
                                 )
                             ),
                           ),
                       )
                     ],
                   ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: ("Email"),
                        prefixIcon: Icon(Icons.email_outlined)
                    ),
                  ), SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: ("Mot de passe"),
                        prefixIcon: Icon(Icons.password_outlined)
                    ),
                  ), SizedBox(height: 16,),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(value:true,onChanged: (value){},),
                      ),SizedBox(height: 16,),
                      Flexible(
                        child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "J'accepte les conditions",style: TextStyle(color: Colors.blue,fontSize: 12))
                              ]
                            )
                        ),
                      )
                    ],
                  ),SizedBox(height: 32,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),// Rayon de bordure
                            side: BorderSide(color: Colors.grey),

                          ),
                        ),
                        child:Text("Inscription",style: TextStyle(fontSize: 15),)),
                  ),




                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
