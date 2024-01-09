import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/theme/theme_provider.dart';

class CustomSwitch extends ConsumerWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Row(
      children: [
        Text(themeData.isDarkMode ? 'Dark Mode' : 'Light Mode',
            style: TextStyle(fontSize: 15.sp)),
        Transform.scale(
          scale: 0.85,
          child: Switch(
            activeColor: Colors.transparent,
            inactiveThumbColor: const Color.fromRGBO(0, 0, 0, 0),
            activeTrackColor: Colors.white,
            thumbColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.white.withOpacity(.48);
              }
              return Colors.white;
            }),
            activeThumbImage: const AssetImage('assets/icons/dark.png'),
            inactiveThumbImage: const AssetImage('assets/icons/light.png'),
            value: themeData.isDarkMode,
            onChanged: (value) {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
        ),
      ],
    );
  }
}
