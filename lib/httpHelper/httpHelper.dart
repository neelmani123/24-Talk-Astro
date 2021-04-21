import 'dart:io';
import 'package:device_id/device_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/SignUp.dart';
import 'package:online_astro24/Modal/EditProfileModal.dart';
import 'package:online_astro24/Modal/GetProfileModal.dart';
import 'package:online_astro24/Modal/HorosCopeModel.dart';
import 'package:online_astro24/Modal/LoginModal.dart';
import 'package:online_astro24/Modal/SendOtpModal.dart';
import 'package:online_astro24/helper/api_heper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:online_astro24/Modal/SignUpModal.dart';
import 'package:online_astro24/Modal/ValidateOtpModal.dart';
import 'package:online_astro24/Modal/HomeModal.dart';
import 'package:online_astro24/Modal/CreateUserModel.dart';
import 'package:online_astro24/Modal/UserListData.dart';
import 'package:online_astro24/Modal/EditUserListModel.dart';
import 'package:online_astro24/Modal/AddToCart.dart';


class HttpService {
  ApiBaseHelper _apiHelper = ApiBaseHelper();

  String  userID = '';
  String name = '';
  String countryCode = '';
  String _deviceID, _deviceToken = '';
  String _deviceType = 'WEB';
  String phone = '';
  String email = '';
  String image = '';


  Future _init() async {
    final _prefs = await SharedPreferences.getInstance();
    _deviceID = await DeviceId.getID ?? '';
    _deviceToken = _prefs.getString('deviceToken') ?? '';
    userID = _prefs.getString('userID') ?? '';
    phone = _prefs.getString('mobile') ?? '';
    email = _prefs.getString('email') ?? '';
    image = _prefs.getString('image') ?? '';
    name = _prefs.getString('name') ?? '';
    countryCode = _prefs.getString('country_code');

    if (Platform.isAndroid) {
      _deviceType = 'Android';
    } else if (Platform.isIOS) {
      _deviceType = 'IOS';
    }
  }

  Future<SendOtpModal> otpFetch({String mobileNumber}) async {
    await _init();
    Map reqBody = {
      "phone": mobileNumber,
    };
    final response = await _apiHelper.post('send_otp', reqBody);
    try {
      return SendOtpModal.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<SignUpModal> signUpModal({String name,String email,String mobileNumber,String dob,String timeOfBirth,String placeOfBirth,String gender}) async {
    await _init();
    Map reqBody = {
      "deviceID": "",
      "deviceToken": "",
      "deviceType": _deviceType,
      "name": name,
      "email": email,
      "phone": mobileNumber,
      "dob": dob,
      "birth_time": timeOfBirth,
      "birth_place": placeOfBirth,
      "gender": gender
    };
    final response = await _apiHelper.post('user_register', reqBody);
    try {
      return SignUpModal.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  Future<CreateUserModel> createUser({String user_id,String name,String gender,String date_of_birth,String time_of_birth,String place_of_birth,String relationship})async
  {
    await _init();
    Map reqBody={
      "user_id":user_id,
      "name":name,
      "dob":date_of_birth,
      "birth_time":time_of_birth,
      "birth_place":place_of_birth,
      "gender":gender,
      "relationship":relationship
    };
    final response=await _apiHelper.post('create_user_profile', reqBody);
    try{
      return CreateUserModel.fromJson(response);
    }
    catch(e)
    {
      return null;
    }
  }

  //Add To Card
  Future<AddToCart>addToCard({String user_id,String productID})async
  {
    Map reqBody={
      "user_id":user_id,
      "productID":productID
    };
    final response=await _apiHelper.post('add_to_cart', reqBody);
    try{
      return AddToCart.fromJson(response);
    }
    catch(e)
    {
      return null;
    }

  }
  Future <HorosCopeModel> horos({String sign}) async
  {
    Map reqBody={
      "sign":sign,
    };
    final response=await _apiHelper.post('horoscope', reqBody);
    try
        {
          return HorosCopeModel.fromJson(response);
        }
        catch(e)
    {
      return null;
    }
  }
  Future<EditUserListModel>edit_user_list({String user_id,String name,String gender,String date_of_birth,String time_of_birth,String email})async
  {
    Map reqBody={
      "user_id":user_id,
      "name":name,
      "email":email,
      "dob":date_of_birth,
      "birth_time":time_of_birth,
      "gender":gender
    };
    final response=await _apiHelper.post('edit_user_profile', reqBody);
    try{
      return EditUserListModel.fromJson(response);
    }
    catch(e)
    {
      return null;
    }

}
  Future<UserListData> userList({String user_id}) async
  {
    Map reqBody={
      "user_id":user_id,
    };
    final response=await _apiHelper.post('user_profile', reqBody);
    try
        {
          return UserListData.fromJson(response);

        }
        catch(e)
    {
      return null;
    }
    
  }

  Future<LoginModal> login({String mobileNumber,String otp}) async {
    await _init();
    print(_deviceID);
    Map reqBody = {"deviceID":_deviceID,"deviceToken":"","deviceType":_deviceType,"mobile":mobileNumber,"otp": otp,"userID":userID};
    final response = await _apiHelper.post('login', reqBody);
    try {
      return LoginModal.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<GetProfileModal> getProfile() async {
    await _init();

    Map reqBody = {
      "user_id": userID
    };
    final response = await _apiHelper.post('get_profile', reqBody);
    try {
      return GetProfileModal.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<ValidateOtpModal> validateOtp({String phone, String otp}) async {
    await _init();
    Map reqBody = {"phone": phone,"otp": otp};
    final response = await _apiHelper.post('otp_match', reqBody);
    try {
      return ValidateOtpModal.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<HomeModal> home() async {
    await _init();
    Map reqBody = {"user_id" : userID};

    final response = await _apiHelper.post('home', reqBody);
    try {
      return HomeModal.fromJson(response);
    } catch (e) {
      return null;
    }

  }


  Future<UpdateProfileModal> updateProfile({String name, String email,String dob,String timeOfBirth,String gender}) async {
    await _init();
    Map reqBody = {"user_id":userID, "name":name,"email":email,"dob":dob,"birth_time":timeOfBirth,"gender":gender};

    final response = await _apiHelper.post('home', reqBody);
    try {
      return UpdateProfileModal.fromJson(response);
    } catch (e) {
      return null;
    }

  }


}

