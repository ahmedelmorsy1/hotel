
import 'package:hotel/barallel_file.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor:Colors.black,
    hintColor:const Color.fromARGB(206, 41, 28, 126),
    brightness:Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255) ,
    appBarTheme: const AppBarTheme(centerTitle: true,
    color: Color.fromARGB(255, 76, 170, 170),
    elevation: 1.0,
    
      titleTextStyle: TextStyle(
        color:Colors.white,fontSize:20,
        fontWeight: FontWeight.w500,
     ),),
    textTheme:   const TextTheme(
      bodyMedium: TextStyle(
            height:1.5,
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      disabledColor: Colors.grey[400],
      textTheme :ButtonTextTheme.primary
    ),
    // listTileTheme: const ListTileThemeData(textColor: Colors.black
    // ,horizontalTitleGap:0.2,
    // contentPadding:EdgeInsets.all(0.5),
    // minVerticalPadding:0.5,
    // )
  );
}