import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'textify_platform_interface.dart';

/// An implementation of [TextifyPlatform] that uses method channels.
class MethodChannelTextify extends TextifyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('textify');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
