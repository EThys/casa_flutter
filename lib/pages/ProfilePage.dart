import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  Alignment _aligenment=Alignment.centerLeft;

  bool _isImagesSelected = true; // Initialise à vrai pour la sélection par défaut
  bool _isProfileSelected = false;

  void _moveContainer1() {
    setState(() {
      _isImagesSelected = true;
      _isProfileSelected = false;
    });
  }
  bool isExpanded = false;

  void _moveContainer() {
    setState(() {
      _isImagesSelected = false;
      _isProfileSelected = true;
    });
  }
  bool ispress=true;
  bool showProfile=true;
  void zoomProfile(){
    setState(() {
      showProfile=!showProfile;
    });
  }

  List<String> img=[
    "asset/lionel.jpeg",
    "asset/messi.jpeg",
    "asset/lionel.jpeg",
    "asset/messi.jpeg",
    "asset/lionel.jpeg",
    "asset/messi.jpeg",


  ];

  @override
  Widget build(BuildContext context) {
    var Hauteur=MediaQuery.of(context).size.height;
    var largeur=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset("asset/lionel.jpeg",fit: BoxFit.cover,height: 200,),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent,Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0,.2]
                )
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Hauteur *0.1,),

                    GestureDetector(
                      onTap: (){
                        print("${isExpanded}");
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.red,
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image.asset('asset/messi.jpeg')
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 47,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            child: CircleAvatar(
                              radius: 43,
                              backgroundImage: AssetImage("asset/messi.jpeg"),
                            ),
                          ),
                      ),
                    ),
                    SizedBox(height: Hauteur *0.001,),
                    Text('Ethberg Muzola',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                    Text('Commissionnaire',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Text("Publications    |",style: TextStyle(fontSize: 14,color: Colors.grey),),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text('5',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87
                                ),),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Text("Abonnés    |",style: TextStyle(fontSize: 14,color: Colors.grey),),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text('100',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87
                                ),),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Text("j'aime    ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text('0',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87
                                ),),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),SizedBox(height: Hauteur *0.01,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            ispress=!ispress;
                          });
                        },
                        child: ispress ? Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text("S'abonner",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,

                            ),textAlign: TextAlign.center,),
                          ),
                          height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.greenAccent,
                                  Colors.blueAccent
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft
                              )
                            ),
                        ) : Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text("Desabonner",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,

                            ),textAlign: TextAlign.center,),
                          ),
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.greenAccent,
                                    Colors.green,
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft
                              )
                          ),
                        )
                      ),
                    ),SizedBox(height: Hauteur *0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: _moveContainer1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 45,
                                    width: (MediaQuery.of(context).size.width - 120) / 2,
                                    decoration: BoxDecoration(
                                      color: _isImagesSelected ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image, size: 24, color: _isImagesSelected ? Colors.black : Colors.grey),
                                        SizedBox(width: 8),
                                        Text(
                                          "Images",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: _isImagesSelected ? Colors.black : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: _moveContainer,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 45,
                                    width: (MediaQuery.of(context).size.width - 120) / 2,
                                    decoration: BoxDecoration(
                                      color: _isProfileSelected ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.person, size: 24, color: _isProfileSelected ? Colors.black : Colors.grey),
                                        SizedBox(width: 8),
                                        Text(
                                          "Profil",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: _isProfileSelected ? Colors.black : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: SizedBox(
                        height: 350,
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                        child: Image.asset(img[index], fit: BoxFit.cover)),
                                  );
                                },
                                itemCount: img.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )



                  ]

                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
