import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/note/note_cubit.dart';
import '../blocs/user/user_cubit.dart';
import '../views/splash_screen.dart';
class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => UserCubit(),),
        BlocProvider(create: (BuildContext context) => NoteCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
