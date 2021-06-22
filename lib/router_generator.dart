import 'package:flutter/material.dart';
import 'package:safe_fax/pages/auth/login.dart';
import 'package:safe_fax/pages/auth/signup.dart';




class RouteGenerator {


  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    var _pageWidget;
    var arg = settings.arguments;
    // print(['args', args]);

    switch (settings.name) {
      case 'login':
        _pageWidget = Login();
        break;
      case 'signup':
        _pageWidget = SignUp();
        break;
      // case '/AdDetails':
      //   _pageWidget = AdDetailsWidget(product: arg);
      //   break;
      // case '/AdPost':
      //   _pageWidget = AdPostWidget(preCapturedImage: arg);
      //   break;
      // case '/EnterNumber':
      //   _pageWidget = EnterNumberWidget();
      //   break;
      // case '/VerifyNumber':
      //   _pageWidget = VerifyNumberWidget(phoneNumber: arg);
      //   break;
      // case '/AdSlider':
      //   Map pageArgs = settings.arguments;
      //
      //   _pageWidget = FullSliderWidget(
      //     selected: pageArgs['selected'],
      //     images: pageArgs['images'],
      //   );
      //   break;
      // case '/CapturePostImage':
      //   Map pageArgs = settings.arguments;
      //
      //   _pageWidget = CapturePostImageWidget(
      //     cameras: cameras,
      //     returnMedia: pageArgs != null ? pageArgs['returnMedia'] : null,
      //   );
      //   break;
      // default:
      //   _pageWidget = HomeWidget();
    }

    // return MaterialPageRoute(builder: (_) => _pageWidget);

    // Wrapping all pages with "Network conneciton" display at bottom
    return MaterialPageRoute(
        builder: (_) => _pageWidget);
  }
}
