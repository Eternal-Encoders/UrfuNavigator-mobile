import 'package:flutter/material.dart';
import 'package:urfunavigator_mobile/utils/API/api_fetcher.dart';
import 'package:urfunavigator_mobile/utils/API/responses/audiences.dart';

class InstitutePage extends StatefulWidget {
  @override
  State<InstitutePage> createState() => _InstitutePageState();
}

class _InstitutePageState extends State<InstitutePage> {
  late Future<MapObject> futureMap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MapObject>(
      future: futureMap, 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.width.toString());
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return const CircularProgressIndicator(); 
      }
    );
  }

  @override
  void initState() {
    super.initState();
    ApiFetcher.host('how-to-navigate.ru:2083');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureMap = ApiFetcher.fetchAudiences('ИРИТ-РТФ', 1);
  }
}
