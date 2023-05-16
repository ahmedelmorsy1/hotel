import 'package:hotel/barallel_file.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;
  SlideLeftRoute({required this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          Tween<Offset> offsetTween = Tween<Offset>(
              begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
          final Animation<Offset> slideInFromTheRightAnimation =
              offsetTween.animate(animation);
          return SlideTransition(
              position: slideInFromTheRightAnimation, child: child);
        });
}


class SlideTopRoute extends PageRouteBuilder {
  final Widget widget;
  SlideTopRoute({required this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return  SlideTransition(
          position:  Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  );
}

class SlideBottomRoute extends PageRouteBuilder {
  final Widget widget;
  SlideBottomRoute({required this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return  SlideTransition(
          position:  Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
       // transitionDuration:Duration(seconds: 1);
      }

  );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleRoute({required this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return  ScaleTransition(
            scale:  Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.5,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: const Interval(
                    0.50,
                    1.00,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: child,
            ),
          );
        });
}

class SlideSideMoveRoute extends PageRouteBuilder {
  final Widget widget;
  SlideSideMoveRoute({required this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        Animation<Offset> custom= Tween<Offset>(
            begin:const Offset(1.0,1.0),end: const Offset(0.0,0.0)).animate(animation);
        return SlideTransition(
            position: custom,
        child: child);
      }
  );
}