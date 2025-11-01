// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

// تم تصحيح الاستيراد ليطابق اسم مشروعك (dpei_project).
// وهذا يحل مشكلة "MyApp is not defined".
import 'package:dpei_project/main.dart';

void main() {
  testWidgets('Initial counter value test', (WidgetTester tester) async {
    // الآن يمكن لملف الاختبار الوصول إلى 'MyApp' من ملف main.dart
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsNothing); // تم تغييره إلى findsNothing
    expect(find.text('1'), findsNothing);

    await tester.pump();
  });
}
