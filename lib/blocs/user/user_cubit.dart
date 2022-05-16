import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user_hub.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_screen/cache_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  late UserHub userHub;

  login(String email , String password ){
    // ToDO :: Create login
    emit(UserLoadingState());
    DioHelper.postData(url: "users/", data: {
      'Email' : email,
      'Password' : password
    }).then((value)  {
      userHub = UserHub.fromJson(value.data);
      SharedPreferencesHelper.saveData(key: 'token', value: userHub.sId);
      emit(UserSuccessState(userHub));
    }).catchError((error){
      emit(UserErrorState());
    });
  }

}


