import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kanban')),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/Florida_Tuskers_logo.svg.png',
                        height: 180,
                      ),
                      AuthCard(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: _authMode == AuthMode.Signup ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(100)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  onSaved: (value) {
                    value == null ? () {} : _authData['email'] = value;
                    //  TODO(Changing something with (){});
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(100)),
                    ),
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (String? value) {
                    return (value != null && value.length < 5)
                        ? 'assword is too short!'
                        : null;
                  },
                  onSaved: (value) {
                    value == null ? () {} : _authData['password'] = value;
                    //  TODO(Changing something with (){});
                  },
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                      child: Text(
                          _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                      onPressed: () {},
                      // _submit,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
