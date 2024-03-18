import 'package:birthday_app/utils/dialog_helper.dart';
import 'package:birthday_app/utils/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static connectivity() {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        logger.d("!!!!!!!! YOU ARE OFFLINE !!!!!!!!!!!!!!!!!");
        DialogHelper.showNoInterNet();
      }
    });
  }

  static checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      ConnectivityService.gotoPage();
    }
  }

  static gotoPage() {
    DialogHelper.hideLoading();
  }
}
