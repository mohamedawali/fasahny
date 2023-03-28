part of 'view_bloc.dart';

@immutable
abstract class ViewEvent {}
class AddViewEvent extends  ViewEvent {
  final int? view;
  final int? itemId;
  AddViewEvent(this. view, this. itemId);
}

