import 'dart:convert';
import 'dart:io';

// В файле place_to_visit.dart содержится описание структуры данных PlaceToVisit, которую я использую для решения задачи
import 'package:testovoe/place_to_visit.dart';
// В файле quick_sort.dart содержится функция сортировки
import 'package:testovoe/quick_sort.dart';

void main() async {

  List<PlaceToVisit> placesList = [];
  List<String> parsedInfo;

  final file = File('data.txt');
  Stream<String> lines = file.openRead()
      .transform(utf8.decoder)       // Decode bytes to UTF-8.
      .transform(LineSplitter());    // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      parsedInfo = line.split(':');
      placesList.add(PlaceToVisit(placeTitle: parsedInfo[0], time: parsedInfo[1], priority: parsedInfo[2]));
    }
  } catch (e) {
    print('Error: $e');
  }

  for(PlaceToVisit x in placesList){
    print(x.visitProfit);
  }
  print('---------------------------');
  placesList = quickSort(placesList);
  for(PlaceToVisit x in placesList){
    print(x.visitProfit);
  }

}
