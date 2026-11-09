import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
      return const [
        Movie(
          id: '1',
          title: 'Spirited Away',
          synopsis: 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.',
          ageRating: 'PG',
          screeningTime: '2026-10-14 19:00:00',
          ticketPrice: 10.0,
          imageUrl: 'assets/images/spirited.jpg',
        ),
        Movie(
          id: '2',
          title: 'Akira',
          synopsis: 'Set in a dystopian 2019, 31 years after World War III, Akira takes place in Neo-Tokyo, a city teetering on the brink of collapse due to corruption, anti-government protests, and gang violence.',
          ageRating: 'PG',
          screeningTime: '2026-10-13 19:00:00',
          ticketPrice: 10.0,
          imageUrl: 'assets/images/akira.jpg',
        ),
      ];
  }
  }