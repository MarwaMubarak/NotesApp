import 'package:flutter/material.dart';
import 'package:notes_app/models/note_hub.dart';
import 'package:notes_app/services/dio_helper/dio_helper.dart';
import 'package:notes_app/services/sp_screen/cache_helper.dart';
import 'package:notes_app/src/root_app.dart';
 List<NoteHub> NotesList=[];
Future<void> main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(const RootApp());
}
