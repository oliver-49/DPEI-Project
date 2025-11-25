import 'package:fixit/order/presentation/homescreen.dart';
import 'package:fixit/order/presentation/screens/order_booking/order/order_view.dart';
import 'package:fixit/order/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:fixit/l10n/app_localizations.dart';

class GiveFeedbackView extends StatefulWidget {
  const GiveFeedbackView({super.key});

  @override
  State<GiveFeedbackView> createState() => _GiveFeedbackViewState();
}

class _GiveFeedbackViewState extends State<GiveFeedbackView> {
  double rating = 0;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff0054A5)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          t.giveFeedback,
          style: const TextStyle(
            color: Color(0xff0054A5),
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.02),

            Text(
              t.howWasExperience,
              style: TextStyle(
                fontSize: w * 0.045,
                fontWeight: FontWeight.w600,
                color: const Color(0xff565656),
              ),
            ),

            SizedBox(height: h * 0.02),

            Row(
              children: List.generate(
                5,
                (i) => IconButton(
                  icon: Icon(
                    i < rating ? Icons.star : Icons.star_border,
                    size: 36,
                    color: const Color(0xff0054A5),
                  ),
                  onPressed: () {
                    setState(() => rating = i + 1.0);
                  },
                ),
              ),
            ),

            SizedBox(height: h * 0.02),

            Text(
              t.writeFeedback,
              style: const TextStyle(fontSize: 15, color: Color(0xff565656)),
            ),

            SizedBox(height: h * 0.01),

            Container(
              height: h * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE0E0E0)),
              ),
              child: TextField(
                controller: controller,
                maxLines: 5,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                  hintText: "Write here...",
                ),
              ),
            ),

            const Spacer(),

            buttonItem(
              context,
              text: t.send,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  OrdersView(
        // provider: widget.provider
      )),
                );
              },
            ),

            SizedBox(height: h * 0.03),
          ],
        ),
      ),
    );
  }
}
