import 'package:demo/bloc/users_cubit.dart';
import 'package:demo/debug_print.dart';
import 'package:demo/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/user_services.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().logout(context: context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'LogOut',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              StreamBuilder<List<UserModel>>(
                  stream: UserServices().getAllUsers(),
                  builder: (context, snapshot) {
                    List<UserModel>? usersList = [];
                    if (snapshot.hasData) {
                      usersList = snapshot.data;
                    }
                    if (snapshot.hasError) {
                      sPrint(snapshot.error.toString());
                    }

                    return Expanded(
                      child: ListView.separated(
                        itemCount: usersList!.length,
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(usersList![index].name!),
                                    usersList[index].age != null ? Text(usersList[index].age.toString()) : const SizedBox(),
                                    usersList[index].address != null ? Text(usersList[index].address!) : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
