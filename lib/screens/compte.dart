import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'splash_screen.dart';

void main() {
  runApp(MaterialApp(
    home: ComptePage(),
  ));
}

class ComptePage extends StatefulWidget {
  @override
  _ComptePageState createState() => _ComptePageState();
}

class _ComptePageState extends State<ComptePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.indigo, // Set the app bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/splash.svg',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: firstNameController,
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: lastNameController,
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                  ),
                  SizedBox(height: 10),
                  DateTimeField(
                    controller: dateOfBirthController,
                    format: DateFormat("yyyy-MM-dd"),
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      hintText: 'Select your date of birth',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor:
                          Colors.grey[200], // Light gray background color
                    ),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      return date;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to SplashScreen when Sign Up button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 30, 11, 139), // Set the button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200], // Light gray background color
      ),
    );
  }
}
