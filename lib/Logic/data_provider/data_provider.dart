
import 'package:gameon/Logic/model/ground_model.dart';
import 'package:gameon/Logic/service/service.dart';

class DataProvider {
  final FetchJsonFile fetchJsonFile;

  DataProvider({required this.fetchJsonFile});

  Future<Ground> fetchGround() async {
    final groundRaw = await fetchJsonFile.fetchGround();
    return groundRaw;
  }
}