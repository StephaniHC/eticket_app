import 'package:eticket_app/provider/scan_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        child: ListTile( 
          title: Text( scans[i].dato), 
        ),
      )
    );


  }
}