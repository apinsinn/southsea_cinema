import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column (crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Shrek (2001) (PG)',
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      
        
        Container(
          padding:EdgeInsets.only(top: 10, bottom: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'A grumpy ogres peaceful swamp is overrun by fairy-tale creatures, how will he get them out?', 
            style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            ),
          ),
         ),
        ]),
        
    ));
    
  }
}
