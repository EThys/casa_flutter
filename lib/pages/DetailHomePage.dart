import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({super.key});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset("asset/maisonBrique.jpg"),
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
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 25),
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
                          Text(
                            "Belle villa avec une belle vue",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                          ),
                          SizedBox(height:10),
                          Text(
                            "Food piur vous",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                          ),
                          SizedBox(height:10),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage("asset/lionel.jpeg"),
                              ),SizedBox(width:5),
                              Text("Noel Muzola",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                              Spacer(),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.heart_broken_rounded,
                                  color: Colors.white ,
                                ),
                              ),
                              SizedBox(width:5),
                              Text("273 likes",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Divider(
                                  height: 4,
                                ),
                              ),
                              Text(
                                "Description",
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold) ,
                              )



                            ],
                          )
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
