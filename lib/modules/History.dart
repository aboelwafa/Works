import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works/cubit/cubit.dart';
import 'package:works/cubit/states.dart';

import '../models/hourDay.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  static String HistoryId = 'History';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<employeeCubit,hourSates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
            appBar: AppBar(
              title: Text('DaysWork'),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'N.Hours',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text('Date',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Text('Day',
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ConditionalBuilder(
                    condition: true,
                    builder:(context) => ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) => employeeList(employeeCubit.get(context).emp[index],context),
                        separatorBuilder: (context, index) => Container(
                          width: double.maxFinite,
                          height: 2,
                          color: Colors.grey,
                        ),
                        itemCount: employeeCubit.get(context).emp.length),
                    fallback: (context) => Center(child: CircularProgressIndicator()),

                  ),

                ],
              ),
            ));
      },

    );
  }

  Widget employeeList(HourDay hourDay,context) => InkWell(
        onTap: () {
          // navigateTo(context, EmployeeDetails(employeeModel: model,));
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, top: 20, bottom: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 60,
                        width: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.blueAccent,
                        ),
                        child:  Center(child: Text('${hourDay.count}',
                          style:

                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),))),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.deepOrangeAccent,
                          ),
                          child:  Center(child: Text('${hourDay.date}',
                            style:

                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),))),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 40.0,
                      child: Text(
                        '${hourDay.day}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );



}
