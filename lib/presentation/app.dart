import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/image/image_cubit.dart';
import 'package:task/constants/routes.dart';
import 'package:task/data/contractors/i_image_repository.dart';
import 'package:task/data/repositories/image_repository.dart';
import 'package:task/presentation/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IimageRepository>(
      create: (_) => ImageRepository(),
      child: BlocProvider<ImageCubit>(
        create: (context) => ImageCubit(
          imageRepository: RepositoryProvider.of<IimageRepository>(context),
        )..fetchImages(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: Routes.home,
        ),
      ),
    );
  }
}
