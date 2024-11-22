import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_institutes.dart';

part 'institutes_bloc.freezed.dart';
// part 'floor_bloc.g.dart';
part 'institutes_event.dart';
part 'institutes_state.dart';

class InstitutesBloc extends Bloc<InstitutesEvent, InstitutesState> {
  final GetInstitutes getInstitutes;
  InstitutesBloc({required this.getInstitutes})
      : super(const InstitutesState.loading()) {
    on<InstitutesEventFetch>((event, emit) async {
      emit(const InstitutesState.loading());

      final failureOrFloor = await getInstitutes();

      emit(failureOrFloor.fold(
          (failure) => InstitutesState.error(),
          (institutes) =>
              InstitutesState.loaded(institutesLoaded: institutes)));
    });
  }
}
