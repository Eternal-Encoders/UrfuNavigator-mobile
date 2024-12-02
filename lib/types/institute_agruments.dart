import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class InstituteArguments {
  final Institute? institute;
  final Map<ECords, dynamic>? coordinates;

  InstituteArguments({required this.institute, this.coordinates});
}
