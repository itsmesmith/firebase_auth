import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../debug_print.dart';
import 'otp_verification.dart';

class PhoneRegister extends StatelessWidget {
  PhoneRegister({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Register'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.teal),
                ),
                child: FormBuilderTextField(
                  keyboardType: TextInputType.number,
                  name: 'phone',
                  validator: FormBuilderValidators.required(context),
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Number',
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    sPrint(_formKey.currentState!.value);
                    final formData = _formKey.currentState!.value;
                    // await FirebaseAuth.instance.cr;
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+977${formData['phone']}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return OtpVerification(
                            verificationId: verificationId,
                          );
                        }));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
