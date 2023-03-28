import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/recommend_recent _model.dart';
import '../../repository/recommend_recent_repo.dart';

part 'recent_event.dart';
part 'recent_state.dart';

class RecentBloc extends Bloc<RecentEvent, RecentState> {
  RecommendRecentRepo? recommendRepo;


  RecentBloc(this.recommendRepo) : super(RecentInitial()) {
    on<RecentEvent>((event, emit)async {
      if(event is GetRecentViewEvent) {
         await getRecentView(emit);

      }
    });
  }
  Future getRecentView(Emitter<RecentState> emit) async{
    await recommendRepo!.getRecentView().then((recentList) => emit(GetRecentViewState(recentList)));


    }
}
