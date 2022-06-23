import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapas/app/ui/pages/request_permission/request_permission_controller.dart';
import 'package:mapas/app/ui/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({Key? key}) : super(key: key);

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _subscription= _controller.onStatusChanged.listen((status) {
     if(status ==PermissionStatus.granted){
       Navigator.pushReplacementNamed(context, Routes.HOME);
       print("aca estamos conio");
       print(status);
     }
    },
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text("Allow"),
            onPressed: (){
              _controller.request();
            },
          ),
        ),
      ),
    );
  }
}
