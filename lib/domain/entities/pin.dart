import 'package:equatable/equatable.dart';

class Pin extends Equatable {
  final int id;
  final int width;
  final int height;
  final String url;
  final String? photographer;
  final String? photographerUrl;
  final int photographerId;
  final String? avgColor;
  final PinSrc src;
  final String? alt;

  const Pin({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    this.photographer,
    this.photographerUrl,
    required this.photographerId,
    this.avgColor,
    required this.src,
    this.alt,
  });

  @override
  List<Object?> get props => [
        id,
        width,
        height,
        url,
        photographer,
        photographerUrl,
        photographerId,
        avgColor,
        src,
        alt,
      ];
}

class PinSrc extends Equatable {
  final String? original;
  final String? large2x;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  const PinSrc({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  @override
  List<Object?> get props => [
        original,
        large2x,
        large,
        medium,
        small,
        portrait,
        landscape,
        tiny,
      ];
}
