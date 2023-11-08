import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/singup_screen.dart';

import '../widgets/screen_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  bool _obscurePass=true;
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 64,),
                    Text('Set Password', style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 16,),
                    Text(
                      'Minimum length password 8 character eith latter and number combination', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),),
                    const SizedBox(height: 16,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _obscurePass= ! _obscurePass;
                            });

                          }, child: Icon(_obscurePass? Icons.visibility : Icons.visibility_off),
                        ),),
                      obscureText: _obscurePass,
                    ),
                    const SizedBox(height: 16,),
                     TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _obscurePassword= ! _obscurePassword;
                            });
                          }, child: Icon(_obscurePassword? Icons.visibility: Icons.visibility_off),
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const JoinUsScreen(),),);
                        }, child: const Text('Confirm'),)),

                    const SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: const Text('Have account?', style: TextStyle(
                          color: Colors.grey,
                        ),),),
                        TextButton(onPressed: (){}, child: const Text('sign In'))
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
