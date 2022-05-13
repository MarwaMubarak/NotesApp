import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/user/user_cubit.dart';
import 'package:notes_app/views/note_view.dart';
import 'package:notes_app/views/sign_up_view.dart';
import 'home_view.dart';


class SignInView extends StatelessWidget {

  final _passController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var userCubit=UserCubit();
        return Scaffold(
          resizeToAvoidBottomInset:false,
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    color: Colors.black,
                    child: Image.asset('assets/images/log1.png'),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            width: 350,
                            child: TextField(
                              controller: _emailController,
                              textAlign: TextAlign.center,
                              onChanged: (val) {
                                  userCubit.Validation(_emailController.toString());
                              },
                              decoration: const InputDecoration(
                                hintText: 'Email',


                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            width: 350,
                            child: TextField(
                              controller: _passController,
                              textAlign: TextAlign.center,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                hintText: 'Password',

                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xfffae2fc),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NoteView()),
                        );
                      },
                      child: const Text('Sign In',
                        style: TextStyle(fontSize: 20, color: Colors.black),)
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xfffae2fc),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpView()),
                        );
                      },
                      child: const Text('Sign Up',
                        style: TextStyle(fontSize: 15, color: Colors.black),)
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
