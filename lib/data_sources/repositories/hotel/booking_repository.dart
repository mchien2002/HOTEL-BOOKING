// ignore_for_file: constant_identifier_names
import '../../../models/booking_model.dart';

abstract class BookingRepository{
  static const BOOKING_POST = "/v1/booking";
  Future postBooking(BookingModel bookingModel);
}