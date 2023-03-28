import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fasahny/models/recommend_recent _model.dart';
import 'package:fasahny/repository/recommend_recent_repo.dart';
import 'package:meta/meta.dart';

part 'recommend_view_event.dart';
part 'recommend_view_state.dart';

class RecommendViewBloc extends Bloc<RecommendViewEvent, RecommendViewState> {
  RecommendRecentRepo? recommendRepo;
  RecommendViewBloc(this.recommendRepo) : super(RecommendViewInitial()) {
    on<RecommendViewEvent>((event, emit) async{
      if(event is GetRecommendViewEvent){
  await getRecommendView(emit);

      }

    });
  }

Future  getRecommendView(Emitter<RecommendViewState> emit) async{

    await recommendRepo!.getRecommendView().then((recommendList) => emit(GetRecommendViewState(recommendList)));
  }

}
