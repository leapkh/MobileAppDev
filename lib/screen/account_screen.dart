import 'package:ecom/model/user.dart';
import 'package:ecom/provider/api_provider.dart';
import 'package:ecom/screen/login_screen.dart';
import 'package:ecom/utlity/utils.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    if (ApiProvider.instance.user == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You are not logged in yet.'),
            FlatButton(
                onPressed: () async {
                  /*final route =
                      MaterialPageRoute(builder: (context) => LoginScreen());
                  final resultTask = Navigator.of(context).push(route);
                  resultTask.then((result) {
                    if (result != null) {
                      setState(() {
                        _user = result;
                      });
                    } else {
                      print('No login');
                    }
                  });*/

                  final route =
                      MaterialPageRoute(builder: (context) => LoginScreen());
                  final result = await Navigator.of(context).push(route);
                  if (result == true) {
                    setState(() {});
                  } else {
                    print('No login');
                  }
                },
                child: Text('Log In'))
          ],
        ),
      );
    }

    return ListView(
      children: [
        Row(
          children: [
            Image.network(
              'https://rupp-ite.s3-ap-southeast-1.amazonaws.com/acer-monitor.jpg',
              width: 200,
              height: 200,
            ),
            Column(
              children: [
                Text(ApiProvider.instance.user.name),
                Text(ApiProvider.instance.user.email),
                FlatButton(onPressed: () {}, child: Text('Edit Profile')),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        ApiProvider.instance.logout();
                      });
                    },
                    child: Text('Log Out'))
              ],
            )
          ],
        )
      ],
    );
  }
}
