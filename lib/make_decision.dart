import 'package:testovoe/place_to_visit.dart';
/*
Функция делает решение о посещении места. Если место "выгодно" посещать и
оставшегося времени хватает, посещаем. Результаты добавляются в список, который
функция возвращает
 */
List<PlaceToVisit> makeDecision(double hoursAmount, List<PlaceToVisit> places){
  List<PlaceToVisit> decision = [];
  for(PlaceToVisit place in places){
    if(place.timeToVisit <= hoursAmount){
      decision.add(place);
      hoursAmount -= place.timeToVisit;
    }
  }
  return decision;
}