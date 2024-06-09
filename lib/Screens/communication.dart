import 'package:flutter/material.dart';
import 'package:final_projesi/Screens/LoginScreen.dart';
import 'package:final_projesi/Screens/ProfileScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IletisimScreen extends StatelessWidget {
  String telefonNumarasi = '555-555-555-55';
  String emailAdresi = 'ogrenci@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Gece ve gündüz modları için temaları belirleyin
      data: Theme.of(context).copyWith(
        brightness: Brightness.light, // varsayılan olarak gündüz modu
        // Gece modu için renkler
        // primaryColor: Colors.black,
        // backgroundColor: Colors.grey[900],
        // cardColor: Colors.black,
        // iconTheme: IconThemeData(color: Colors.white),
        // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('İletişim Ekranı'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/images/resim1.jpg'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Example',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Biyografi: Flutter geliştirici ve meraklı bir öğrenci. Her gün yeni şeyler öğrenmeye çalışıyorum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: Colors.blue,
              ),
              SizedBox(height: 16.0),
              Text(
                'İletişim Bilgileri',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Telefon Numarası: $telefonNumarasi'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('E-mail: $emailAdresi'),
              ),
              SizedBox(height: 16.0),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: Colors.blue,
              ),
              SizedBox(height: 16.0),
              Text(
                'Sosyal Medya',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaButton(
                      icon: FontAwesomeIcons.instagram, color: Colors.pink),
                  SocialMediaButton(
                      icon: FontAwesomeIcons.twitter, color: Colors.lightBlue),
                  SocialMediaButton(
                      icon: FontAwesomeIcons.github, color: Colors.black),
                  SocialMediaButton(
                      icon: FontAwesomeIcons.facebook, color: Colors.blue),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/resim1.jpg'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Kullanıcı Adı',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Profile Ekranı'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context); // Drawer'ı kapat
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Login Ekranı'),
                leading: Icon(Icons.login),
                onTap: () {
                  Navigator.pop(context); // Drawer'ı kapat
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              // Diğer drawer öğelerini ekleyebilirsiniz.
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  SocialMediaButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.0,
      backgroundColor: color,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
