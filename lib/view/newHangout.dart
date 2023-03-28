import 'package:fasahny/bloc/seachFilter/search_filter_bloc.dart';
import 'package:fasahny/constant/color.dart';
import 'package:fasahny/models/searchResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/citiesResponse.dart';

class NewHangout extends StatefulWidget {


  const NewHangout( {Key? key}) : super(key: key);

  @override
  State<NewHangout> createState() => _NewHangoutState();
}

class _NewHangoutState extends State<NewHangout> {
  List<SearchResponseModel> listSearch = [];
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String? selectedHangout, selectedWith, selectedCity;
  List<DropdownMenuItem<String>> cityList = [];
  CitiesResponseModel? citiesList;
 List< CitiesResponseModel>? citiesLists;
  SearchFilterBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<SearchFilterBloc>(context);
    BlocProvider.of<SearchFilterBloc>(context).add(GetCities());


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
      child: Column(
        children: [
          const SizedBox(height: 30,),
           Center(child: Text('Let\'s go to discover Trips ?',style: GoogleFonts.manrope(fontSize: 18,color: colorDark,fontWeight: FontWeight.bold),)),

          const SizedBox(height: 30,),
          Form(
            key: _globalKey,
            child: Column(
              children: [
                SizedBox(
                  child: DropdownButtonFormField<String>(iconEnabledColor: colorDark,
                      validator: (kind) => kind == null ? 'Choice Kind of Hangout' : null,
                      hint: const Text('Choice Kind of Hangout'),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                        enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: colorLight)),
                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: colorLight)),
                      ),
                      iconSize: 30.sp,
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Safari',
                          child: Text('Safari'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Caltural',
                          child: Text('Culture'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Nile cruise',
                          child: Text('Nile cruise'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Religious',
                          child: Text('Religious'),
                        )
                      ],
                      onChanged: (String? newSelected) {
                        setState(() {
                          selectedHangout = newSelected;
                        });
                      },
                      value: selectedHangout),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: DropdownButtonFormField<String>(iconEnabledColor: colorDark,
                      validator: (withs) => withs == null ? 'Who are you Going out with?' : null,
                      hint: const Text('Who are you Going out with?'),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                        enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: colorLight)),
                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: colorLight)),
                      ),
                      iconSize: 30.sp,
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'only me',
                          child: Text('Only'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'my friends',
                          child: Text('Friends'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'family',
                          child: Text('Family'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'your fiancee',
                          child: Text('Fiancee'),
                        )
                      ],
                      onChanged: (String? newSelected) {
                        setState(() {
                          selectedWith = newSelected;
                        });
                      },
                      value: selectedWith),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child:  BlocBuilder<SearchFilterBloc, SearchFilterState>(
                builder: (context, state) {
                  if (state is LoadedCities) {
                    citiesList = state.cities;
                    print('ss${citiesList!.data!.length}');

    return DropdownButtonFormField<String>(iconEnabledColor: colorDark,
                    validator: (city) => city == null ? 'Select City': null,
                    hint: const Text('Select City'),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                       enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: colorLight)),
                      focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: colorLight)),


                    ),
                    iconSize: 30.sp,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    items: citiesList!.data!.map((e) => DropdownMenuItem(
                      value: '${e.governorateNameEn}',
                      child: Text('${e.governorateNameEn}'),
                    )).toList(),
                    onChanged: (String? newSelected) {
                      setState(() {
                        selectedCity = newSelected;
                      });
                    },
                    value: selectedCity,
                  );}return const LinearProgressIndicator();
  },
),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocListener<SearchFilterBloc, SearchFilterState>(
                  listener: (context, state) {
                    if (state is GetSearchState) {
                      listSearch = state.searchList!;

                      Navigator.pushNamed(context, '/newSearch',
                          arguments: listSearch);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      _globalKey.currentState!.validate()
                          ? bloc!.add(SearchEvent(
                              selectedCity, selectedHangout, selectedWith))
                          : null;
                    },
                    child: const Text('Search'),
                    style: ElevatedButton.styleFrom(backgroundColor: colorDark,
                        minimumSize: Size(screenSize.width, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
