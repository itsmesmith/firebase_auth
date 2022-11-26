import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../bloc/users_cubit.dart';
import '../../../debug_print.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.teal),
                ),
                child: FormBuilderTextField(
                  name: 'email',
                  validator: FormBuilderValidators.required(context),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.teal),
                ),
                child: FormBuilderTextField(
                  name: 'password',
                  validator: FormBuilderValidators.required(context),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    sPrint(_formKey.currentState!.value);
                    final formData = _formKey.currentState!.value;
                    await context.read<AuthCubit>().signIn(
                          emailOrPhone: formData['email'],
                          password: formData['password'],
                          context: context,
                        );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
