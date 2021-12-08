import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/locale/locale_cubit.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 8),
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.translate,
          color: Colors.white,
        ),
        underline: const SizedBox(),
        onChanged: (value) {},
        items: [
          DropdownMenuItem<String>(
            child: const Text('English'),
            value: 'en',
            onTap: () => context.read<LocaleCubit>().changeLanguage('en'),
          ),
          DropdownMenuItem<String>(
            child: const Text('Azərbaycan'),
            value: 'az',
            onTap: () => context.read<LocaleCubit>().changeLanguage('az'),
          ),
        ],
      ),
    );
  }
}
