import 'package:carousel_slider/carousel_slider.dart';
import 'package:fasahny/bloc/packages/packages_bloc.dart';
import 'package:fasahny/bloc/randomImage/random_image_bloc.dart';
import 'package:fasahny/bloc/recentView/recent_bloc.dart';
import 'package:fasahny/models/packagesResponsModel.dart';
import 'package:fasahny/models/randomImagrRespons.dart';
import 'package:fasahny/models/recommend_recent _model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/reccomend_recent_view/recommend_view_bloc.dart';
import '../widget/circularCarouselSlider.dart';

class Home extends StatelessWidget {
  List<RandomIMageResponseModel>? randomImageList;
  List<RecommendRecentViewModel>? recommendList;
  List<RecommendRecentViewModel>? recentList;
  List<PackagesResponseModel>? packageList;

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    BlocProvider.of<RandomImageBloc>(context).add(GetRandomImage());
    BlocProvider.of<PackagesBloc>(context).add(GetPackagesEvent());
    BlocProvider.of<RecommendViewBloc>(context).add(GetRecommendViewEvent());
    BlocProvider.of<RecentBloc>(context).add(GetRecentViewEvent());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            BlocBuilder<RandomImageBloc, RandomImageState>(
                builder: (context, state) {
              if (state is LoadedRandomImage) {
                randomImageList = state.imageList;

                return CarouselSlider(
                    items: randomImageList!
                        .map((image) => SizedBox(
                              width: screenSize.width,
                              child: Image.network(
                                image.imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        enlargeCenterPage: false,
                        autoPlay: true,
                        viewportFraction: 1,
                        height: screenSize.height / 4));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recommended for you',
                    style:
                    GoogleFonts.manrope(textStyle:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  )),
            ),
            BlocBuilder<RecommendViewBloc, RecommendViewState>(
                builder: (context, state) {
              if (state is GetRecommendViewState) {
                recommendList = state.recommendList;
                return  CircularCarouselSlider(recommendList);
              }
              return const CircularProgressIndicator();
            }),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Most Recent',
                    style:
                    GoogleFonts.manrope(textStyle:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  )),
            ),
            BlocBuilder<RecentBloc, RecentState>(builder: (context, state) {
              if (state is GetRecentViewState) {
                recentList = state.recentList;
                return CircularCarouselSlider(recentList);
              }

              return const Center(child: CircularProgressIndicator());
            }),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Package for you',
                    style:GoogleFonts.manrope(textStyle:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold))
                       ,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
              child: SizedBox(
                height: 150.h,
                child: BlocBuilder<PackagesBloc, PackagesState>(
                    builder: (context, state) {
                  if (state is GetPackageState) {
                    packageList = state.packages;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: packageList!.length,
                        itemBuilder: (context, index) =>  InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, '/packageDetails',
                                    arguments: packageList![index]),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SizedBox(      width: 180.h,

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(

                                          height: 110.h,
                                          width: 180.h,
                                          child: Image.network(
                                            "${packageList![index].trips![index].tripimages![index].image}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text('${packageList![index].title}',
                                            style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 20.sp,))),


                                      ],
                                    ),
                                  ),
                                ),

                            ));
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
              ),
            )
                     ],
        ),
      ),
    );
  }
}
