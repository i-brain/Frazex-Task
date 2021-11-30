import 'package:flutter/foundation.dart';

class Assets {
  const Assets._();

  static final images = Images._();
}

@protected
class Images {
  Images._();

  static const _basePath = 'assets/images';

  final avatar = '$_basePath/avatar.png';
}
