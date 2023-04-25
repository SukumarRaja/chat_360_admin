import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:limitless.chat_admin/Screens/authentication/AdminAuth.dart';
import 'package:limitless.chat_admin/Services/providers/CommonSession.dart';
import 'package:limitless.chat_admin/Services/providers/ConnectivityServices.dart';
import 'package:limitless.chat_admin/Services/providers/FirestoreCOLLECTIONDataProvider.dart';
import 'package:limitless.chat_admin/Services/providers/FirestoreDOCUMENTDataProvider.dart';
import 'package:limitless.chat_admin/Services/providers/Observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:limitless.chat_admin/Services/providers/BottomNavBar.dart';
import 'package:limitless.chat_admin/Services/providers/DownloadInfoProvider.dart';

class AdminApp extends StatelessWidget {
  final DocumentSnapshot<Map<String, dynamic>> doc;
  AdminApp({required this.doc});
  @override
  Widget build(BuildContext context) {
    // MultiProvider for top-level services that can be created right away
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Observer>(
            create: (BuildContext context) {
              return Observer();
            },
          ),

          ChangeNotifierProvider<FirestoreDataProviderREPORTS>(
            create: (BuildContext context) {
              return FirestoreDataProviderREPORTS();
            },
          ),
          ChangeNotifierProvider<FirestoreDataProviderUSERS>(
            create: (BuildContext context) {
              return FirestoreDataProviderUSERS();
            },
          ),
          ChangeNotifierProvider<FirestoreDataProviderCALLHISTORY>(
            create: (BuildContext context) {
              return FirestoreDataProviderCALLHISTORY();
            },
          ),
          ChangeNotifierProvider<FirestoreDataProviderDocNOTIFICATION>(
            create: (BuildContext context) {
              return FirestoreDataProviderDocNOTIFICATION();
            },
          ),

          ChangeNotifierProvider<CommonSession>(
            create: (BuildContext context) {
              return CommonSession();
            },
          ),
          ChangeNotifierProvider<DownloadInfoprovider>(
            create: (BuildContext context) {
              return DownloadInfoprovider();
            },
          ),
          //---- All the above providers are AUTHENTICATION PROVIDER -------

          ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (BuildContext context) {
              return BottomNavigationBarProvider();
            },
          ),
        ],
        child: StreamProvider<ConnectivityStatus>(
            initialData: ConnectivityStatus.Cellular,
            create: (context) =>
                ConnectivityService().connectionStatusController.stream,
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AdminAauth(
                  doc: doc,
                ))));
  }
}
