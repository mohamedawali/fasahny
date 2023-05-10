import 'package:fasahny/bloc/favorite/favorite_bloc.dart';
import 'package:fasahny/bloc/rate/rate_bloc.dart';
import 'package:fasahny/models/allItemsResponse.dart';
import 'package:fasahny/models/packagesResponsModel.dart';
import 'package:fasahny/models/profileResponseModel.dart';
import 'package:fasahny/models/searchResponse.dart';
import 'package:fasahny/view/mainHome.dart';
import 'package:fasahny/view/newSearch.dart';
import 'package:fasahny/view/packageDetails.dart';
import 'package:fasahny/view/sightDetails2.dart';
import 'package:fasahny/view/signIn.dart';
import 'package:fasahny/view/signUp.dart';
import 'package:fasahny/view/user_Profil.dart';
import 'package:fasahny/view/viewNewSearchDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/view/view_bloc.dart';
import 'dependanceInjection.dart';
import 'models/recommend_recent _model.dart';
import 'view/viewSearchDetails.dart';

class Navigators {
  Navigators() {
    initGetIt();
  }

  Route? route(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case '/':
        return MaterialPageRoute(
            builder:(BuildContext context) =>const SignIn());

      case '/signUp':
        return MaterialPageRoute(
            builder:(BuildContext context) => const SignUp(),
                );

      case '/mainHome':
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainHome());
      case '/profile':
        var profileData = routeSettings.arguments as ProfileResponseModel;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              UserProfile(profileData: profileData),
        );
      case '/sightDetails':
        var details = routeSettings.arguments as RecommendRecentViewModel;

        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ViewDetails2(viewDetails: details));
      case '/searchSightDetails':
        var details = routeSettings.arguments as Items;

        return MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: getIt<FavoriteBloc>()),
                    BlocProvider.value(
                      value: getIt<RateBloc>(),
                    ),
                  ],
                  child: ViewSearchDetails(viewDetails: details),
                ));
      case '/packageDetails':
        var packages = routeSettings.arguments as PackagesResponseModel;
        return MaterialPageRoute(
            builder: (BuildContext context) => PackageDetails(packages));
      case '/newSearch':
        var search = routeSettings.arguments as List<SearchResponseModel>;
        return MaterialPageRoute(
            builder: (BuildContext context) => NewSearch(search));
      case '/viewNewSearch':
        var search = routeSettings.arguments as SearchResponseModel;
        return MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: getIt<RateBloc>()),
                    BlocProvider.value(value: getIt<ViewBloc>()),
                  ],
                  child: ViewNewSearchDetails(search),
                ));
    }
    return null;
  }
}
