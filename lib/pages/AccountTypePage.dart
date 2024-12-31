import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makao_test/pages/RegisterPage.dart';
import 'package:makao_test/utils/Routes.dart';

class AccountTypePage extends StatefulWidget {
  const AccountTypePage({Key? key}) : super(key: key);

  @override
  State<AccountTypePage> createState() => _AccountTypePageState();
}

class _AccountTypePageState extends State<AccountTypePage> {
  bool isVolunteerSelected = true;
  final List<Map<String, dynamic>> accountTypes = [
    {
      "id": 3,
      "title": "Commissionnaire",
      "description": "Vous aidez à mettre en relation les bailleurs et les locataires.",
      "imagePath": "asset/bailleur.jpg",
    },
    {
      "id": 2,
      "title": "Bailleur",
      "description": "Vous proposez un bien à louer.",
      "imagePath": "asset/commi.jpg",
    },
    {
      "id": 4,
      "title": "Locataire",
      "description": "Vous recherchez une maison à louer.",
      "imagePath": "asset/locataire.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Choisissez un type de compte",
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Sélectionnez le type de compte qui vous convient le mieux.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...accountTypes.map((type) => Column(
                children: [
                  _buildAccountTypeOption(
                    id: type['id'],
                    title: type['title'],
                    description: type['description'],
                    imagePath: type['imagePath'],
                  ),
                  SizedBox(height: 20),
                ],
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildAccountTypeOption({required int id,required String title, required String description, required String imagePath}) {

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.signUpRoute,arguments: id );
        print("$title $id sélectionné");
      },
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(255, 144, 202, 249),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 14,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(12.0),
              ),
                child: Image.asset(
                  imagePath,
                  height: 96,
                  width: 85,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 3),
                      Text(description, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}