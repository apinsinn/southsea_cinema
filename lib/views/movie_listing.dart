import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}
class _MovieListingState extends State<MovieListing> {
  int _selectedQuantity = 0;

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
      body:
        Padding(padding: EdgeInsets.only(top: 10.0, bottom: 12.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:  [Text('Shrek (2001) (PG)',
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      
        Row(
          children: [
           Expanded(
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
             children:  [ 
              Container(
               padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
               alignment: Alignment.centerLeft,
               child:  Text(
                'A grumpy ogres peaceful swamp is overrun by fairy-tale creatures, how will he get them out?', 
                 style: TextStyle(
                 fontSize: 15,
                 fontStyle: FontStyle.italic,
            ),
          ),
         ),
         Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 12.0, left: 10.0, right: 10.0),
                  child: Text('Showtime on the 13th of October at Richmond building, ',
                      style: TextStyle(
                        fontSize: 15,
                         fontStyle: FontStyle.italic,
              ),
            ),
        ),
         Padding(

              padding: EdgeInsets.only(top: 30.0, bottom:10.0, left: 10.0, right: 10.0),
              child: Text('Select Quantities (Up to 5 in total)' ,
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
        )])),


        
        ]),

   
        Padding(
          padding: const EdgeInsets.only(left:10, top:50),
          child: Row(
            children:[DropdownMenu<int>(
             initialSelection: 0,
            onSelected: (int? value) {
              if (value !=  null) {
                setState((){
                  _selectedQuantity = value;
                });
              }
            },

          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 0, label: '0'),
            DropdownMenuEntry(value: 1, label: '1'),
            DropdownMenuEntry(value: 2, label: '2'),
            DropdownMenuEntry(value: 3, label: '3'),
            DropdownMenuEntry(value: 4, label: '4'),
            DropdownMenuEntry(value: 5, label: '5'),
          ],
        ),
              
        const SizedBox(width: 15),
                const Text('Adult (£7.50)', 
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ))]))])));
              }
        }
        