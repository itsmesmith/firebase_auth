import 'package:demo/module/usersList/users_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../debug_print.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key, required this.verificationId}) : super(key: key);
  String verificationId;
  final TextEditingController pinController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Verification'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Pinput(
                controller: pinController,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                autofocus: true,
                length: 6,
                pinAnimationType: PinAnimationType.rotation,
                onCompleted: (val) {},
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: pinController.text,
                  );

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    return const UsersList();
                  }), (route) => false);
                } catch (e) {
                  sPrint('wrong otp');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
