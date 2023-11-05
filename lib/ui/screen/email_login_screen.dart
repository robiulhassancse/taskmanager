import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/pin_verification_page.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 64,),
                    Text('Your Email Address', style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: 16,),
                    Text('A 6 digit verification pin will send to your email address', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    )),
                    SizedBox(height: 16,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email'
                      ),
                    ),
                    SizedBox(height: 16,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PinVerificationScreen(),),);
                        },
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Have account?', style: TextStyle(
                          color: Colors.black,
                        ),),
                      ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Sign In'),
                          ),
                    ]
                    ),
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
