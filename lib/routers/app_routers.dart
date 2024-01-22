
part of 'app_pages.dart';
abstract class Routers{
Routers._();
static const HOME=_paths.HOME;
static const SPLASH=_paths.SPLASH;
static const FIRST=_paths.FIRST;
}

abstract class _paths{
  _paths._();
  static const HOME='/home';
  static const SPLASH='/splash';
  static const FIRST='/first';
}