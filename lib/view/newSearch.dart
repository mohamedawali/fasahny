import 'package:fasahny/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/searchResponse.dart';

class NewSearch extends StatelessWidget {
  List<SearchResponseModel> searchList;
  NewSearch(this.searchList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: colorDark,
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://thomas61.pythonanywhere.com${searchList[index].images![index].image!}'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/viewNewSearch',arguments: searchList[index]
                             );
                      },

                      child: Container(
                          color: Colors.white.withOpacity(0.6),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${searchList[index].title}',
                                        style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 18.sp)),
                                      ),
                                      Text(
                                        '${searchList[index].location}',textScaleFactor: 0.8,

                                        style:GoogleFonts.abel(textStyle: TextStyle(fontSize: 18.sp)),
                                      ),

                                    ]),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                         Icon(
                                          Icons.favorite,color: colorDark,
                                          size: 24,
                                        ),
                                        Text('${searchList[index].loves}')
                                      ],
                                    ),

                                    Row(
                                      children: [
                                         Icon(
                                          Icons.visibility_outlined,
                                          size: 22,color: colorDark,
                                        ),
                                        Text('${searchList[index].views}')
                                      ],
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.arrow_forward_ios,color: colorDark,),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
