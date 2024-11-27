import 'package:equatable/equatable.dart';

/// Модель точки на карте
class MapPoint extends Equatable {
  const MapPoint({
    required this.displayableName,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  /// Отображение
  final String displayableName;

  /// Название
  final String name;

  /// Широта
  final double latitude;

  /// Долгота
  final double longitude;

  @override
  List<Object?> get props => [name, latitude, longitude, displayableName];
}
