import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:makao_test/model/OnBoardingModel.dart';


class OnBoardingPage extends StatefulWidget {
  int currentIndex=0;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:Colors.white,
        body:Stack(
            children:[
              CustomPaint(
                painter: ArcPaint(),
                child: SizedBox(
                  height: size.height /1.32,
                  width: size.width,
                ),
              ),
              Positioned(
                top: 100,right: 0,left: 0,
                child: Lottie.asset(OnBoardingItems[currentIndex].lottieURL,
                    width: 500,
                    alignment: Alignment.center
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:SizedBox(
                    height: 270,
                    child: Column(
                      children: [
                        Flexible(
                          child:PageView.builder(
                              itemCount: OnBoardingItems.length,
                              itemBuilder: (context,index){
                                final items=OnBoardingItems[index];
                                return Column(
                                  children:[
                                    /*Text(
                                      items.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black45
                                      ),
                                    ),*/
                                    SizedBox(height: 50,),
                                    Text(
                                      items.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Colors.black
                                      ),
                                    )
                                  ],
                                );
                              },
                              onPageChanged: (value){
                                setState(() {
                                  currentIndex=value;
                                });
                              }
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for(int index=0; index < OnBoardingItems.length;index++ )
                              dotIndicator(isSelected: index == currentIndex)
                          ],
                        ),
                        SizedBox(height: 50,)

                      ],),
                  )
              )
            ]
        )
    );
  }
  Widget dotIndicator({required bool isSelected}){
    return Padding(
      padding: EdgeInsets.only(right: 7),
      child: AnimatedContainer(
        duration: Duration(microseconds: 500),
        height: isSelected ? 8 :6,
        width: isSelected ? 8 :6,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.black :Colors.black26
        ),
      ),
    );
  }
}
class ArcPaint extends CustomPainter{
  @override
  void paint(Canvas canvas ,Size size){
    Path orangeArc= Path()
      ..moveTo(0, 0)
      ..lineTo(0,size.height -175)
      ..quadraticBezierTo(size.width/2, size.height, size.width, size.height -175)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(orangeArc, Paint()..color=Colors.orange);
    Path whiteArc= Path()
      ..moveTo(0, 0)
      ..lineTo(0,size.height -180)
      ..quadraticBezierTo(size.width/2, size.height-60, size.width, size.height -180)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(whiteArc, Paint()..color=const Color.fromARGB(255, 144, 202, 249));
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}

