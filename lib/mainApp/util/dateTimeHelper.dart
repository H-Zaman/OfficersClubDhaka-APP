class DateTimeHelper{
  static bool isSameDay(DateTime date){
    final now = DateTime.now();
    if(date.day == now.day && date.month == now.month && date.year == now.year){
      return true;
    }else{
      return false;
    }
  }
}