import 'package:fasahny/bloc/profile/profile_bloc.dart';
import 'package:fasahny/constant/color.dart';
import 'package:fasahny/models/citiesResponse.dart';
import 'package:fasahny/models/packagesResponsModel.dart';
import 'package:fasahny/models/recommend_recent%20_model.dart';
import 'package:fasahny/view/drawer.dart';
import 'package:fasahny/view/favorite.dart';
import 'package:fasahny/view/home.dart';
import 'package:fasahny/view/newHangout.dart';
import 'package:fasahny/view/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/favoriteModel.dart';
import '../models/profileResponseModel.dart';
import '../models/randomImagrRespons.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex=0 ;
  CitiesResponseModel? citiesList;
  ProfileResponseModel? profileResponseModel;
  List<RandomIMageResponseModel>? randomImageList;
  List<RecommendRecentViewModel>? recommendImageList;
  List<RecommendRecentViewModel>? recentImageList;
  List<PackagesResponseModel>? packagemageList;
  List<FavoriteModel>? listFavorite;
  ProfileBloc? profileBloc;
  @override
  Widget build(BuildContext context) {
   profileBloc= BlocProvider.of<ProfileBloc>(context)..add(GetProfileData());


    return BlocBuilder<ProfileBloc, ProfileState>(

        builder: (context, state) {
          if(state is ChangeState){
            _currentIndex= state.currentIndex;

          }else if(state is ProfileData){
          profileResponseModel = state.data;}

          return Scaffold(
        appBar: AppBar(
          backgroundColor: colorDark,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        drawer:

              Drawer(child: DrawerPage(profileResponseModel)),

        bottomNavigationBar:  BottomNavigationBar(

            unselectedIconTheme: IconThemeData(color: colorLight),
            selectedIconTheme: IconThemeData(color: colorDark),
            fixedColor: colorDark,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline), label: 'New Hangout'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {profileBloc!.add(ChangePage(index));}


        ),

        body: bottomNavigator( _currentIndex));
  });}

  bottomNavigator(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Home();

      case 1:
        return const Search();

      case 2:
        return const NewHangout();

      case 3:
        return const Favorite();
    }
  }
}
