import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/image/image_cubit.dart';
import 'package:task/bloc/locale/locale_cubit.dart';
import 'package:task/constants/routes.dart';
import 'package:task/data/contractors/i_image_repository.dart';
import 'package:task/data/repositories/image_repository.dart';
import 'package:task/presentation/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IimageRepository>(
      create: (_) => ImageRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ImageCubit>(
            create: (context) => ImageCubit(
              imageRepository: RepositoryProvider.of<IimageRepository>(context),
            )..fetchImages(),
          ),
          BlocProvider(
            create: (context) => LocaleCubit(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, String>(
          builder: (context, state) {
            print(state);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(state),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              theme: ThemeData(
                primarySwatch: Colors.blueGrey,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                ),
              ),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: Routes.home,
            );
          },
        ),
      ),
    );
  }
}
