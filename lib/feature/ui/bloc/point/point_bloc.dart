import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_point.dart';

part 'point_bloc.freezed.dart';
// part 'floor_bloc.g.dart';
part 'point_event.dart';
part 'point_state.dart';

class PointBloc extends Bloc<PointEvent, PointState> {
  final GetPoint getPoint;
  PointBloc({required this.getPoint}) : super(const PointState.loading()) {
    on<PointEventFetch>((event, emit) async {
      emit(const PointState.loading());

      final failureOrFloor = await getPoint(PointParams(id: event.id));

      emit(failureOrFloor.fold((failure) => PointState.error(),
          (point) => PointState.loaded(pointLoaded: point)));
    });
  }
}
