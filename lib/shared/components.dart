// // ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, sort_child_properties_last, constant_identifier_names, dead_code, unused_local_variable, body_might_complete_normally_nullable, sized_box_for_whitespace, unused_import
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// //  component to go name widget screen and back
// void navigateTo(context,Widget)=> Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => Widget,
//   ),
// );
// void navigatePop(context,Widget)=> Navigator.pop(
//   context,
//   MaterialPageRoute(builder: (context) => Widget,
//   ),
// );
//
// // component to go name widget screen and not back
import 'package:flutter/material.dart';

void navigateAndFinish
    (context,Widget)=>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
          (route) {
        return false;
      },
    );
// // reusable component to textFormField
// // 2-TextFormField
// Widget DefaultFormField({
//   required TextEditingController controller,
//   String? Function(String?)? onSubmit,
//   String? Function(String?)? onChanged,
//   required String? Function(String?)? validate,
//   required TextInputType type,
//   required String label,
//    String? hint,
//   IconData? prefix,
//   IconData? suffix,
//   Function()? SuffixPress,
//   bool IsPassword=false,
//   Color suffixIconColor=Colors.blue,
// })=>
//
//     TextFormField(
//
//       controller: controller,
//       onFieldSubmitted:onSubmit,
//       onChanged: onChanged,
//       validator: validate,
//       keyboardType: type,
//       obscureText: IsPassword,
//       decoration: InputDecoration(
//         suffixIconColor: suffixIconColor,
//         labelText: label ,
//         hintText: hint,
//         prefixIcon: Icon(prefix),
//           suffixIcon: suffix!=null? IconButton(
//             onPressed: SuffixPress,
//             icon: Icon(
//             Icons.remove_red_eye),
//           )
//         :null,
//         // suffixIcon: Icon(suffix),
//         border: OutlineInputBorder(),
//       ),
//       // maxLines: 3,
//       // minLines: 1,
//     );
//
// // defaultButton
// Widget defaultButton({
//   double width=double.infinity,
//   Color background =Colors.teal,
//   required void Function()? function, // Good
//   required String text,
//   double height=35.0,
//   bool isUpperCase=true,
//   double radius=10.0,
// })=>
//     Container(
//       width: width,
//       height: height,
//       child: MaterialButton(
//         onPressed:function,
//         child:
//         Text(
//           isUpperCase?text.toUpperCase():text,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0
//           ),),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         color:background,
//
//
//       ),
//
//     );
//
// //TEXT BUTTON
// //
// Widget defaultTextButton({
//   required Function()? function,
//   required String text,
// })=>
//     TextButton(
//         onPressed: function,
//         child: Text(text.toUpperCase(),style: TextStyle(
//           color: Colors.blue,
//           fontSize: 16.0,
//         ),));
//
// // flutter toast msg
//
// void showToast({
//   required String text,
//   required Toaststate state,
// })=>Fluttertoast.showToast(
//
//   msg: text,
//   toastLength: Toast.LENGTH_LONG,
//   gravity: ToastGravity.BOTTOM,
//   timeInSecForIosWeb: 10,
//   backgroundColor:chooseToastcolor(state),
//   textColor: Colors.white,
//   fontSize: 20.0,
// );
//
// //  enum>> to swap color
// enum Toaststate
//     {
//   SUCCESS,
//   ERROR,
//   WARNING
// }
// // method change color
// Color? chooseToastcolor(Toaststate state)
// { Color color;
// switch(state)
// {
//
//   case Toaststate.SUCCESS:
//     color= Colors.green;
//     break;
//   case Toaststate.ERROR:
//     color= Colors.red;
//     break;
//   case Toaststate.WARNING:
//     color= Colors.yellow;
//     break;
// }
// return color;
// }
//
// Widget mydivider()=>Padding(
//
//
//   padding: const EdgeInsetsDirectional.only(start: 10.0),
//   child: Container(
//     width: double.infinity,
//     height: 2,
//     color: Colors.black,
//   ),
// );
//
