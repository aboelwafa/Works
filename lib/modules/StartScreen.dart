// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:works/cubit/cubit.dart';
import 'package:works/cubit/states.dart';
import 'package:works/shared/cacheHelper.dart';
import 'package:works/shared/components.dart';

import '../shared/constants.dart';
import 'AddTimeWork.dart';

class Start_Screen extends StatelessWidget {
  Start_Screen({super.key});

  static String StartId = 'Start_Screen';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(

          image: AssetImage('assets/images/3.png'),
          fit: BoxFit.fitHeight,
        ),

      ),
      child: BlocConsumer<employeeCubit, hourSates>(
        listener: (context, state) {
              if(state is SinginGoogleSuccessState)
              {

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.white,
                        content:
                    Image(image: AssetImage('assets/images/yes.gif'),)
                    ),
                );
                navigateAndFinish(context, AddTimeWork());
              }
        },
        builder: (context, state) {
          return Scaffold(

            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Container(
                  height: 50,
                  child: SignInButton(
                    Buttons.GoogleDark,
                    mini: false,
                    elevation: 20,
                    onPressed: () async {
                      var res = await employeeCubit.get(context)
                          .signInWithGoogle();
                      print(res);

                    },
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    child: Center(
                      child: Container(
                        height: 65,
                        width: size.width / 1.5,

                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(50.0),

                        ),
                        child: Center(
                          child: Text(
                            'Start Now',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'ChivoMono',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      navigateAndFinish(context, AddTimeWork());
                    },

                  ),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}