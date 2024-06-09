import 'package:final_projesi/Screens/CartPage.dart';
import 'package:final_projesi/Screens/HomePage.dart';
import 'package:final_projesi/Screens/LoginScreen.dart';
import 'package:final_projesi/Screens/ProfileScreen.dart';
import 'package:final_projesi/Screens/communication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text(
                "Lezzet Sarayı",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "ogrenci@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/resim1.jpg"),
              ),
            ),
          ),

          // List Tile
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ); 
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.book,
                color: Colors.red,
              ),
              title: Text(
                "Menü",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // List Tile
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.cart_fill,
                  color: Colors.red,
                ),
                title: Text(
                  "Sepetim",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


          // List Tile
          ListTile(
            leading: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            ),
            title: Text(
              "Beğenilerim",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // List Tile
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()), // ProfilScreen yerine kendi profil ekranınızın adını kullanın
              );
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.red,
              ),
              title: Text(
                "Profil Ekranı",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // List Tile
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IletisimScreen()), // İletişimScreen yerine kendi iletişim ekranınızın adını kullanın
              );
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.red,
              ),
              title: Text(
                "İletişim Ekranı",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // List Tile
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.login,
                color: Colors.red,
              ),
              title: Text(
                "Login Ekranı",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
