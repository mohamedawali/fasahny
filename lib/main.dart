import 'package:fasahny/navigator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/allItems/all_items_bloc.dart';
import 'bloc/favorite/favorite_bloc.dart';
import 'bloc/loginRegister/login_register_bloc.dart';
import 'bloc/packages/packages_bloc.dart';
import 'bloc/profile/profile_bloc.dart';
import 'bloc/randomImage/random_image_bloc.dart';
import 'bloc/rate/rate_bloc.dart';
import 'bloc/reccomend_recent_view/recommend_view_bloc.dart';
import 'bloc/recentView/recent_bloc.dart';
import 'bloc/seachFilter/search_filter_bloc.dart';
import 'bloc/view/view_bloc.dart';
import 'dependanceInjection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp(navigator: Navigators(),));
}

class MyApp extends StatelessWidget {
 final Navigators navigator;

   const MyApp({Key? key,required this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context,child)=>
          MultiBlocProvider(providers: [
            BlocProvider.value(value:getIt<LoginRegisterBloc>()),
            BlocProvider.value(value: getIt<ProfileBloc>()),
            BlocProvider.value(value: getIt<RandomImageBloc>()),
            BlocProvider.value(value:getIt<RecommendViewBloc>()),
            BlocProvider.value(value: getIt<RecentBloc>()),
            BlocProvider.value(value: getIt<PackagesBloc>()),
            BlocProvider.value(value: getIt<AllItemsBloc>()),
            BlocProvider.value(value: getIt<FavoriteBloc>()),
            BlocProvider.value(value: getIt<SearchFilterBloc>()),
            BlocProvider.value(value:  getIt<RateBloc>()),
            BlocProvider.value(value:  getIt<ViewBloc>()),

          ],child:
    MaterialApp(
onGenerateRoute: navigator.route,
      debugShowCheckedModeBanner:false ,

        title: 'Flutter Demo',
        theme: ThemeData(

        ),

      )),
    );
  }
}

