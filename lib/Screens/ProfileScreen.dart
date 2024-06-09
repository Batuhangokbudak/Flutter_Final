import 'package:flutter/material.dart';
import 'package:final_projesi/Screens/communication.dart';
import 'package:final_projesi/Screens/LoginScreen.dart';
import 'package:final_projesi/Screens/HomePage.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? 'User Profile' : 'Kullanici Profili'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              setState(() {
                isEnglish = !isEnglish;
              });
            },
          ),
        ],
      ),
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName:
                  Text(isEnglish ? 'LezzetSarayı.com' : 'LezzetSarayı.com'),
              accountEmail:
                  Text(isEnglish ? 'student@gmail.com' : 'ogrenci@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 60.0,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/resim1.jpg',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text(isEnglish ? 'Menu' : 'Menü'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapattık
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(isEnglish ? 'Contact' : 'İletişim'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IletisimScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.login),
              title: Text(isEnglish ? 'Login Screen' : 'Giriş Ekranı'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    ); // Burada eksik parantezi ekledik
  }
}
