import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/providers/users_provider.dart';

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
    return Consumer<UserProvider>(
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
            return ListTile(
              horizontalTitleGap: 20,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
              title: Text(user.firstName),
              subtitle: Text(user.email),
            );
          },
        );
      },
    );
  }

  void getData() {
    final provider = get<UserProvider>();
    provider.getUsers();
  }
}
