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
                          movie.imageUrl,
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
                        color: Color.fromARGB(221, 3, 29, 47),
                       ),
                     ),
                     const SizedBox(height: 8),
                     Text('Age Rating: ${movie.ageRating}', style: const TextStyle( color:  Color.fromARGB(255, 0, 0, 0))),

                     const SizedBox(height: 8),
                     Text('Screening Time: ${movie.screeningTime}', style: const TextStyle( color:  Color.fromARGB(255, 0, 0, 0))),

                     const SizedBox(height: 8),
                     Text(
                      movie.synopsis,
                      style: const TextStyle(
                        color: Color.fromARGB(137, 7, 1, 1),
                       ),
                     )
                   ]
                 )
                     ),
          
            

                      
                      ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(movie.formattedPrice,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 3, 29, 47),
                            )),
                        ElevatedButton(
                          onPressed: (){
                            print('Booking for ${movie.title}');

                        }, child: const Text('Book Now')
                      ), ]
              )
                  ],
          )));
            
        
    }
                   


}