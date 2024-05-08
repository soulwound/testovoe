import 'package:testovoe/place_to_visit.dart';
/*
Сортировка упорядочивающая экземпляры класса по значению поля visitProfit
Возвращает список, отсортированный в обратном порядке, чтобы более выгодные
для посещения места были в начале списка
*/
List<PlaceToVisit> quickSort(List<PlaceToVisit> list){
  if(list.length < 2) {
    return list;
  }
  PlaceToVisit pivot = list[0];
  List<PlaceToVisit> less = [];
  List<PlaceToVisit> greater = [];
  for(PlaceToVisit x in list) {
    if(x < pivot) { less.add(x); }
    else if(x > pivot) { greater.add(x); }
  }
  return (quickSort(greater) + [pivot] + quickSort(less));
}
