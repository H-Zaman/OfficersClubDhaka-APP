class HallBookResponse{
  dynamic? bookingSerial;
  dynamic? bookingId;
  bool error;
  HallBookResponse({this.bookingSerial,required this.error, this.bookingId});
}