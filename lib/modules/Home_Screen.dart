// ignore_for_file: avoid_print, file_names, must_be_immutable, unused_import, prefer_const_constructors, unused_local_variable, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, non_constant_identifier_names, await_only_futures, unnecessary_null_comparison, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController dayController=TextEditingController();

  TimeOfDay Starttime=TimeOfDay(hour: 7, minute: 30);
    TimeOfDay EndTime=TimeOfDay(hour: 4, minute: 30);
    int? SumHour;
    int? SumMiniute;


    


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      
                      height: 50,child: MaterialButton(
                      onPressed: () async{
                      TimeOfDay? newTime= await showTimePicker(
                        context: context,
                         initialTime: Starttime);
                         if(newTime==null)
                         return;

                         setState(() {
                           Starttime=newTime;
                         });
                         
                    },
                    child: Text('Start time at ',style: TextStyle(color: Colors.blue),),
                    ),),
                    Text('${Starttime.hour}:${Starttime.minute}'),
                  ],
                ),
                 Column(
                  children: [
                    SizedBox(height: 50,child: MaterialButton(
                      onPressed: () async{
                        TimeOfDay? newTime= await showTimePicker(
                        context: context,
                         initialTime: releaseTime);
                         if(newTime==null)
                         return;

                         setState(() {
                           releaseTime=newTime;
                         });
                      },
                    child: Text('end time at ',style: TextStyle(
                      color: Colors.red),),
                    ),),
                    
                    Text('${releaseTime.hour}:${releaseTime.minute}'),
                  ],
                ),
             
              ],
            ),

          SizedBox(height: 20,),

          MaterialButton(
            color: Colors.blueGrey,
            onPressed: ()async{
               sumHour();
               setState(() {
                 
               });
            },
            child: Text('sum hour')),
            SizedBox(height: 20,),
            if(EndTime!=null)
              Text('$SumHour:$SumMiniute'), 
           
          ],
        )
    );
 }

 getformattedTime(TimeOfDay time) {
    return '${time.hour}:${time.minute} ${time.period.toString().split('.')[1]}';
  }
  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
}
TimeOfDay now = TimeOfDay.now();
 TimeOfDay releaseTime = TimeOfDay(hour: 15, minute: 0); // 3:00pm
TimeOfDay roomBooked = TimeOfDay.fromDateTime(DateTime.parse('2018-10-20 16:30:04Z')); 



void sumHour()
{
  // StartHour=Starttime.hour;
  // StartMinute=Starttime.minute;
  // EndtHour=releaseTime.hour;
  // EndtMinute=releaseTime.minute;

  SumHour =releaseTime.hour-Starttime.hour;
  SumMiniute=releaseTime.minute-Starttime.minute;
  

}
 
}