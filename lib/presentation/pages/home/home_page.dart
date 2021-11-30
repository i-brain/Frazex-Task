import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/image/image_cubit.dart';
import 'package:task/constants/app_colors.dart';
import 'package:task/presentation/pages/home/widgets/image_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pix Image'),
        centerTitle: true,
      ),
      backgroundColor: AppColors.navyGrey,
      body: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          print(state);
          if (state is ImageSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: state.list.length,
                itemBuilder: (context, index) =>
                    ImageCard(imageResponse: state.list[index]),
              ),
            );
          }
          if (state is ImageError) {
            return Center(
              child: Text(state.errorMessage ?? 'Server error happened'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
