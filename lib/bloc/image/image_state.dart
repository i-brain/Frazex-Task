part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageSuccess extends ImageState {
  final List<ImageResponse> list;

  const ImageSuccess({required this.list});
}

class ImageError extends ImageState {
  final String? errorMessage;

  const ImageError(this.errorMessage);
}
