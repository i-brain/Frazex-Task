import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/image/image_cubit.dart';
import 'package:task/constants/app_colors.dart';
import 'package:task/presentation/pages/home/widgets/image_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pix Image'),
      ),
      backgroundColor: AppColors.navyGrey,
      body: RefreshIndicator(
        onRefresh: () => context.read<ImageCubit>().fetchImages(),
        child: BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            print(state);
            if (state is ImageSuccess) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / (size.height * 0.01),
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
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
