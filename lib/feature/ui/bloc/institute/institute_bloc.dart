import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_institute.dart';

part 'institute_bloc.freezed.dart';
// part 'floor_bloc.g.dart';
part 'institute_event.dart';
part 'institute_state.dart';

class InstituteBloc extends Bloc<InstituteEvent, InstituteState> {
  final GetInstitute getInstitute;
  InstituteBloc({required this.getInstitute})
      : super(const InstituteState.loading()) {
    on<InstituteEventFetch>((event, emit) async {
      emit(const InstituteState.loading());

      final failureOrFloor =
          await getInstitute(InstituteParams(institute: event.url));

      emit(failureOrFloor.fold((failure) => InstituteState.error(),
          (institute) => InstituteState.loaded(instituteLoaded: institute)));
    });
  }
}
