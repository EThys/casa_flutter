import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makao_test/model/CategoryHomeModel.dart';
import 'package:makao_test/model/HomeModel.dart';
import 'package:makao_test/pages/DetailHomePage.dart';
import 'package:makao_test/pages/SideBarPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlide=0;
  bool _drawerOpen=false;
  void toggleDrawer() {
    setState(() {
      _drawerOpen = !_drawerOpen;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawerOpen ? SideBarPage() : null,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(toggleDrawer: toggleDrawer),
                SizedBox(height: 5,),
                SearchField(),
                SizedBox(height: 20,),
                Stack(
                  children: [
                    SizedBox(
                      height: 160,
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                    image: AssetImage("asset/slider.jpg")
                                )
                              ),
                            );
                          }
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Align(
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
                    )
                  ],
                ),
                SizedBox(height: 5,),
                SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: (){},
                                      icon: Icon(categories[index].icon, size: 25,),
                                    )),
                                ),
                              ),
                              Text(categories[index].title,style: TextStyle(fontSize: 12),)
                            ],
                          );
                        },
                        separatorBuilder: (context,index)=>const SizedBox(width: 5,),
                        itemCount: categories.length
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Specialement pour toi",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text("Voir tout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                   GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: homes.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> DetailHomePage()));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 250,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFD3D3D3),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    homes[index].imageUrl,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 100,
                                  ),
                                  Text(homes[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${homes[index].price}\$",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            homes[index].city,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),


                          ],
                        ),
                      );
                    },
          
                  ),
              ],
          
            )
          ),
        ),

      )
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex:4,
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )

              ),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 4
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon:Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      )
                  ),
                  Container(
                    height: 25,
                    width: 1.5,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10,),
                  Flexible(
                    flex: 4,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Recherche...",
                          border: InputBorder.none,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
              ),
              child:  IconButton(
                  onPressed: (){},
                  icon:Icon(
                    Icons.sort,
                    color: Colors.white,
                  )
              )

            ),
          )
        ],
      ),

    );
  }
}

class HomeAppBar extends StatefulWidget {

  final VoidCallback toggleDrawer;

  HomeAppBar({required this.toggleDrawer});
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String selectedCountry = '';

  final List<String> countries = ['Kinshasa', 'Kalamu', 'Gombe', 'Matete', 'Lemba','Bandal','Ngaliema','Kitambo','Kinseso','Masina','Bumbu'];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: widget.toggleDrawer,
                style: IconButton.styleFrom(
                    backgroundColor: Colors.white10,
                    padding: EdgeInsets.all(15)
                ),
                iconSize: 25,
                icon: Icon(Icons.menu)
            ),
          ],
        ),
        Row(
          children: [
            Text(
              selectedCountry,
              style: TextStyle(fontSize: 16.0),
            ),
            PopupMenuButton<String>(
              onSelected: (String newValue) {
                setState(() {
                  selectedCountry = newValue;
                });
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              itemBuilder: (BuildContext context) => [
                for (String country in countries)
                  PopupMenuItem(
                    value: country,
                    child: Text(country),
                  ),
              ],
            ),
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: (){},
            style: IconButton.styleFrom(
                backgroundColor: Colors.white10,
                padding: EdgeInsets.all(15)
            ),
            iconSize: 25,
            icon: Icon(Icons.notifications_outlined ,color: Colors.black,)
        )
      ],
    );
  }
}



