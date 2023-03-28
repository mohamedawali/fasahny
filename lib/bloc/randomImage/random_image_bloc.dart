import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/randomImagrRespons.dart';
import '../../repository/rendomImageRepo.dart';

part 'random_image_event.dart';
part 'random_image_state.dart';

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  final RandomImageRepo? _randomImageRepo;


  RandomImageBloc(this._randomImageRepo) : super(RandomImageInitial()) {
    on<RandomImageEvent>((event, emit) async {
      if (event is GetRandomImage) {
        await getRandomImage(emit);
      }
    });
  }

  Future getRandomImage(Emitter<RandomImageState> emit) async {
    await _randomImageRepo!.randomImage().then((value) {
      emit(LoadedRandomImage(value));
    });
  }
}