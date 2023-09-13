import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_prac/app_dependency_tree.dart';
import 'package:firebase_prac/firebase_options.dart';
import 'package:firebase_prac/sign_up/ui/screens/sign_up_screen.dart';
import 'package:firebase_prac/sign_up/ui/state/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initAppDependencyTree();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        injection(),
      ),
      child: const MaterialApp(
        home: SignUpScreen(),
      ),
    );
  }
}
