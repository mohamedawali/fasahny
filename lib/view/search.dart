import 'package:fasahny/constant/color.dart';
import 'package:fasahny/models/allItemsResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/allItems/all_items_bloc.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Color color = const Color(0xFFBDBDBD);
  TextEditingController searchController = TextEditingController();
  List<Items>? items;
  List<Items>? searchList;
  AllItemsBloc? allItemsBloc;
  @override
  void initState() {
    super.initState();
    allItemsBloc = BlocProvider.of<AllItemsBloc>(context)
      ..add(GetAllItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colorLight)),
              child: TextField(
                controller: searchController,
                onChanged: (text) => allItemsBloc!.add(SearchList(text)),
                decoration: InputDecoration(
                    hintText: 'Where do you want to go out ',
                    prefixIcon: Icon(
                      Icons.search,
                      color: colorDark,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              height: screenSize.height,
              child: BlocBuilder<AllItemsBloc, AllItemsState>(
                  builder: (context, state) {
                if (state is GetAllItemsState) {
                  searchList = state.itemsList;

                  return ListView.builder(
                      itemCount: searchList!.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: screenSize.height / 3,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                searchList![index]
                                                    .images![0]
                                                    .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: InkWell(
                                        onTap: () => Navigator.pushNamed(
                                          context,
                                          '/searchSightDetails',
                                          arguments: searchList![index],
                                        ),
                                        child: Container(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          searchList![index]
                                                              .title!,
                                                          style: GoogleFonts
                                                              .manrope(
                                                            textStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        18.sp),
                                                          )),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.favorite,
                                                            size: 24,
                                                            color: colorDark,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                              searchList![index]
                                                                  .loves
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                              )),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .visibility_outlined,
                                                            size: 22,
                                                            color: colorDark,
                                                          ),
                                                          Text(
                                                            searchList![index]
                                                                .views!
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: colorDark,
                                                  )
                                                ],
                                              ),
                                            )),
                                      ))
                                ],
                              ),
                            ),
                          ));
                }
                return const Center(child: CircularProgressIndicator());
              }))
        ],
      ),
    );
  }
}
