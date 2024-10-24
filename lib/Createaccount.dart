import 'package:flutter/material.dart';
import 'Dashboard.dart';
class Createaccount extends StatefulWidget {
  @override
  _CreateaccountState createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  @override
  bool _isChecked = false;
  bool _isObscured = true;


  final TextEditingController _controller = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sc.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle, // Use circular shape for rounded button/icon
                            ),
                            child: Image.asset(
                              'assets/images/person.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),

                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome! Please enter your information below and get started.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller:
                            _controller, // Assign the controller to the TextField
                        decoration: InputDecoration(
                          labelText: 'Your Email', // Label inside the TextField
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded corners
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
              TextField(
                controller: _password,
                obscureText: _isObscured, // Controls password visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // Suffix icon to toggle password visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        // Toggle between obscure and visible password text
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
              ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue!;
                              });
                            },
                          ),
                          Text(
                            'Accept Terms and Conditions',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      SizedBox(
                        width: 372,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _isChecked
                              ? () {
                            // Navigate to the second screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>ValidationCode()),
                            );
                          } : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min, // Reduces the row size to fit its content
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // Removes default padding
                            ),
                            child: Text(
                              'Already Have an Account?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // Removes default padding
                            ),
                            child: Text(
                              'Log in here!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
