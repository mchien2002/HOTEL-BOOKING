import 'package:hotel_service/data_sources/injection.dart';
import 'package:hotel_service/data_sources/repositories/hotel/hotel_repository.dart';

abstract class HotelByIDViewContract{
  onLoadHotelIDComplete(hotelData);
  onLoadError(String error);
}

class HotelByIDPresenter{
  final HotelByIDViewContract? _view;
  HotelRepository? _repository;

  HotelByIDPresenter(this._view){
    _repository = Injector().handleData();
  }

  loadHotelID(String id){
    assert(_view != null && _repository != null);
    _repository!
        .fetchHotelByID(id)
        .then((contacts) => _view!.onLoadHotelIDComplete(contacts!))
        .catchError((onError) => _view!.onLoadError(onError.toString()));
  }
}