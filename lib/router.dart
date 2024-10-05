import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/features/home/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  // Home
  GoRoute(
      path: AppRouting.home,
      name: AppRouting.home,
      builder: (context, state) => const HomeScreen()),
]);
