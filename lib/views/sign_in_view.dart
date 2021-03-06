import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/user/user_cubit.dart';
import 'package:notes_app/views/sign_up_view.dart';
import 'home_view.dart';

class SignInView extends StatelessWidget {
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final signKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
        // if(state is UserSuccessState)
        //   {
        //
        //   }
      },
      builder: (context, state) {
        var userCubit = UserCubit();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Form(
                key: signKey,
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
                                  borderRadius: BorderRadius.circular(20)),
                              width: 350,
                              child: TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Cannot be empty";
                                  } else if (!val.contains('@') ||
                                      !val.contains('.')) {
                                    return 'invalid Email';
                                  }
                                  return null;
                                },
                                controller: _emailController,
                                onChanged: (val) {},
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  prefixIconColor: Colors.grey,
                                  hintText: 'Email',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
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
                                  borderRadius: BorderRadius.circular(20)),
                              width: 350,
                              child: TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Cannot be empty";
                                  }
                                  return null;
                                },
                                controller: _passController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  prefixIconColor: Colors.grey,
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
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
                          if (signKey.currentState!.validate()) {
                            String email = _emailController.text;
                            String pass = _passController.text;
                            userCubit.login(email, pass);

                            Navigator.push(
                              context,
                              //userCubit.userHub
                              MaterialPageRoute(
                                  builder: (context) => HomeView()),
                            );
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign Up',
                        style:
                            TextStyle(color: Color(0xfffae2fc), fontSize: 15),
                      ),
                      onTap: () {
                        _emailController.clear();
                        _passController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpView()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
