import 'package:hotel_service/data_sources/injection.dart';
import 'package:hotel_service/data_sources/repositories/hotel/booking_repository.dart';
import 'package:hotel_service/models/booking_model.dart';

abstract class BookingViewContract{
  onResponseBooking(String response);
  onLoadError(String error);
}

class BookingPresenter{
  final BookingViewContract? _view;
  BookingRepository? _repository;

  BookingPresenter(this._view){
    _repository = Injector().handleData() as BookingRepository?;
  }

  postRepestBooking(BookingModel bookingModel){
    assert(_view != null && _repository != null);
    _repository!
      .postBooking(bookingModel)
      .then((contract) => _view!.onResponseBooking(contract!))
      .catchError((onError) => _view!.onLoadError(onError));
  }
}