import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../bloc/users_cubit.dart';
import '../../../debug_print.dart';
import '../../../model/user_model.dart';

class RegisterUser extends StatelessWidget {
  RegisterUser({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register User'),
        ),
        body: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: FormBuilderTextField(
                    name: 'name',
                    validator: FormBuilderValidators.required(context),
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: InputBorder.none,
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
                    name: 'age',
                    validator: FormBuilderValidators.required(context),
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      border: InputBorder.none,
                    ),
                    // validator: FormFieldValidators,
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
                    name: 'mobile',
                    validator: FormBuilderValidators.required(context),
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                      border: InputBorder.none,
                    ),
                    // validator: FormFieldValidators,
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
                    name: 'address',
                    validator: FormBuilderValidators.required(context),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Address',
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
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      sPrint(_formKey.currentState!.value);
                      final formData = _formKey.currentState!.value;
                      final userModel = UserModel(
                        name: formData['name'],
                        age: int.parse(formData["age"]),
                        address: formData['address'],
                        email: formData['email'],
                      );
                      context.read<AuthCubit>().createUser(
                            userModel: userModel,
                            context: context,
                            password: formData['password'],
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
        ));
  }
}
