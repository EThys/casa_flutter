import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:makao_test/pages/PreferencePage.dart';
import 'package:makao_test/utils/Routes.dart';
import 'package:provider/provider.dart';

import '../controllers/AuthentificationCtrl.dart';

class RegisterPage extends StatefulWidget {
  final int ? accountTypeId;
  const RegisterPage({Key? key,  this.accountTypeId}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();
  final _accountTypeController = TextEditingController();


  @override
  void initState() {
    super.initState();
    if (widget.accountTypeId != null) {
      _accountTypeController.text = widget.accountTypeId.toString();
    }
  }
  int _currentStep = 0;
  final List<String> genderItems = [
    'Masculin',
    'Féminin',
  ];
  // Variables pour la sélection des attentes
  String? _selectedType;
  double _budgetMax = 1000;
  List<String> _equipements = ['Jardin', 'Piscine', 'Garage'];
  List<bool> _selectedEquipements = [false, false, false];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _nomFamilleController = TextEditingController();
  final _usernameController = TextEditingController();
  final _prenomController = TextEditingController();
  final _genreController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _imageProfilController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _selectedGender;
  // Validation flags
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _obscureText = true;
  bool _hasMinLengthError = false;
  bool _hasUppercaseError = false;
  bool _hasLowercaseError = false;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: Duration(milliseconds: 700), curve: Curves.easeInQuart,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        print("object${widget.accountTypeId}");
        _currentStep--;
      });
      _pageController.previousPage(
        duration: Duration(milliseconds: 700), curve: Curves.easeInQuart
      );
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
  Future<void> _submitForm() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    Map<String, dynamic> userData = {
      "username":_usernameController.text,
      "nom_famille": _nomFamilleController.text,
      "prenom": _prenomController.text,
      "genre": _selectedGender,
      "telephone":_telephoneController.text,
      "password": _passwordController.text,
      "date_naissance":_dateNaissanceController.text,
      "email": _emailController.text,
      "user_type_id": _accountTypeController.text,
    };
    var ctrl = context.read<AuthentificationCtrl>();
    print("Voici les donnees $userData");
    var res = await ctrl.register(userData);
    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context).pop();

    print("MAMADOUUUUU ${res.success}");
    print("MAMADOUUUUU ${res.success.runtimeType}");

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
                  "Inscription réussie !",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, Routes.preferenceRoute);
      });
    } else {
      _passwordController.clear();

      setState(() {

      });


    }
  }

  Widget _buildPersonalInfoStep() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: OverflowBar(
            spacing: 5,
            overflowSpacing: 5,
            overflowAlignment: OverflowBarAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: _nomFamilleController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Nom de famille",
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  TextFormField(
                    controller: _prenomController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Prenom",
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  TextFormField(
                    controller: _usernameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Nom d'utilisateur",
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: const Text(
                      'Selectionnez votre genre',
                      style: TextStyle(fontSize: 15),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Votre genre est requis.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                        print("ethberggggggggggggggggg${_selectedGender}");
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoStep() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Adresse email",
                  suffixIcon: (_emailController.text.isNotEmpty)
                      ? (_isEmailValid ? Icon(Icons.check, color: Colors.green) : Icon(Icons.close, color: Colors.red))
                      : null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _validateEmail,
              ),
              SizedBox(height: 18),
              TextFormField(
                controller: _dateNaissanceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        // Format the date to display in the TextFormField
                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                        _dateNaissanceController.text = formattedDate;
                      }
                    },
                  ),
                  labelText: "Date de naissance",
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                readOnly: true,
              ),
              SizedBox(height: 18),
              TextFormField(
                controller: _telephoneController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Téléphone",
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Mot de passe",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: _PasswordVisibility,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _validatePassword,
              ),
              if (_passwordController.text.isNotEmpty) ...[
                if (_hasMinLengthError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
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
                // if (_hasUppercaseError)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8.0),
                //     child:Text(
                //       "Le mot de passe doit contenir au moins une majuscule.",
                //       style: GoogleFonts.lato(
                //         color: Colors.red,
                //         fontSize: 12,
                //         fontStyle: FontStyle.italic,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // if (_hasLowercaseError)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8.0),
                //     child:Text(
                //       "Le mot de passe doit contenir au moins une minuscule.",
                //       style: GoogleFonts.lato(
                //         color: Colors.red,
                //         fontSize: 12,
                //         fontStyle: FontStyle.italic,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
              ],
              Visibility(
                visible: false, // Mettre à true pour afficher le champ
                child: TextFormField(
                  controller: _accountTypeController,
                  enabled: false, // Rendre le champ en lecture seule
                  decoration: InputDecoration(
                    labelText: "Account Type ID ${_accountTypeController.text}",
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfoStep() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Mot de passe",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: _PasswordVisibility,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _validatePassword,
              ),
              if (_passwordController.text.isNotEmpty) ...[
                if (_hasMinLengthError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Le mot de passe doit contenir au moins 8 caractères.",
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (_hasUppercaseError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child:Text(
                      "Le mot de passe doit contenir au moins une majuscule.",
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (_hasLowercaseError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child:Text(
                      "Le mot de passe doit contenir au moins une minuscule.",
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
              SizedBox(height:
              18),
              TextFormField(
                controller:
                _confirmPasswordController,
                obscureText:
                true,
                decoration:
                InputDecoration(prefixIcon:
                Icon(Icons.lock), labelText:
                "Confirmer le mot de passe",
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), onChanged:
                  (value) {
                // You can add confirmation validation here
              },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(padding:
      const EdgeInsets.all(20.0), child:
      OverflowBar(
        children: [
          Column(children:[
            SizedBox(height: 50),
            Text("Inscrivez-vous",
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue), textAlign: TextAlign.start
            ),
            SizedBox(height: 20),
            Text("Nous avons besoin de ces informations pour créer un profil qui vous rend unique sur notre plateforme.\n\nMerci de prendre un moment pour remplir ce formulaire d'inscription.",
                style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.black
                )),
            SizedBox(height: 30),
            Expanded(
              child: PageView.builder(
                controller:_pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder:(context,index)=> index==0?_buildPersonalInfoStep():index==1?_buildContactInfoStep():_buildAccountInfoStep(),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
              if(_currentStep>0)
                ElevatedButton(
                   onPressed: _previousStep,
                   style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                     backgroundColor: Colors.blue,
                ),
                child: Text("Précédent",style: GoogleFonts.lato(fontSize: 14,color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep == 1) {
                      _submitForm();
                    } else {
                      _nextStep();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    _currentStep == 1 ? "Terminer" : "Suivant",
                    style: GoogleFonts.lato(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],),SizedBox(height:25),
          ],
          ),
        ],
      ),),
    );
  }
}