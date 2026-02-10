part of 'app_router_routes.dart';

enum AppRouterEnum {
  // Splash
  splash(
    name: 'splash',
    path: '/',
  ),
  // Auth
  language(
    name: 'language',
    path: '/register/language',
  ),
  namee(
    name: 'name',
    path: '/register/name',
  ),
  birthDay(
    name: 'birthDay/',
    path: '/register/birthDay',
  ),
  gender(
    name: 'gender/',
    path: '/register/gender',
  ),
  phoneNumber(
    name: 'phoneNumber',
    path: '/register/phoneNumber',
  ),
  privacyAndPolicy(
    name: 'privacyAndPolicy',
    path: '/register/privacyAndPolicy',
  ),
  login(
    name: 'login',
    path: '/login',
  ),
  wifi(
    name: 'wifi',
    path: '/wifi',
  ),
  // Contacts
  contacts(
    name: 'contacts',
    path: '/contacts',
  ),

  // User
  user(
    name: 'user',
    path: '/user',
  ),
  // Settings
  settings(
    name: 'settings',
    path: '/settings',
  ),

  // Games
  games(
    name: 'games',
    path: '/games',
  ),

  // Main
  main(
    name: 'main',
    path: '/main',
  ),
  categories(
    name: 'categories',
    path: '/categories_:${AppRouterKeys.id}',
  ),
  ;

  final String name;
  final String path;

  const AppRouterEnum({
    required this.name,
    required this.path,
  });
}
