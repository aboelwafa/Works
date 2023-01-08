import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:works/cubit/cubit.dart';
import 'package:works/cubit/states.dart';
import 'package:works/modules/History.dart';

import '../models/hourDay.dart';
import '../service/Firestore.dart';

class AddTimeWork extends StatefulWidget {
  const AddTimeWork({Key? key}) : super(key: key);
  static String addTimeId = 'AddTimeWork';

  @override
  State<AddTimeWork> createState() => _AddTimeWorkState();
}

class _AddTimeWorkState extends State<AddTimeWork> {
  var formKey = GlobalKey<FormState>();
  var DateController = TextEditingController();

  TimeOfDay Starttime = const TimeOfDay(hour: 7, minute: 30);
  TimeOfDay EndTime = const TimeOfDay(hour: 4, minute: 30);
  int? SumHour;
  int? SumMiniute;
  String dropdownvalue = 'السبت';
  var items = [
    'السبت',
    'الاحد',
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس',
    'الجمعة'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(

          image: AssetImage('assets/images/1.png'),
          fit: BoxFit.fitHeight,
        ),

      ),
      child: BlocConsumer<employeeCubit,hourSates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Add Task'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, History.HistoryId);
                      employeeCubit.get(context).getEmployee();
                    },
                    icon: const Icon(Icons.history_toggle_off))
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Select Day ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                  const Text(
                    'Write Date ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            'please Enter Date';
                          }
                          return null;
                        },
                        controller: DateController,
                        //editing controller of this TextField
                        decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date", //label text of field
                        ),
                        readOnly: true,

                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              DateController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                  const Text(
                    'Start work at ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: Starttime);
                          if (newTime == null) return;

                          setState(() {
                            Starttime = newTime;
                          });
                        },
                        child: const Text(
                          'Click here ',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: CircleAvatar(
                      radius: 40.0,
                      child: Text(
                        '${Starttime.hour}:${Starttime.minute}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                  const Text(
                    'End work at ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: EndTime);
                          if (newTime == null) return;

                          setState(() {
                            EndTime = newTime;
                          });
                        },
                        child: const Text(
                          'Click here ',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: CircleAvatar(
                      radius: 40.0,
                      child: Text(
                        '${EndTime.hour}:${EndTime.minute}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                  const Text(
                    'Sum of Hours work',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          sumHour();
                          setState(() {});
                        },
                        child: const Text(
                          'Click here ',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: CircleAvatar(
                      radius: 40,
                      child: Text(
                        '$SumHour:$SumMiniute hr',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                  //save
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green[400],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              SumHour != null) {
                            employeeCubit.get(context).createEmployee(
                                day: dropdownvalue,
                                date: DateController.text,
                                startTime: Starttime.toString(),
                                endTime: EndTime.toString(),
                                count: SumHour
                            );
                            DateController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.white,
                                content: Image(
                                    image: AssetImage('assets/images/ok.gif')),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  void sumHour() {
    // StartHour=Starttime.hour;
    // StartMinute=Starttime.minute;
    // EndtHour=releaseTime.hour;
    // EndtMinute=releaseTime.minute;

    SumHour = EndTime.hour - Starttime.hour;
    SumMiniute = EndTime.minute - Starttime.minute;
  }

  CollectionReference users = FirebaseFirestore.instance.collection('works');
  HourDay? model;

  void AddTask({
    required String day,
    required String date,
    required dynamic startTime,
    required dynamic endTime,
    required dynamic count,
  }) {
    HourDay model = HourDay(
      day: day,
      date: date,
      startTime: startTime,
      endTime: endTime,
      count: count,
    );
    users.doc(date).set(model.toMpa()).then((value) {
      print(users.id);
    }).catchError((onError) {
      print(onError.toString());
    });
    print(users.firestore);
  }

//  date
}
