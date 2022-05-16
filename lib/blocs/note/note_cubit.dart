import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/note_hub.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_screen/cache_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);
  NoteHub? noteHub;

  getAllNotes() {
    emit(NoteLoadingState());
    DioHelper.getData(
            url: 'notes', token: SharedPreferencesHelper.getData(key: 'token'))
        .then((value) {
      print(value.data);
      var jsonData = jsonDecode(value.data);
      // noteHub = NoteHub.fromJson(jsonData) as List<NoteHub>;
      noteHub = NoteHub.fromJson(jsonData);
      print(noteHub!.notes[0].noteTitle);
      emit(NoteSuccessState());
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(NoteErrorState());
    });
  }
}
