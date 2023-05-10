import 'package:fasahny/bloc/rate/rate_bloc.dart';
import 'package:fasahny/constant/color.dart';
import 'package:fasahny/models/commentsResponseModel.dart';
import 'package:fasahny/widget/dialoge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../bloc/favorite/favorite_bloc.dart';
import '../bloc/view/view_bloc.dart';
import '../models/recommend_recent _model.dart';
import '../widget/ratingBar.dart';

class ViewDetails2 extends StatefulWidget {
  final RecommendRecentViewModel? viewDetails;

  const ViewDetails2({this.viewDetails, Key? key}) : super(key: key);

  @override
  State<ViewDetails2> createState() => _ViewDetails2State();
}

class _ViewDetails2State extends State<ViewDetails2> {
  RecommendRecentViewModel? viewDetails;

  bool? isFavorites = false;
  String? url;
  List<CommentsResponseModel>? commentsList;
  double? rate;
  FavoriteBloc? favoriteBloc;
  RateBloc? rateBloc;
  YoutubePlayerController? youtubePlayerController;
  @override
  void initState() {
    super.initState();
    viewDetails = widget.viewDetails;
    BlocProvider.of<ViewBloc>(context).add(AddViewEvent(1, viewDetails!.id));
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context)..add(CheckFavoriteEvent(viewDetails!.id));
    BlocProvider.of<RateBloc>(context).add(GetComments(viewDetails!.id));

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

      expandedHeight: screenSize.height / 2.5,
      stretch: true,
      pinned: true,
      title: Text(
        '${viewDetails!.title}',
        style: GoogleFonts.manrope(
            textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: colorDark,
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
                    style: GoogleFonts.manrope(
                        textStyle: TextStyle(fontSize: 20.sp)),
                  ),
                ),
                Expanded(
                  //   child:
                  //   BlocListener<FavoriteBloc, FavoriteState>(
                  // listener: (context, state) {
                  //   if (state is CheckFavoriteStat) {
                  //     setState(() {
                  //       isFavorites = state.isFavorite;
                  //     });
                  //   }
                  // },
                  child: BlocBuilder<FavoriteBloc, FavoriteState>(
  builder: (context, state) {
    if (state is CheckFavoriteStat) {
      isFavorites = state.isFavorite;

                      }else if(state is AddFavoriteStat&&state.add==200){
    isFavorites= !isFavorites!;

    }
    return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            favoriteBloc!
                                .add(AddFavoriteEvent(viewDetails!.id));

                          },
                          icon: isFavorites!
                              ?  Icon(
                                  Icons.favorite,
                                  color: colorDark
                                )
                              :  Icon(
                                  Icons.favorite_outline,
                                  color: colorDark,
                                )),
                      Text('${viewDetails!.loves}')
                    ],
                  );
  },
),
                )
              ]),
              Divider(
                thickness: 1,
                color: colorLight,
              ),
              Text('Description',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold))),
              SizedBox(
                height: 10.sp,
              ),
              ReadMoreText(
                "${viewDetails!.description}",
                style: GoogleFonts.abel(fontSize: 16.sp),
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
              Divider(
                thickness: 1,
                color: colorLight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gallery',
                      style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold))),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              SizedBox(
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
              Divider(
                thickness: 1,
                color: colorLight,
              ),
              Text('Location',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold))),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: colorDark,
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text(
                    "${viewDetails!.location}",
                    style: GoogleFonts.abel(fontSize: 16.sp),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: colorLight,
              ),
              Text(
                'Opining Hours',
                style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: colorDark,
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text(
                    'From ',
                    style: GoogleFonts.abel(),
                  ),
                  Text('${viewDetails!.workinghoursFrom}.am'),
                  Text(
                    ' To ',
                    style: GoogleFonts.abel(),
                  ),
                  Text('${viewDetails!.workinghoursTo}.pm')
                ],
              ),
              Divider(
                thickness: 1,
                color: colorLight,
              ),
              Text('Ticket Price',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold))),
              SizedBox(
                height: 10.sp,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Egyption : ',
                    style: GoogleFonts.abel(
                        textStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black))),
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
                    style: GoogleFonts.abel(
                        textStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black))),
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
                    style: GoogleFonts.abel(
                        textStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black))),
                TextSpan(
                    text: "${viewDetails!.ticketPriceForForeing}",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black))
              ])),
              Divider(
                thickness: 1,
                color: colorLight,
              ),
              Text(
                'Review',
                style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10.sp,
              ),
              BlocBuilder<RateBloc, RateState>(
                builder: (context, state) {
                  if (state is GetCommentsState) {
                    commentsList = state.commentsResponse;
                    if (commentsList!.isEmpty) {
                      return const SizedBox();
                    } else {
                      return Container(
                        height: 84.h,
                        color: Colors.grey[200],
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: commentsList!.length,
                            itemBuilder: (context, index) => Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: SizedBox(
                                    width: 220.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${commentsList![index].user}',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          ratingBar(
                                              commentsList![index]
                                                  .rate!
                                                  .toDouble(),
                                              20),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            commentsList![index].comment ?? '',
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      );
                    }
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => showDialogo(
                      context,
                      screenSize,
                      viewDetails!.id,
                    ),
                    child: ratingBar(rate!, 20),
                  ),
                  Text(
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
