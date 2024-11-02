import 'package:flutter/material.dart';
import 'package:google_map/google_map_page.dart';
import 'package:google_map/provider/location_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: GoogleMapPage(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: _LoginState(),
      ),
    );
  }
}



class _LoginState extends StatefulWidget {
  const _LoginState({Key? key}) : super(key: key);

  @override
  State<_LoginState> createState() => _LoginStateState();
}

class _LoginStateState extends State<_LoginState> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Predefined email and password for demonstration purposes
  final String correctEmail = 'anfalmuhammed786@gmail.com';
  final String correctPassword = 'password2058';

  @override
  Widget build(BuildContext context) {
    const clrText = Color(0xFF707070);
    final cx = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/axtella_avl.jpg'),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text("Email"), border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Password"), border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text("Register",
                              style: TextStyle(color: clrText, fontSize: 14))),
                      TextButton(
                          onPressed: () {},
                          child: const Text("forget password",
                              style: TextStyle(color: clrText, fontSize: 14))),
                    ],
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // This makes the button square
                          ),
                        ),
                      ),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        // All fields are valid, check email and password
                        String enteredEmail = emailController.text;
                        String enteredPassword = passwordController.text;

                        // Compare entered email and password with correct values
                        if (enteredEmail == correctEmail &&
                            enteredPassword == correctPassword) {
                          // Successful login, navigate to home page
                          // You can replace this with your navigation logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login successful')),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext ctx) =>
                              const GoogleMapPage()));
                        } else {
                          // Incorrect email or password
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Incorrect email or password')),
                          );
                        }
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Please fill input')),
                        //   );
                        // }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
