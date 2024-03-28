import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estoque/helpers/responsive.dart';
import 'package:gestor_estoque/helpers/validators.dart';
import 'package:gestor_estoque/models/userlocal.dart';
import 'package:gestor_estoque/pages/authentication/signup_page.dart';
import 'package:gestor_estoque/pages/main/main_page.dart';
import 'package:gestor_estoque/services/user_services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserLocal _userLocal = UserLocal();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const MainPage();
                } else {
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 80),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/commodity.jpg',
                                height:
                                    Responsive.isMobile(context) ? 200 : 250,
                                width: Responsive.isMobile(context) ? 380 : 440,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 20 : 40,
                            ),
                            Text(
                              'Bem-vindo de volta!!!',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 240, 119, 5),
                                  fontSize:
                                      Responsive.isMobile(context) ? 18 : 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Aplicativo para Commodities multi-funcional",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 8, 45, 5),
                                  fontSize:
                                      Responsive.isMobile(context) ? 14 : 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              height: Responsive.isMobile(context) ? 50 : 60,
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  label: Text(
                                    'E-mail',
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 13
                                          : 17,
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1.2),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1.2),
                                  ),
                                ),
                                validator: (email) {
                                  //um validador deve ser chamando no Form
                                  if (!emailValidator(email!)) {
                                    return 'E-mail inválido!!!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              height: Responsive.isMobile(context) ? 50 : 60,
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    label: Text(
                                      "Senha",
                                      style: TextStyle(
                                        fontSize: Responsive.isMobile(context)
                                            ? 13
                                            : 17,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.2),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.2),
                                    )),
                              ),
                            ),
                            Container(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      Responsive.isMobile(context) ? 12 : 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              child: ElevatedButton(
                                onPressed: () async {
                                  UserServices userServices = UserServices();

                                  _userLocal.email = _emailController.text;
                                  _userLocal.password =
                                      _passwordController.text;

                                  bool ok =
                                      await userServices.signIn(_userLocal);
                                  if (ok) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainPage(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 1.8,
                                  minimumSize: const Size.fromHeight(50),
                                  shape: LinearBorder.bottom(),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 1, 50, 3),
                                    fontSize:
                                        Responsive.isMobile(context) ? 14 : 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 20 : 30,
                            ),
                            SizedBox(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              child: Center(
                                child: Text(
                                  'ou',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 1, 50, 3),
                                    fontSize:
                                        Responsive.isMobile(context) ? 14 : 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 20 : 30,
                            ),
                            SizedBox(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google.png',
                                      height: 50,
                                    ),
                                    Text(
                                      "Login com Google",
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 1, 50, 3),
                                        fontSize: Responsive.isMobile(context)
                                            ? 14
                                            : 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: Responsive.isMobile(context) ? 350 : 450,
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text('Ainda não tem conta?'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Registre-se aqui',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Responsive.isMobile(context)
                                            ? 12
                                            : 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              })),
    );
  }
}
