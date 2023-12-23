
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';
import 'package:gpt/module/shop/update_bottom_sheet.dart';

class ShopService{
  myketShop(BuildContext context, String sku, int id) async{
    String RSA = 'MIHNMA0GCSqGSIb3DQEBAQUAA4G7ADCBtwKBrwCq8DWfxGtW+zS++0HKG83G2TuPVDfzSXerzfL2Vm/Tz6H50w8KZAK+4w+bRCOVF+NUxUFI5/FT4sPtFAfmuXl+I3yU6pL7I/VMkoez6SWy5qZyC3S1VkNBldXwRtcEMqvrYYpKiaKgAeNED2HkDVa39Fmv1UaEBwC32f3+nJN8xRtPhlQMDbzKibiJomfg3CFk9NuN0ijUMg8Oz18F1FFy0c+bZqx8D334KTtHeDECAwEAAQ==';
    print(sku);
    await FlutterPoolakey.connect(RSA, onDisconnected: (){

    });

    try{
      PurchaseInfo purchaseInfo = await FlutterPoolakey.subscribe(
          sku,
          payload: '');

      if(purchaseInfo.purchaseState.name == 'PURCHASED'){
        showModalBottomSheet(context: context,
          isDismissible: false,
          builder: (context) => UpdateDateBottomSheet(
              id,
              purchaseInfo.purchaseToken),
        );
      }
    }on PlatformException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message.toString()))
      );
    }

  }

  // showMarketDialog(BuildContext context){
  //   showDialog(
  //       context: context,
  //       builder: (context) => SimpleDialog(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(15),
  //             child: Text(Market.market ==1
  //                 ?BazarStrings.checkBazar
  //                 :MyKetStrings.checkMyKet,
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(fontSize: 18),
  //             ),
  //           )
  //         ],
  //       )
  //   );
  // }
}