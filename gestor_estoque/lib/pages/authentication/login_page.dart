import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35, top: 50, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo de volta!!', 
              style: TextStyle(
                color: Color.fromARGB(255, 202, 130, 6),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              'Login', 
              style: TextStyle(
                color: Color.fromARGB(255, 221, 130, 36),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 245, 245, 245),
                label: Text('E-mail'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width:1.2),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 245, 245, 245),
                label: Text('Password'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width:1.2),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                minimumSize: const Size.fromHeight(50),
                shape: LinearBorder.bottom(),
              ),
              onPressed: (){},
              child: Text("Login"),
            ),
          ]
        ,)
      )
    );
  }
}