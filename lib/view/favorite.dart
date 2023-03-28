import 'package:fasahny/bloc/favorite/favorite_bloc.dart';
import 'package:fasahny/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/favoriteModel.dart';
class Favorite extends StatefulWidget {

   const Favorite( {Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {


  List<FavoriteModel>? listFavorite;
  FavoriteBloc? favoriteBloc;

 
  @override
  void initState() {
    super.initState();
   favoriteBloc= BlocProvider.of<FavoriteBloc>(context);
favoriteBloc!.add(GetFavoriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<FavoriteBloc, FavoriteState>(
  builder: (context, state) {
    if (state is GetFavoriteStat) {
      listFavorite = state.favoriteList;

    return ListView.builder(itemBuilder: (context,index)=>
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 5),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(children: [
                  SizedBox(height: screenSize.height/5,
                    width: screenSize.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://thomas61.pythonanywhere.com${listFavorite![index].item!.images![0].image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                                           ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("${listFavorite![index].item!.title}",
                        style: TextStyle(
                          fontSize: 20.sp,
                        )),
                      Row(
                        children: [IconButton(onPressed: (){
                          print('${listFavorite![index].item!.id}');
                                favoriteBloc!.add(DeleteFavoriteEvent(listFavorite![index].item!.id));
                          setState(() {

                          });
                        }, icon:    Icon(
                          Icons.favorite,
                          color: colorDark,
                          size: 30.sp,
                        ))
                       ,
                          Text(
                            '${listFavorite![index].item!.loves}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black),
                          )
                        ],
                      ),

                    ],
                  ),
                )
                ,


              ],),
        ),itemCount: listFavorite!.length,

);}return const Center(child:  CircularProgressIndicator());
  },
);
  }
}
