import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/models/basket_item.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;
  const MovieListing({super.key
  , required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _selectedQuantity = 0;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle)
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
           child:Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 12.0, left: 10.0, right: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.movie.title,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 30, bottom: 10, left: 10, right: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.movie.synopsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30.0, bottom: 12.0, left: 10.0, right: 10.0),
                        child: Text(
                          'Screening Time: ${widget.movie.screeningTime}',
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Text(
                          'Select Quantities (Up to 6 in total)',
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    ])),
              ]),
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 50),
                  child: Column(children: [
                    DropdownMenu<int>(
                      initialSelection: 0,
                      onSelected: (int? value) {
                        if (value != null) {
                          setState(() {
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
                    const SizedBox(height: 15),
                        Text('Adult (${widget.movie.formattedPrice})',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 10, left: 10, right: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryButton(
                                label: 'Add to Order',
                                onPressed: () {
                                  
                                    final basketRepository = BasketRepository();

                                    basketRepository.addItem(BasketItem(
                                      movie: widget.movie,
                                      quantity: _selectedQuantity,
                                    ),);

                                    setState(() {
                                    _bookingMessage =
                                        'You have added $_selectedQuantity tickets for ${widget.movie.title} to your order.';
                                  });
                                    
                                        
                                
                                      
                                },
                                
                              ),
                              const SizedBox(height: 10),
                              Text(_bookingMessage),
                            ],
  
                  ))
            ]))]))
        )
    );
  }
}
