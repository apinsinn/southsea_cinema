import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('Movie Model Tests', () {
    test('Movie model with the correct properties', () {
      const movie = Movie(
        id: '1',
        title: 'Spirited Away',
        synopsis: 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.',
        ageRating: 'PG',
        screeningTime: '2026-10-14 19:00:00',
        ticketPrice: 10.0,
        imageUrl: 'assets/images/spirited.jpg',
      );

      expect(movie.id, '1');
      expect(movie.title, 'Spirited Away');
      expect(movie.synopsis, 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, '2026-10-14 19:00:00');
      expect(movie.ticketPrice, 10.0);
      expect(movie.imageUrl, 'assets/images/spirited.jpg');
    });

    test('formattedPrice returns whole pound price accurately',(){
      const movie = Movie(
        id: '1',
        title: 'Spirited Away',
        synopsis: 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.',
        ageRating: 'PG',
        screeningTime: '2026-10-14 19:00:00',
        ticketPrice: 10.0,
        imageUrl: 'assets/images/spirited.jpg',
      );

      expect(movie.formattedPrice, '£10.00');
    });

    test('formattedPrice returns price with pence accurately',(){
      const movie = Movie(
        id: '1',
        title: 'Spirited Away',
        synopsis: 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.',
        ageRating: 'PG',
        screeningTime: '2026-10-14 19:00:00',
        ticketPrice: 10.5,
        imageUrl: 'assets/images/spirited.jpg',
      );

      expect(movie.formattedPrice, '£10.50');
    });

    
  });
    group('MovieRepository tests', () {
      test('getMovieById returns matching movie when id exists', () {
      final MovieRepository respository = MovieRepository();
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();
      
      expect(movies.length, 2);
    });

      test('getMovies returns valid list of movies', () {
        final MovieRepository repository = MovieRepository();

        final List<Movie> movies = repository.getMovies();

        final Movie spiritedAway = movies[0];

        expect(spiritedAway.id, '1');
        expect(spiritedAway.title, 'Spirited Away');
        expect(spiritedAway.formattedPrice, '£10.00');
        expect(spiritedAway.imageUrl, isNotEmpty);

        final Movie akira = movies[1];

        expect(akira.id, '2');
        expect(akira.title, 'Akira');
        expect(akira.formattedPrice, '£10.00');
        expect(akira.imageUrl, isNotEmpty);

      });

      test('getMovieById returns matching movie when id exists', () {
        final MovieRepository movieRepository = MovieRepository();  
        final Movie? movie = movieRepository.getMovieById('1'); 

        expect(movie, isNotNull);
        expect(movie?.title, 'Spirited Away');
        expect(movie?.formattedPrice, '£10.00');
      });

      test('getMovieById returns null when id does not exist', () {
      final MovieRepository movieRepository = MovieRepository();
      final Movie? movie = movieRepository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}