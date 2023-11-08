import 'package:flutter/material.dart';
import 'package:taskmanager/ui/data/model/network_response.dart';
import 'package:taskmanager/ui/data/services/network_caller.dart';
import 'package:taskmanager/ui/data/utils/urls.dart';
import 'package:taskmanager/ui/screen/bottom_nav_base_screen.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class JoinUsScreen extends StatefulWidget {
  const JoinUsScreen({super.key});

  @override
  State<JoinUsScreen> createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  bool _obscureText = true;
  final GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _signUpInProgress = false;

  Future<void> userSingUP() async {
    _signUpInProgress= true;
    if(mounted){
      setState(() {
      });
    }
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.registration, <String,dynamic>{
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password":_passwordTEController.text,
      "photo":""
    });
    if(mounted){
      setState(() {

      });
    }
    _signUpInProgress = false;
    if(response.isSuccess) {
      _emailTEController.clear();
      _passwordTEController.clear();
      _firstNameTEController.clear();
      _lastNameTEController.clear();
      _mobileTEController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration success!!')));
      }
    }

    else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      Text(
                        'Join with Us',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       TextFormField(
                         controller: _emailTEController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                        ),
                         validator: (String?value){
                           if(value?.isEmpty?? true){
                             return 'Enter your email name';
                           }
                         },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                        TextFormField(
                          controller: _firstNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons.account_circle_rounded),
                        ),
                          validator: (String?value){
                            if(value?.isEmpty ?? true){
                              return 'Enter your first name';
                            }
                          },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       TextFormField(
                         controller: _lastNameTEController,
                        decoration: const InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(Icons.account_circle),),
                         validator: (String?value){
                           if(value?.isEmpty ?? true){
                             return 'Enter your last name';
                           }
                         },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       TextFormField(
                         controller: _mobileTEController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Mobile Name',
                          prefixIcon: Icon(Icons.phone),
                        ),
                         validator: (String?value){
                           if((value?.isEmpty ?? true) || value!.length<11){
                             return 'Enter your mobile number';
                           }
                         },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordTEController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (String?value){
                          if(value?.isEmpty ?? true){
                            return 'Enter your password';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _signUpInProgress==false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: () {
                              if(! _formkey.currentState!.validate()){
                                return;
                              }
                               userSingUP();
                            },
                            child: const Icon(Icons.arrow_forward_ios,),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Have account?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Sign In'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
