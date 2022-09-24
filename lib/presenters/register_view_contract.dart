import 'package:hotel_service/data_sources/injection.dart';
import 'package:hotel_service/data_sources/repositories/register/register_repository.dart';

abstract class RegisterViewContract{
  onResponseRegister(String response);
  onLoadError(String error);
}

class RegisterPresenter{
  final RegisterViewContract? _view;
  RegisterRepository? _registerRepository;

  RegisterPresenter(this._view){
    _registerRepository = Injector().register();
  }

  postPhoneRequest(String phone, bool resend){
    assert(_view != null && _registerRepository != null);
    _registerRepository!
      .register(phone, resend)
      .then((contract) => _view!.onResponseRegister(contract!))
      .catchError((onError) => _view!.onLoadError(onError));
  }

  confirmOTPCode(String phone, String code){
    assert(_view != null && _registerRepository != null);
    _registerRepository!
      .confirmOTP(phone, code)
      .then((contract) => _view!.onResponseRegister(contract!))
      .catchError((onError) => _view!.onLoadError(onError));
  }
}