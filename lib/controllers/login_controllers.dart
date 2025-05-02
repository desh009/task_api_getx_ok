import 'package:api_getx/controllers/auth_controllers.dart';
import 'package:api_getx/data/models/login_models.dart';
import 'package:api_getx/data/services/network_client.dart';
import 'package:api_getx/utils/urls.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  bool _loginInProgress = false;

  bool get loginInProgress => _loginInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    bool isSuccess = false;

    _loginInProgress = true;
    update();

    Map<String, dynamic> requestBody = {"email": email, "password": password};

    NetworkResponse response = await NetworkClient.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.data!);
      await AuthController.saveUserInformation(
          loginModel.token, loginModel.userModel);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _loginInProgress = false;
    update();

    return isSuccess;
  }
}