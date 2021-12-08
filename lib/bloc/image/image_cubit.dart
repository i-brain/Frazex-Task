import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/data/contractors/i_image_repository.dart';
import 'package:task/data/models/response/image_body.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit({
    required this.imageRepository,
  }) : super(ImageInitial());

  final IimageRepository imageRepository;

  Future<void> fetchImages() async {
    emit(ImageLoading());

    final succesOrError = await imageRepository.fetchImages();

    if (succesOrError.isSuccess()) {
      emit(
        ImageSuccess(list: succesOrError.getSuccess()!),
      );
    } else {
      emit(
        ImageError(succesOrError.getError()),
      );
    }
  }
}
