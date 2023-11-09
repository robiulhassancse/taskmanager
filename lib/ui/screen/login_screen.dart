
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/data/model/auth_utility.dart';
import 'package:taskmanager/ui/data/model/login_model.dart';
import 'package:taskmanager/ui/data/model/network_response.dart';
import 'package:taskmanager/ui/data/services/network_caller.dart';
import 'package:taskmanager/ui/data/utils/urls.dart';
import 'package:taskmanager/ui/screen/bottom_nav_base_screen.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _loginInProgress = false;

  Future<void>login() async{
    _loginInProgress = true;
    if(mounted){
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passTEController.text,
    };
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.login,requestBody);
    _loginInProgress = false;
    if(mounted){
      setState(() {});
    }
    if(response.isSuccess){
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);
      if(mounted) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavScreen()));
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => const BottomNavScreen(),), (
                route) => false);
      }
      }else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect email or password')),);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 64,),
                      Text(
                        'Get Started With',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       TextFormField(
                         controller: _emailTEController,
                        decoration: const InputDecoration(hintText: 'Enter your email'),
                         validator: (String?value){
                           if(value?.isEmpty ?? true) {
                             return 'Enter your email address';
                           }
                         },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passTEController,
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        validator: (String? value){
                          if((value?.isEmpty ?? true) && value!.length<=5){
                            return 'Enter your password';
                          }
                        },

                        obscureText: _obscureText,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _loginInProgress == false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: () {
                              if(!_formkey.currentState!.validate()){
                                return;
                              }
                              login();
                              // (Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => EmailScreen(),
                              //   ),
                              // );)
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Don't have account?",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Sign up'),
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
    );
  }
}
