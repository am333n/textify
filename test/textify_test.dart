import 'package:flutter_test/flutter_test.dart';
import 'package:textify/textify.dart';
import 'package:textify/textify_platform_interface.dart';
import 'package:textify/textify_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTextifyPlatform
    with MockPlatformInterfaceMixin
    implements TextifyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TextifyPlatform initialPlatform = TextifyPlatform.instance;

  test('$MethodChannelTextify is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTextify>());
  });

  test('getPlatformVersion', () async {
    Textify textifyPlugin = Textify();
    MockTextifyPlatform fakePlatform = MockTextifyPlatform();
    TextifyPlatform.instance = fakePlatform;

    expect(await textifyPlugin.getPlatformVersion(), '42');
  });
}
