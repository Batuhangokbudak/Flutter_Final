import 'package:flutter/material.dart';
import 'package:final_projesi/Screens/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadSavedUsername();
    _loadThemeMode();
  }

  _loadSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');

    if (savedUsername != null && savedUsername.isNotEmpty) {
      _usernameController.text = savedUsername;
    }
  }

  _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool('is_dark_mode');

    if (isDarkMode != null) {
      setState(() {
        _isDarkMode = isDarkMode;
      });
    }
  }

  _toggleThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      prefs.setBool('is_dark_mode', _isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_isDarkMode
                                  ? 'assets/images/background_dark.png'
                                  : 'assets/images/background.png'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_isDarkMode
                                  ? 'assets/images/background-2_dark.png'
                                  : 'assets/images/background-2.png'),
                              fit: BoxFit.fill)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isDarkMode ? Colors.grey[800] : Colors.white,
                        border: Border.all(
                            color: _isDarkMode
                                ? Colors.grey[600]!
                                : Color.fromRGBO(196, 135, 198, .3)),
                        boxShadow: [
                          BoxShadow(
                            color: _isDarkMode
                                ? Colors.grey[900]!
                                : Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: _isDarkMode
                                          ? Colors.grey[600]!
                                          : Color.fromRGBO(
                                              196, 135, 198, .3)))),
                          child: TextField(
                            controller: _usernameController,
                            onChanged: (value) {
                              _saveUsername();
                            },
                            style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color: _isDarkMode
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade700)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: _isDarkMode
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade700)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: _isDarkMode
                                ? Colors.grey[400]
                                : Color.fromRGBO(196, 135, 198, 1)),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()),
                      );
                    },
                    color: _isDarkMode
                        ? Colors.white
                        : Color.fromRGBO(49, 39, 79, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: _isDarkMode ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: _isDarkMode
                                ? Colors.grey.shade400
                                : Color.fromRGBO(49, 39, 79, .6)),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isDarkMode ? 'Dark Mode' : 'Light Mode',
                        style: TextStyle(
                            color: _isDarkMode ? Colors.white : Colors.black),
                      ),
                      Switch(
                        value: _isDarkMode,
                        onChanged: (value) {
                          _toggleThemeMode();
                        },
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
