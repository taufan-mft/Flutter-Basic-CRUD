import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Image.network("https://images.unsplash.com/photo-1601412436967-8b2d90944ded?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
            height: 140, width: 140, fit: BoxFit.cover,
            ),
            SizedBox(height:10),
            Text('Nurul Iklima', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
