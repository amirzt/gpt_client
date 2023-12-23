import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/urls.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/splash/splash_page.dart';
import 'package:gpt/provider/token.dart';
import 'package:gpt/services/global_services.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UpdateDateBottomSheet extends StatefulWidget {
  final String trackingCode;
  final int days;

  const UpdateDateBottomSheet(this.days,this.trackingCode, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => UpdateDateBottomSheetState(days);
}

class UpdateDateBottomSheetState extends State<UpdateDateBottomSheet> {
  int days;

  UpdateDateBottomSheetState(this.days);

  bool _isLoading = true;
  bool _isDone = false;
  String message = 'در حال تمدید حساب شما \n لطفا این صفحه را نبندید';

  @override
  void initState() {
    super.initState();
    updateDays();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 18);
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _isLoading
              ? [
                const MyProgressIndicator(Colors.black),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(message, style: textStyle),
            )
          ]
              : [
            IconButton(
              onPressed: () {
                if (!_isDone) {
                  setState((){
                    message = 'در حال تمدید حساب شما \n لطفا این صفحه را نبندید';
                    _isLoading = true;
                  });
                  updateDays();
                }
              },
              icon: _isDone
                  ? const Icon(
                FontAwesomeIcons.circleCheck,
                color: Colors.green,
                size: 35,
              )
                  : const Icon(
                FontAwesomeIcons.rotateRight,
                color: Colors.red,
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                message,
                style: textStyle,
              ),
            )
          ]),
    );
  }

  updateDays() async {
    try{
      String token = await TokenService().getToken();
      int response = await GlobalService().postRequestIntReturn(
          token,
          GlobalURL.addOrder,
          {
            'plan': days,
            'gateway': 'myket',
            'gateway_code': widget.trackingCode
          }
      );


      if (response == 200) {
        setState(() {
          message = 'حساب شما با موفقیت تمدید شد';
          _isLoading = false;
          _isDone = true;
        });
        Future.delayed(const Duration(milliseconds: 500), (){
          Get.off(const SplashPage());
        });
      } else {
        setState(() {
          message = 'خطایی رخ داده است. دکمه ریلود را بزنید';
          _isLoading = false;
          _isDone = false;
        });
      }
    }catch(error){
      setState(() {
        message = 'خطایی رخ داده است. دکمه ریلود را بزنید';
        _isLoading = false;
        _isDone = false;
      });
    }
  }
}