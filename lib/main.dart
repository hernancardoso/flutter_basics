import 'package:flutter/material.dart';
import 'package:newapp/providers/authentication.dart';
import 'package:newapp/providers/estado.dart';
import 'package:newapp/screens/hello.dart';
import 'package:newapp/screens/login.dart';
import 'package:newapp/screens/register.dart';
import 'package:newapp/screens/settings_screen.dart';
import 'package:newapp/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    dynamic page;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Estado(),
        ),
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/register',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            page = TabsScreen();
          }
          if (settings.name == '/login') {
            page = Login();
          }
          if (settings.name == "/hello") {
            page = Hello();
          }
          if (settings.name == "/settings") {
            page = Settings();
          }
          if (settings.name == "/register") {
            page = Register();
          }

          /*
          // Handle '/details/:id'
          var uri = Uri.parse(settings.name ?? "");
          if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'details') {
            var id = uri.pathSegments[1];
            return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
          }
          */

          /*
            Get arguments passed as parameters in routeName
            ex: blabla.routeName(name, arguments: {id : 2})
            retreive id doing:
            final args = settings.arguments;
            args["id"] ??
          */
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
      ),
    );
  }
}
