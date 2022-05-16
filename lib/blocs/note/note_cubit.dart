import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/note_hub.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_screen/cache_helper.dart';


part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context)=>BlocProvider.of(context);
  //late NoteHub noteHub;
  List<NoteHub> notesList = [];
  late List<NoteHub> noteHub;

  getAllNotes() {
    DioHelper.getData(url: 'notes',token: SharedPreferencesHelper.getData(key: 'token')).then((value) {
      emit(NoteLoadingState());

      var jsonData = jsonDecode(value.data);

      noteHub = NoteHub.fromJson(jsonData) as List<NoteHub>;

      for (var note in noteHub )///
        notesList.add(note);

      emit(NoteSuccessState());

      return notesList;
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(NoteErrorState());
    });
  }
  
  
  
  
  
  
  
  void getNotes(){
    // Todo :: Create get data
    emit(NoteLoadingState());
    DioHelper.getData(url: "users/" , token: SharedPreferencesHelper.getData(key: 'token')).then((value) {
      noteHub = NoteHub.fromJson(value.data) as List<NoteHub>;
      emit(NoteSuccessState());
    }).catchError((onError){
      emit(NoteErrorState());
    });
  }

}