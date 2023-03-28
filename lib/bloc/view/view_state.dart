part of 'view_bloc.dart';

@immutable
abstract class ViewState {}

class ViewInitial extends ViewState {}
class AddViewState extends ViewState {

  AddViewState();
}
