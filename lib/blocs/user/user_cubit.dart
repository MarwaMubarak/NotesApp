import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_hub.dart';
import '../../services/dio_helper/dio_helper.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  late UserHub userHub;

  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);


  login(String email , String password ){
    // ToDO :: Create login
    emit(UserLoadingState());
    DioHelper.postData(url: "login", data: {
      'email' : email,
      'password' : password
    }).then((value)  {
      //userHub = UserHub.fromJson(value.data);
      print(value.data);
      //SharedPreferencesHelper.saveData(key: 'token', value: userHub.accessToken);
      emit(UserSuccessState(userHub));
    }).catchError((error){
      emit(UserErrorState());
    });
  }
}