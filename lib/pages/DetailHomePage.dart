import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({super.key});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  int currentSlide=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  width:double.infinity,
                  child: PageView.builder(
                      onPageChanged: (value){
                        setState(() {
                          currentSlide=value;
                        });
                      },
                      itemCount: 4,
                      itemBuilder: (context,index){
                        return Container(
                          height: 170,
                          width: double.infinity,
                          child: Image.asset(
                            "asset/MaisonDesign.jpg",
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            4,
                                (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: currentSlide==index ? 15 : 8,
                              height: 8,
                              margin: EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:currentSlide  == index ? Colors.black :Colors.transparent,
                                  border: Border.all(color: Colors.black)
                              ),
                            )
                        ),
                      )
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.6,0.8],
                      colors: [
                        Colors.black.withOpacity(0.9), // Change opacity as needed
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "BELLE VILLA AVEC UNE BELLE VUE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "LINGWALA,AV DE LA PAIX,N7",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      padding: EdgeInsets.only(top: 1.0,right: 8.0,bottom: 8.0,left: 8.0),
                      child: Text(
                        "500\$/Mois",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                  maxChildSize: 1.0,
                  minChildSize: 0.6,
                  builder: (context,scrollController){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 5,
                                  width: 35,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.bed_outlined,color: Colors.amber,)),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    "2 chambres",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.weekend,color: Colors.amber,)),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    "1 salon",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.shower,color: Colors.amber,)),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    "2 Douches",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text("Description", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Text("Nichée au cœur d'un quartier paisible, cette maison moderne allie élégance et confort. Avec ses grandes fenêtres, elle baigne dans la lumière naturelle, offrant une vue imprenable sur le jardin paysager",
                              style: TextStyle(fontSize: 12,color: Colors.grey)),
                          SizedBox(height:8),
                          Text("Gallerie", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width:100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                        image: AssetImage("asset/MaisonDesign.jpg"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              Container(
                                height: 80,
                                width:100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                        image: AssetImage("asset/MaisonDesign.jpg"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              Container(
                                height: 80,
                                width:100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                        image: AssetImage("asset/MaisonDesign.jpg"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 13,),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage("asset/lionel.jpeg"),
                              ),SizedBox(width:10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // Aligne le texte à gauche
                                children: [
                                  Text(
                                    "Noel Muzola",
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Commissionnaire", // Texte en dessous
                                    style: TextStyle(fontSize: 12, color: Colors.grey), // Style du texte
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent
                                ),
                                child: Center(child: Text("Visiter la maison",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white))),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Text("Commodites de la maison",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.directions_car_filled,color: Colors.amber,size: 20,)),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    "Parking",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.ac_unit,color: Colors.amber,size: 20,)),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    "Climatisation",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.water_drop_outlined,color: Colors.amber,size: 20,)),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    "Eau",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.flash_on_outlined,color: Colors.amber,size: 20,)),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    "Courant",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );

                  }
              )
            ],
          )
        )
    );
  }
}
