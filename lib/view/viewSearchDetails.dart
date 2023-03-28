import 'package:fasahny/widget/ratingBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../bloc/favorite/favorite_bloc.dart';
import '../bloc/rate/rate_bloc.dart';
import '../constant/color.dart';
import '../models/allItemsResponse.dart';
import '../models/commentsResponseModel.dart';
import '../widget/dialoge.dart';


class ViewSearchDetails extends StatefulWidget {

final  Items? viewDetails;
 const ViewSearchDetails({this.viewDetails, Key? key}) : super(key: key);

  @override
  State<ViewSearchDetails> createState() => _ViewSearchDetailsState();
}

class _ViewSearchDetailsState extends State<ViewSearchDetails> {
  Items? viewDetails;
  bool? isFavorites=false;
  String? url;
  List<CommentsResponseModel>? commentsList;
  double? rate;
  FavoriteBloc? favoriteBloc;
  RateBloc? rateBloc;
  YoutubePlayerController? youtubePlayerController;




  @override
  void initState() {
    super.initState();
   viewDetails= widget.viewDetails;
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    favoriteBloc!.add(CheckFavoriteEvent(viewDetails!.id));
    rate = viewDetails!.avgOfRating;
    url = YoutubePlayer.convertUrlToId('${viewDetails!.videolink}');
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: url!, flags: const YoutubePlayerFlags(autoPlay: true));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppbar(screenSize, context),
          sliverList(context, screenSize)
        ],
      ),
    );
  }

  Widget sliverAppbar(Size screenSize, BuildContext context) {
    return SliverAppBar(
      title: Text(
        '${viewDetails!.title}',
        style: GoogleFonts.manrope(
            textStyle:
            TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
      ),
      expandedHeight: screenSize.height / 2.5,
      stretch: true,
      pinned: true,
      backgroundColor:  colorDark,
      flexibleSpace: FlexibleSpaceBar(
          background: YoutubePlayer(
              controller: youtubePlayerController!,
              progressIndicatorColor: Colors.cyanAccent,
              progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                  backgroundColor: Colors.grey))),
    );
  }

  Widget sliverList(BuildContext context, Size screenSize) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: Text(
                    "${viewDetails!.title}",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                Expanded(child:
                BlocListener<FavoriteBloc, FavoriteState>(
                    listener: (context, state) {
                      if (state is CheckFavoriteStat) {
                       setState(() {
    isFavorites=  state.isFavorite;
                       });}},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {favoriteBloc!.add(AddFavoriteEvent(viewDetails!.id));

                                  setState(() {

                                  });
                                },
                                icon: isFavorites!
                                    ?  Icon(
                                  Icons.favorite,
                                  color:colorDark,
                                )
                                    :  Icon(
                                  Icons.favorite_outline,
                                  color: colorDark,
                                )),
                            Text('${viewDetails!.loves}')
                          ],
                        )


                    ))
              ]),

              const Divider(
                thickness: 1,
              ),
              Text('Description',
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.sp,
              ),
              ReadMoreText(
                "${viewDetails!.description}",
                trimLines: 3,
                // trimExpandedText: 'show less',
                //trimCollapsedText: 'show more',
                trimMode: TrimMode.Line,
                moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                lessStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Divider(
                thickness: 1,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gallery',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text('View All',
                          style: TextStyle(
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline)))
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              Container(
                  height: screenSize.height / 5,
                  child: ListView.builder(
                    physics: const PageScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                        elevation: 10,
                        color: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "${viewDetails!.images![index].image}",
                            fit: BoxFit.cover,
                          ),
                        )),
                    itemCount: viewDetails!.images!.length,
                  )),
              const Divider(
                thickness: 1,
              ),

              Text('Location',
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text("${viewDetails!.location}")
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Text('Opining Hours',
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined),
                  SizedBox(
                    width: 5.sp,
                  ),
                  const Text('From '),
                  Text('${viewDetails!.workinghoursFrom}.am'),
                  const Text(' To '),
                  Text('${viewDetails!.workinghoursTo}.pm')
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Text('Ticket Price',
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.sp,
              ),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Egyption : ',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                    TextSpan(
                        text: "${viewDetails!.ticketPriceForEgyptions}",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black))
                  ])),
              const SizedBox(
                height: 5,
              ),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Egyption Student : ',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                    TextSpan(
                        text: "${viewDetails!.ticketPriceForStudents}",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black))
                  ])),
              const SizedBox(
                height: 5,
              ),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Foreign : ',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                    TextSpan(
                        text: "${viewDetails!.ticketPriceForForeing}",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black))
                  ])),
              const Divider(
                thickness: 1,
              ),
              Text('Review',
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.sp,
              ),
        BlocBuilder<RateBloc, RateState>(

          builder: (context, state) {
            if(state is GetCommentsState){
              commentsList = state.commentsResponse;
              if(commentsList!.isEmpty){
                return const SizedBox();
              }else{
                return Container(
                  height:84.h,
                  color: Colors.grey[200],
                  child:


                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: commentsList!.length,
                      itemBuilder: (context, index) =>
                          Card(elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: SizedBox(

                              width: 220.w,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${commentsList![index].user}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    ratingBar(commentsList![index].rate!.toDouble(),20),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      commentsList![index].comment ?? '', maxLines: 2,
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                                                  )

                  ),
                );}}return const SizedBox();
          },
        ),
        const SizedBox(height: 15,),
              Row(
                children: [
                  InkWell(
                    onTap: () => showDialogo(context, screenSize,viewDetails!.id),
               child:   ratingBar(rate!, 30)
    )

                  ,Text(
                    '($rate)',
                    style: TextStyle(fontSize: 18.sp),
                  )
                ],
              ),
            ],
          ),
        ),

        SizedBox(
          height: 20.sp,
        )
      ]),
    );
  }


}
