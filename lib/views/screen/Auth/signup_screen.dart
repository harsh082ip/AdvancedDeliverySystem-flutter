import 'package:flutter/material.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Color.fromARGB(255, 173, 109, 45),
          color: Colors.white,
          child: Column(
            children: [
              Image.asset('assets/images/shopping.png'),
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 25.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Make your shopping life easier!',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 173, 109, 45)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 173, 109,
                              45)), // Change the border color here
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 173, 109,
                              45)), // Change the border color here
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 22.0, left: 15.0, right: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Phone No.',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 173, 109, 45)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 173, 109,
                              45)), // Change the border color here
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 173, 109,
                              45)), // Change the border color here
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 22.0, left: 15.0, right: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 173, 109, 45)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 173, 109,
                              45)), // Change the border color here
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 173, 109,
                              45)), // Change the border color here
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45.0),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Color.fromARGB(255, 173, 109, 45)),
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 35.0),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Login here',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 173, 109, 45)),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
