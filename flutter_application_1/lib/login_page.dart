import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  String username;
  String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(0xFFB2EBF2),
              Color(0xFFCFD8DC),
              Color(0xFF4FC3F7),
              Color(0xFFCFD8DC),
              Color(0xFF80DEEA),
            ])),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(2),
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.black38,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _image(),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                              labelText: "KULLANICI ADI",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.account_circle),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Kullanıcı adınızı giriniz";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              username = value;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                              suffixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.remove_red_eye
                                    : Icons.security),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                              ),
                              labelText: "ŞİFRE",
                              border: OutlineInputBorder(),
                            ),
                            obscureText: _secureText,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Şifrenizi giriniz";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              password = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                child: Text("Üye ol"),
                                onPressed: () {},
                              ),
                              MaterialButton(
                                child: Text("Şifremi Unuttum"),
                                onPressed: () {},
                              )
                            ],
                          ),
                          _loginButton()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _loginButton() => RaisedButton(
        color: Color(0xFFE0F7FA),
        highlightColor: Colors.red,
        elevation: 10,
        child: Text("Giriş Yap"),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            if (username == "Hüseyin" && password == "123456") {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Giriş Başarılı"),
                    );
                  });
            } else {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("HATA"),
                      content: Text("Giriş Bilgileriniz Hatalı"),
                      actions: [
                        MaterialButton(
                            child: Text("Geri Dön"),
                            onPressed: () => Navigator.pop(context))
                      ],
                    );
                  });
            }
          }
        },
      );

  Widget _image() => Image(
      image: NetworkImage(
          "https://iz-bilisim.com/blog/wp-content/uploads/2018/01/oqtic-blog-banner.jpg"));
}
