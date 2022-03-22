// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tcc/screens/glassmorphism.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;

  // ignore: unused_field
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    setState(() => _isLoading = true);
    _formKey.currentState?.save();

    if (_isLogin()) {
      //Login
    } else {
      //Registrar
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
        color: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Glassmorphism(
          blur: 15,
          opacity: 0.2,
          radius: 20,
          child: Container(
            //  decoration: const BoxDecoration(boxShadow: [
            //    BoxShadow(
            //        blurRadius: 16, spreadRadius: 16, color: Colors.black12),
            //  ]),
            padding: const EdgeInsets.all(16),
            height: _isLogin() ? 340 : 450,
            width: deviceSize.width * 0.75,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Usuário',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite seu usuario";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite seu senha";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_isSignup())
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            labelText: 'Confirmar Senha',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (_isLoading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                          onPressed: _submit,
                          child: Text(
                            _authMode == AuthMode.Login
                                ? 'ENTRAR'
                                : 'CADASTRAR',
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 8,
                            ),
                          )),
                    const Spacer(),
                    TextButton(
                      onPressed: _switchAuthMode,
                      child: Text(
                        _isLogin() ? 'CRIAR CONTA' : 'JÁ TENHO CONTA',
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
