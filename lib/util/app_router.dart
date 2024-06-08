import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:marshmallow/presentation/page/category_page.dart';
import 'package:marshmallow/presentation/page/text_page.dart';

class AppRouter {
  static final _rootKey = GlobalKey<NavigatorState>();
  static final _shellKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: "/",
    routes: [
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) {
          return child;
        },
        routes: [
          GoRoute(
              path: '/',
              parentNavigatorKey: _shellKey,
              builder: (context, state) => const CategoryPage()
           //   pageBuilder: (context, state) => const NoTransitionPage(child: CategoryPage())
          ),
          GoRoute(
              path: '/text',
              parentNavigatorKey: _shellKey,
         builder: (context, state) => const TextPage()
         //     pageBuilder: (context, state) => const NoTransitionPage(child: TextPage())
          ),
          GoRoute(
              path: '/image',
              parentNavigatorKey: _shellKey,
              pageBuilder: (context, state) => const NoTransitionPage(child: Text("Image"))
          ),
          GoRoute(
              path: '/finger',
              parentNavigatorKey: _shellKey,
              pageBuilder: (context, state) => const NoTransitionPage(child: Text("Fingerprint"))
          ),
        ]
      )
    ]
  );
}