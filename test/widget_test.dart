import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_reader/main.dart';

void main() {
  testWidgets('QR Scanner button test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: true));

    final scanButton = find.byKey(const Key('scan_qr_button'));

    expect(scanButton, findsOneWidget);

    await tester.tap(scanButton);
    await tester.pump();

    expect(find.text('Scan your QR Code'), findsOneWidget);
  });
}
