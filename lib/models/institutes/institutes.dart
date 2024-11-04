import 'package:urfu_navigator_mobile/models/institute/institute.dart';

class InstitutesList {
  List<Institute>? institutes;
  InstitutesList({required this.institutes});

  factory InstitutesList.fromJson(List<dynamic> json) {
    var institutesJson = json;

    List<Institute> institutesList =
        institutesJson.map((e) => Institute.fromJson(e)).toList();

    return InstitutesList(
      institutes: institutesList,
    );
  }
}
