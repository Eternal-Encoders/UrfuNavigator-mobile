import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_floor.dart';

part 'floor_bloc.freezed.dart';
// part 'floor_bloc.g.dart';
part 'floor_event.dart';
part 'floor_state.dart';

class FloorBloc extends Bloc<FloorEvent, FloorState> {
  final GetFloor getFloor;
  FloorBloc({required this.getFloor}) : super(const FloorState.loading()) {
    on<FloorEventFetch>((event, emit) async {
      emit(const FloorState.loading());

      final failureOrFloor = await getFloor(
          FloorParams(floor: event.floor, institute: event.institute));

      emit(failureOrFloor.fold((failure) => FloorState.error(),
          (floor) => FloorState.loaded(floorLoaded: floor)));
    });
  }
}
