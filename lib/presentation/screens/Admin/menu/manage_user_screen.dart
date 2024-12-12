import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/assets_path_util.dart';

import '../../../../main.dart';
import 'user_detail_screen.dart';

class ManageUsersScreen extends ConsumerWidget {
  static const String routeName = '/manage_users';

  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersList = ref.watch(userAdminStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.watch(userAdminStateProvider.notifier).getListUser();
        },
        child: usersList.when(
          data: (users) {
            if (users.result.isEmpty) {
              return const Center(child: Text('No users available.'));
            }

            return ListView.builder(
              itemCount: users.result.length,
              itemBuilder: (context, index) {
                final user = users.result[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: user.profileImgUrl != null &&
                              user.profileImgUrl!.isNotEmpty
                          ? NetworkImage(user.profileImgUrl!)
                          : AssetImage(AssetsPathUtil.user('profile.png'))
                              as ImageProvider,
                      backgroundColor: Colors.grey[200],
                    ),
                    title: Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(user.email),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(user: user),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, stack) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: const Text('Are you sure you want to delete this user?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
