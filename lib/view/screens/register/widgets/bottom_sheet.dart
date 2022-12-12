import 'package:flutter/material.dart';
import 'package:hotelnew/view/widgets/button_widget.dart';
import 'package:hotelnew/view/widgets/loading_indicator.dart';
import 'package:hotelnew/view_model/register/phone_number.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../widgets/title_widget.dart';

class OtpBottomSheet extends StatelessWidget {
  const OtpBottomSheet({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    final numberVerifyController =
        Provider.of<PhoneNumberViewModel>(context, listen: false);
    return SizedBox(
      height: size.height / 1.5,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            children: [
              KSizedBox.kHeigh_40,
              TitleWidget(
                'Verify otp',
                color: KColors.kThemeGreen,
              ),
              KSizedBox.kHeigh_20,
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                autoDisposeControllers: false,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                controller: numberVerifyController.otpController,
                onChanged: (value) {},
                appContext: context,
              ),
              const Spacer(),
              Selector<PhoneNumberViewModel, bool>(
                selector: (_, obj) => obj.isLoading,
                builder: (__, isLoading, _) => isLoading
                    ? const LoadingIndicator(
                        color: KColors.kThemeGreen,
                      )
                    : ButtonWidget(
                        text: 'Verify',
                        onTap: () {
                          numberVerifyController.onOtpVerifyButton();
                        },
                        color: KColors.kThemeGreen,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
