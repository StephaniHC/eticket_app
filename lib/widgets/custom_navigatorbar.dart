 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ui_provider.dart'; 

class CustomNavigatonBar extends StatelessWidget { 

  @override 
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon( Icons.map ),
          label: 'Ticket'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.arrow_circle_left ),
          label: 'Back'
        ),
      ],
    );
  }
}

