// ignore_for_file: unnecessary_null_comparison
import 'package:hotel_service/data_sources/injection.dart';
import 'package:hotel_service/data_sources/repositories/hotel/hotel_repository.dart';

abstract class HotelListViewContract{
  onLoadHotelComplete(List hotelList);
  onLoadError(String error);
}

class HotelListPresenter{
  final HotelListViewContract? _view;
  HotelRepository? _repository;

  HotelListPresenter(this._view){
    _repository = Injector().handleData();
  }

  loadHotelList(){
    assert(_view != null && _repository != null);
    _repository!
      .fetchHotelList()
      .then((contacts) => _view!.onLoadHotelComplete(contacts))
      .catchError((onError) => _view!.onLoadError(onError.toString())
    );
  }

  setDataLocal(){
    assert(_view != null && _repository != null);
    _repository!.setDataLocal();
  }
}