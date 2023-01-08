// ignore_for_file: camel_case_types, unused_local_variable, unused_import, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:works/cubit/states.dart';

import '../models/hourDay.dart';
import '../shared/constants.dart';

class employeeCubit extends Cubit<hourSates>
{
  employeeCubit():super(createEmployeeIntialState());

  
static employeeCubit get(context)=>BlocProvider.of(context);


  HourDay?employeeModel;
  String? emailId;


void createEmployee({
  required String day,
  required String date,
  required dynamic startTime,
  required dynamic endTime,
  required dynamic count,
  String?email

  
  
})
{
  emit(createEmployeeLoadingState());
  HourDay model=HourDay(
  day: day,
    date: date,
    endTime: endTime,
    startTime: startTime,
    count: count,
    email: emailId
    
  );
  FirebaseFirestore.instance.collection('works')
  .doc(date)
  .set(model.toMpa())
  .then((value) {    
    emit(createEmployeeSuccessState());
  })
  .catchError((error){

    emit(createEmployeeErrorState());
  });
  
}
List<HourDay> emp=[];
List<String> EmployeeID=[];
void getEmployee()
{
  
  emit(GetEmployeeLoadingState());
  FirebaseFirestore.instance.collection('works')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      emp=[];
      event.docs.forEach((element) {
        EmployeeID.add(element.id);
        emp.add(HourDay.fromjson(element.data()));
      });
      emit(GetEmployeeSuccessState());
    });

 
}

 //get details client only
  List<HourDay> detailsEmployee=[];
  void getDetailClient({required String phone,})
  {
    FirebaseFirestore.instance.collection('employee')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      //detailsClients=[];
      event.docs.forEach((element) {
        if(element.data()['email']==employeeModel?.email) {
          detailsEmployee.add(HourDay.fromjson(element.data()));
        }
      });
      emit(GetEmployeeDetailsSuccessState());
    });
  }

//  sing google

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    emit(SinginGoogleSuccessState());
    print(googleUser!.email);
    emailId=googleUser.email;
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


}

