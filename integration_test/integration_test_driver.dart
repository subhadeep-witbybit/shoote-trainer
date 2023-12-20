import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:shooter_demo/main.dart';
import 'package:shooter_demo/providers/app_state.dart';
import 'package:shooter_demo/providers/localization_provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Some group', () {
    var appState = AppState();
    appState.setSelectedSchool(1);
    testWidgets('checking', (tester) async {
      await tester.pumpWidget(MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => appState),
        ChangeNotifierProvider(
            create: (_) =>
                LocalizationsProvider.defaultLocale(localeCode: 'hi'))
      ], child: const ShooterApp()));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('guns')).first);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(IconButton).first);
      await tester.pumpAndSettle();
      expect(appState.shotgunShots, 0);
      expect(appState.selectedSchool, null);
    });
    // test('Checking if state is updating', () {
    //   expect(appState.selectedSchool, 0);
    //   expect(appState.shotgunShots, 1);
    // });
  });
}
