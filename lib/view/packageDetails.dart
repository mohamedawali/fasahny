import 'package:fasahny/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/packagesResponsModel.dart';

class PackageDetails extends StatelessWidget {
 final PackagesResponseModel? packagesList;
  const PackageDetails(this.packagesList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(screenSize, context),
          sliverList(context, screenSize)
        ],
      ),
    );
  }

  sliverAppBar(Size screenSize, BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: colorDark,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          '${packagesList!.title}',
          style: GoogleFonts.manrope(
              textStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget sliverList(BuildContext context, Size screenSize) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('The Duration of the Trip',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold))),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: colorDark,
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  Text(
                    '${packagesList!.duration} Days',
                    style: GoogleFonts.abel(
                        textStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black)),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Text('Hotel Name',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold))),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: colorDark,
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  Text('${packagesList!.hoteLocation}',
                      style: GoogleFonts.abel(
                          textStyle:
                              TextStyle(fontSize: 16.sp, color: Colors.black)))
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.hotel,
                    color: colorDark,
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  Text('${packagesList!.hotelName}',
                      style: GoogleFonts.abel(
                          textStyle:
                              TextStyle(fontSize: 16.sp, color: Colors.black)))
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Text(
                'Program Trip',
                style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemCount: packagesList!.trips!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${packagesList!.trips![index].location}',overflow: TextOverflow.clip,
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                                    fontSize: 18.sp, color: Colors.black)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width,

                        height: screenSize.height / 4,
                        child: ListView.builder(
                          itemCount: packagesList!.trips!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index2) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child:
                            Container(
                                height: screenSize.height / 4,
                                width:screenSize.width/2 ,
                                decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${packagesList!.trips![index].tripimages![index2].image}")),
                                )),
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
    ]));
  }
}
