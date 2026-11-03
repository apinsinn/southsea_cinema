import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieCard extends StatelessWidget {
    final Movie movie;

    const MovieCard({super.key, required this.movie});

    @override 
    Widget build(BuildContext context) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          movie.image_url,
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.synopsis,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    )
                  ]
                )
                    ),
           const SizedBox(width: 8),
            

                      
                      ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('£${ticketPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),
                        ElevatedButton(onPressed: (){}, child: const Text('Book Now')
                      ), ]
              )
                  ],
          )));
            
        
    }
                   


}