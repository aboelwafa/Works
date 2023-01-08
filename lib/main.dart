// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works/modules/History.dart';
import 'package:works/shared/bloc_0bserved.dart';
import 'package:works/shared/cacheHelper.dart';
import 'package:works/shared/constants.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'firebase_options.dart';
import 'modules/AddTimeWork.dart';
import 'modules/Home_Screen.dart';
import 'modules/StartScreen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => employeeCubit(),
      child: BlocConsumer<employeeCubit,hourSates>(
        listener: (context, state) {

        },
        builder: (context, state) {

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.teal,
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              AddTimeWork.addTimeId:(context)=>AddTimeWork(),
              Start_Screen.StartId:(context)=>Start_Screen(),
              History.HistoryId:(context)=>History(),

            },
            initialRoute: Start_Screen.StartId,
            //home:  History(),
          );
        },
      ),
    );
  }
}


