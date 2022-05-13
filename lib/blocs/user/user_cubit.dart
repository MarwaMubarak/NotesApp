import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user_hub.dart';
import '../../services/dio_helper/dio_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  late UserHub userHub;

  login(String email , String password ){
    // ToDO :: Create login
    emit(UserLoadingState());
    DioHelper.postData(url: "user/", data: {
      'email' : email,
      'password' : password
    }).then((value)  {
      userHub = UserHub.formJson(value.data);
      //SharedPreferencesHelper.saveData(key: 'token', value: userHub.accessToken);
      emit(UserSuccessState(userHub));
    }).catchError((error){
      emit(UserErrorState());
    });
  }

Validation(email)
{
  if (EmailValidator.validate(email)) {
    emit(ValidationState());
    return true;
  } else {
    emit(ValidationState());
    return false;
  }

}


}