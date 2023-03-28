import 'package:carousel_slider/carousel_slider.dart';
import 'package:fasahny/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/recommend_recent _model.dart';

class CircularCarouselSlider extends StatelessWidget {
  List<RecommendRecentViewModel>? viewList;

  CircularCarouselSlider(this.viewList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
        items: viewList!
            .map((view) => Builder(builder: (context) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/sightDetails',
                                    arguments: view);
                              },
                              child: SizedBox(
                                height: 130.h,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${view.images![0].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //),
                              ),
                            ),

                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(view.title!,
                                  style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 20.sp,))

                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility_outlined,
                                    color: colorDark,
                                    size: 20.sp,
                                  ),
                                  Text(
                                    " ${view.views}",
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.black),
                                  )

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }))
            .toList(),
        options: CarouselOptions(
            enlargeCenterPage: false,
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height / 4));
  }
}
