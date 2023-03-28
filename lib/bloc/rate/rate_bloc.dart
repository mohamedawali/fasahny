import 'package:bloc/bloc.dart';
import 'package:fasahny/models/responseRateModel.dart';
import 'package:fasahny/repository/rateRepo.dart';
import 'package:meta/meta.dart';

import '../../models/commentsResponseModel.dart';

part 'rate_event.dart';
part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final RateRepo? _rateRepo;
  RateBloc(this._rateRepo) : super(RateInitial()) {
    on<RateEvent>((event, emit) async{
     if(event is AddRate){

       await addRate(emit ,event.itemId,event.comment,event.stars);
     }
    else if(event is GetComments){

       await getComments(emit ,event.itemId);}

    });
  }

  addRate(Emitter<RateState> emit,int? itemId,String? comment, double? stars) async{
  await  _rateRepo!.addRate(itemId,comment,stars).then((data) =>  emit(RateAdd(data)));

  }

  getComments(Emitter<RateState> emit, int? itemId) async{

     await _rateRepo!.getComments(itemId).then((comments) {

      emit(GetCommentsState(comments));}

    );

  }
}
