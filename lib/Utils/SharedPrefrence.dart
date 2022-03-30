import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrence{

  Future<bool> setToken(String  token) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<String> getToken() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }

  Future<bool> setUserId(String  userId) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_id", userId);
  }

  Future<String> getUserId() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id") ?? '';
  }

  Future<bool> setMobile(String  mobile) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("mobile", mobile);
  }

  Future<String> getMobile() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile") ?? '';
  }
  Future<bool> setOtp(String  otp) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("otp", otp);
  }

  Future<String> getOtp() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("otp") ?? '';
  }
  Future<bool> setLoggedIn(bool  status) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("logged_in", status);
  }

  Future<bool> getLogedIn() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged_in") ?? false;
  }
  Future<bool> setLatitude(String latitude) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("latitude", latitude);
  }

  Future<String> getLatitude() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("latitude") ?? '';
  }
  Future<bool> setLongitude(String  longitude) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("longitude", longitude);
  }

  Future<String> getLongitude() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("longitude") ?? '';
  }
  Future<bool> setDefultPlace(String  longitude) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("place", longitude);
  }

  Future<String> getDefaultPlce() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("place") ?? '';
  }

}