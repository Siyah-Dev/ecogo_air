import 'package:exogo/features/home/di/home_providers.dart';
import 'package:exogo/features/home/presentation/controllers/home_controller.dart';
import 'package:exogo/features/home/presentation/controllers/home_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(ref.read(homeUseCaseProvider)),
);