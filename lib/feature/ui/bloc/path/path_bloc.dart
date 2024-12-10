import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_path.dart';

part 'path_bloc.freezed.dart';
// part 'floor_bloc.g.dart';
part 'path_event.dart';
part 'path_state.dart';

class PathBloc extends Bloc<PathEvent, PathState> {
  final GetPath getPath;
  PathBloc({required this.getPath}) : super(const PathState.loading()) {
    on<PathEventFetch>((event, emit) async {
      emit(const PathState.loading());

      final failureOrPath =
          await getPath(PathParams(from: event.from, to: event.to));

      emit(failureOrPath.fold((failure) => PathState.error(),
          (path) => PathState.loaded(pathLoaded: path)));
    });
  }
}
