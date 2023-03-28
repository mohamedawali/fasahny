import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository/viewRepo.dart';

part 'view_event.dart';
part 'view_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  final ViewRepo? _viewRepo;
  ViewBloc(this._viewRepo) : super(ViewInitial()) {
    on<ViewEvent>((event, emit) async{
      if (event is AddViewEvent) {
        await addView(emit, event.view, event.itemId);
      }
    });
  }
  addView(Emitter<ViewState> emit, int? view, int? itemId) async {
    await _viewRepo!.addView(view!, itemId!);
    emit(AddViewState());
  }

}
