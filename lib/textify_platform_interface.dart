import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'textify_method_channel.dart';

abstract class TextifyPlatform extends PlatformInterface {
  /// Constructs a TextifyPlatform.
  TextifyPlatform() : super(token: _token);

  static final Object _token = Object();

  static TextifyPlatform _instance = MethodChannelTextify();

  /// The default instance of [TextifyPlatform] to use.
  ///
  /// Defaults to [MethodChannelTextify].
  static TextifyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TextifyPlatform] when
  /// they register themselves.
  static set instance(TextifyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
