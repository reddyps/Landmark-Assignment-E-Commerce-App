import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/core/util/helper/ui_helper_extension.dart';

abstract class BaseViewModel extends ChangeNotifier {
  static BuildContext? _context;

  set context(BuildContext ctx) {
    _context = ctx;
  }

  BuildContext get context {
    if (_context == null) {
      throw Exception("Context has not been initialized!");
    }
    return _context!;
  }

  bool isDialogLoaded = false;

  push(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  pushReplacement(Widget screen) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => screen));
  }

  pop() {
    Navigator.of(context).pop();
  }

  void showCircularIndicator({String? message}) {
    isDialogLoaded = true;
    showDialog(
      context: (context),
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w(context),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                message ?? "",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ).setEmberHeight(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void dismissDialogIndicator() {
    if(isDialogLoaded){
      isDialogLoaded = false;
      Navigator.pop(context);
    }
  }


  void showDialogAuto(
      {String? message, String? messageIconPath, final method}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w(context),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: messageIconPath != null,
                              child: SizedBox.square(
                                dimension: 20,
                                child: Image.asset(messageIconPath ?? ''),
                              ),
                            ),
                            Flexible(
                              child: Center(
                                child: Text(
                                  message ?? '',
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ).setEmberHeight(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    Future.delayed(Duration(seconds: 4), method);
  }

  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Center(child: Text(message)),duration:const Duration(seconds: 1)));
  }
  void dispose();

  void handleAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.values:
        break;
    }
  }
}
