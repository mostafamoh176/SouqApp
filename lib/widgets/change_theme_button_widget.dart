import 'package:flutter/material.dart';
import 'package:e_commerce/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      // activeTrackColor:Color(0xff746bc9),
      activeColor:  Color(0xff746bc9),
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider=Provider.of<ThemeProvider>(context,listen:false );
        provider.toggleTheme(value);

      },
    );
  }
}
