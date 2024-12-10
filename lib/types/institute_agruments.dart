import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';

class InstituteArguments {
  final Institute? institute;
  final Search? search;
  final Path? path;
  InstituteArguments({required this.institute, this.search, this.path});
}
