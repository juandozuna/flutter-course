import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/account/user_form_page.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/theme/theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.noUsers) {
            return const Center(child: Text('No users found'));
          }

          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              final user = provider.users[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        provider.deleteUser(index);
                      },
                      icon: Icons.delete,
                      label: 'Delete',
                      backgroundColor: AppColor.danger,
                    ),
                  ],
                ),
                child: ListTile(
                  horizontalTitleGap: 20,
                  leading: user.avatar != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar!),
                        )
                      : null,
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(UserFormPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void getData() {
    final provider = get<UserProvider>();
    provider.getUsers();
  }
}
