import 'package:beteveterinaria/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Landing page shows brand and CTAs', (tester) async {
    await tester.pumpWidget(const BeteVeterinariaApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('beteveterinaria'), findsWidgets);
    expect(find.textContaining('WhatsApp'), findsWidgets);
  });
}
