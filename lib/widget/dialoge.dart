 import 'package:fasahny/bloc/rate/rate_bloc.dart';
import 'package:fasahny/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future showDialogo(BuildContext context2, Size screenSize, int? id) {
    RateBloc rateBloc = BlocProvider.of(context2);
    TextEditingController comment=TextEditingController(text: 'That is wonderful');
   double stars=0;
 return showDialog(
      barrierDismissible: false,
      context: context2,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            content: SizedBox(
              height: screenSize.height / 3.5,
              child: Column(
                children: [
                  const Icon(
                    Icons.sentiment_satisfied,
                    size: 80,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
           Column(children: [
                RatingBar.builder(
                    initialRating: stars,
                    ignoreGestures: false,
                    itemSize: 30,
                    allowHalfRating: false,
                    itemBuilder: (context, index) => Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    onRatingUpdate: (value) {
                                stars=value;

                    }),
                SizedBox(
                  height: 10.sp,
                ),
                TextField(controller: comment,cursorColor: colorLight,
                  decoration: InputDecoration(hintText: 'Add Review',focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorDark))),
                )
              ],)

                ],
              ),
            ),
            actions: [
              BlocListener<RateBloc, RateState>(

                listener: (context, state) {
                  if (state is RateAdd) {


                    Navigator.pop(context);
                  }
                },
            child:  TextButton(
                  onPressed: () {

                        rateBloc.add(AddRate(id,comment.text, stars));
                  },
                  child:  Text('Ok',style: GoogleFonts.manrope(color: Colors.black,fontWeight: FontWeight.bold),)),
                ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:  Text('Cancel',style: GoogleFonts.manrope(color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          ));
}