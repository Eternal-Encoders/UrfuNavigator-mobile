import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'institutes': institutes,
    };
  }
}
