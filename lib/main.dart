import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeChanger>(
    create: (_) => ThemeChanger(),
    child: MyApp(),
  ),
);

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData = CustomTheme.lightTheme;

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
  );

  static ThemeData purpleTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.purpleAccent,
  );

  static ThemeData orangeTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.orangeAccent,
  );

  static ThemeData greenTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.greenAccent,
  );

  static ThemeData redTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.redAccent,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    // Define the app bar color based on the selected theme
    Color appBarColor = themeChanger.themeData.primaryColor;

    return MaterialApp(
      title: 'Flutter Theme Demo',
      theme: themeChanger.themeData,
      home: HomeScreen(
        appBarColor: appBarColor,
        onThemeChanged: (Color newColor) {
          appBarColor = newColor;
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color appBarColor;
  final Function(Color) onThemeChanged;

  HomeScreen({required this.appBarColor, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Demo'),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                themeChanger.setTheme(CustomTheme.lightTheme);
                // Update the app bar color when the theme changes
                onThemeChanged(CustomTheme.lightTheme.primaryColor);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Light Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                themeChanger.setTheme(CustomTheme.darkTheme);
                // Update the app bar color when the theme changes
                onThemeChanged(CustomTheme.darkTheme.primaryColor);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set the "Dark Theme" button to black
              ),
              child: Text('Dark Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                themeChanger.setTheme(CustomTheme.purpleTheme);
                // Update the app bar color when the theme changes
                onThemeChanged(CustomTheme.purpleTheme.primaryColor);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              child: Text('Purple Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                themeChanger.setTheme(CustomTheme.orangeTheme);
                // Update the app bar color when the theme changes
                onThemeChanged(CustomTheme.orangeTheme.primaryColor);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: Text('Orange Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                themeChanger.setTheme(CustomTheme.greenTheme);
                // Update the app bar color when the theme changes
                onThemeChanged(CustomTheme.greenTheme.primaryColor);
              },
              style: ElevatedButton.styleFrom(
               primary: Colors.green,
              ),
              child: Text('Green Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                themeChanger.setTheme(CustomTheme.redTheme);
                // Update the app bar color when the theme changes
                onThemeChanged(CustomTheme.redTheme.primaryColor);
              },
              style: ElevatedButton.styleFrom(
                 primary: Colors.red,
              ),
              child: Text('Red Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
