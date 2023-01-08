import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hourDay.dart';

class workFire
{
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  HourDay?model;
  void AddTask({
  required String day,
    required String date,
    required dynamic startTime,
    required dynamic endTime,
    required dynamic count,
})
  {
    HourDay model=HourDay(
      day: day,
      date: date,
      startTime: startTime,
      endTime: endTime,
      count: count,
    );
    users.doc(users.id).set(model.toMpa()).then((value) {
      print(users.id);
    }).catchError((onError){
      print(onError.toString());
    });

  }

}