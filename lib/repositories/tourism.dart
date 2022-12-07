import 'package:wisata_solo/data/tourism.dart';
import 'package:wisata_solo/models/tourism.dart';

class RepositoryTourism {
  List<ModelTourism> fetchAll() {
    return DataTourism.list;
  }
}
