// В данном файле содержится описание структуры данных PlaceToVisit, которую я использую для решения задачи

class PlaceToVisit {

  String placeTitle;
  double timeToVisit = 0;
  int placePriority = 0;
  // Соотношение приоритетности посещения места и времени, требующегося для посещения
  late double visitProfit;

  PlaceToVisit({required this.placeTitle, required String time, required String priority}){
    placePriority = int.parse(priority);
    try {
      String clearTime = time.substring(0, time.length - 1);
      if (time.contains(',')) {
        timeToVisit = double.parse(
            '${clearTime.substring(0, clearTime.indexOf(','))}.${clearTime
                .substring(clearTime.indexOf(',') + 1)}');
      }
      else {
        timeToVisit = double.parse(clearTime);
      }
    }
    catch(e){
      print('Error when time parsing');
    }
    // Определяя "профитность" посещения мы можем оценивать, какое место посещать наиболее выгодно
    visitProfit = placePriority/timeToVisit;
  }

  void showMeYourData() {
    print(placeTitle);
    print(timeToVisit);
    print(placePriority);
    print(visitProfit);
  }
  // Переопределение операторов сравнения для их использования в сортировке
  // Экземпляры класса сравниваются между собой по значению поля visitProfit
  bool operator >(PlaceToVisit otherPlace) => visitProfit > otherPlace.visitProfit;
  bool operator <(PlaceToVisit otherPlace) => visitProfit < otherPlace.visitProfit;
  bool operator >=(PlaceToVisit otherPlace) => visitProfit >= otherPlace.visitProfit;
  bool operator <=(PlaceToVisit otherPlace) => visitProfit <= otherPlace.visitProfit;
}