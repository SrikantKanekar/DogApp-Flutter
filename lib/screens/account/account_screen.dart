import 'package:dog_app/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme
                  .of(context)
                  .primaryColorLight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 35,
                  ),
                  Text(auth.getUser!.username),
                  Text(auth.getUser!.email),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  auth.logout();
                },
              ),
            )
          ],
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Favourites Count: 0',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              auth.deleteAccount();
            },
          ),
        ),
      ],
    );
  }
}
