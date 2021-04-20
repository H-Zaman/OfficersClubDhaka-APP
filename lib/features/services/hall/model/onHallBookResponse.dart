class HallBookResponse{
  String? bookingSerial;
  String? bookingId;
  bool error;
  HallBookResponse({this.bookingSerial,required this.error, this.bookingId});
}