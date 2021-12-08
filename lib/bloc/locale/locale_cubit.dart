import 'package:bloc/bloc.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super('en');

  void changeLanguage(String languageCode) {
    emit(languageCode);
  }
}
