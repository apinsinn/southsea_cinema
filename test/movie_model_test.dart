import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

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
}