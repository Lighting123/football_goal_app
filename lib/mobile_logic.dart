import 'dart:io';

int adjustPaddingSizeForMobile() {
  if (Platform.isAndroid) {
    return 10;
  } else if (Platform.isIOS) {
    return 10;
  } else {
    return 410;
  }
}
