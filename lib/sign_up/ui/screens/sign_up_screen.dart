import 'package:firebase_prac/app_dependency_tree.dart';
import 'package:firebase_prac/sign_up/ui/state/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignUpCubit _cubit = injection<SignUpCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await _cubit.userSignUp(
          email: _emailController.text,
          password: _passwordController.text,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocBuilder<SignUpCubit, SignUpState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is SignUpLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SignUpFailure) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is SignUpSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 7),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 7),
                  ElevatedButton(
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.length >= 6) {
                        BlocProvider.of<SignUpCubit>(context).userSignUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        _emailController.clear();
                        _passwordController.clear();
                      } else {}
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
