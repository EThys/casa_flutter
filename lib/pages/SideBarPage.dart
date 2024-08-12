import 'package:flutter/material.dart';

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Noel"),
              accountEmail: Text("eth"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                    "asset/lionel.jpeg",
                  width: 98,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "asset/lionel.jpeg",
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favories"),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Partager"),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text("Notifications"),
            onTap: ()=>null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 28,
                height: 28,
                child: Center(
                  child: Text(
                    "8",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Parametres"),
            onTap: ()=>null,
          ),

        ],
      ),
    );
  }
}
