part of 'random_image_bloc.dart';

@immutable
abstract class RandomImageState {}

class RandomImageInitial extends RandomImageState {}

class LoadedRandomImage extends RandomImageState {
  final List<RandomIMageResponseModel> imageList;
  LoadedRandomImage(this.imageList);
}