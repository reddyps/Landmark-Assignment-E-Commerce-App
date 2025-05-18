import 'dart:convert';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension StringExtensions on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  bool isValidEmail() {
    RegExp regExp = RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])',
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(this!);
  }
  bool isValidPassword() {
    RegExp regExp = RegExp(
      r"(?=.*?[#?!@$%^&*-]).{8,}",
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(this!);
  }
}

extension IntExtensions on int? {
  bool isNull() {
      return this == null;
  }
}
String generateRandomNumber(int length) {
  Random random =Random();
  var randomNumber="";
  for(int i=0;i<length;i++){
    randomNumber += random.nextInt(10).toString();
  }
  return randomNumber;
}

int generateRandomNumberInt(int length) {
  return Random().nextInt(length);
}



extension LocaleOverContext on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}

extension CalendarExtension on BuildContext {
  Future<DateTime?> pickDate({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    return await showDatePicker(
      context: this,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}



extension NetworkConnectivityExtension on Connectivity {
  /// Returns `true` if there is an active internet connection, otherwise `false`
  Future<bool> checkNetworkConnectivity() async {
    final connectivityResult = await this.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  /// Returns the current network type as a `String`
  Future<String> getNetworkState() async {
    final connectivityResult = await this.checkConnectivity();

    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        return "mobile";
      case ConnectivityResult.wifi:
        return "wifi";
      case ConnectivityResult.ethernet:
        return "ethernet";
      case ConnectivityResult.vpn:
        return "vpn";
      case ConnectivityResult.bluetooth:
        return "bluetooth";
      case ConnectivityResult.other:
        return "other";
      case ConnectivityResult.none:
        return "none";
      default:
        return "";
    }
  }
}

extension Base64Extension on String {
  String base64EncodeEx() {
    return utf8.fuse(base64).encode(this);
  }

  String base64DecodeEx() {
    return utf8.fuse(base64).decode(this);
  }
}
