
import 'package:flutter/material.dart';
import 'package:gpt/global/widgets/loading_dialog.dart';
import 'package:gpt/module/shop/update_bottom_sheet.dart';
import 'package:myket_iap/myket_iap.dart';
import 'package:myket_iap/util/iab_result.dart';
import 'package:myket_iap/util/purchase.dart';
class ShopService{
  myketShop(BuildContext context, String sku, int id) async{
    try{
      String RSA = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIunlEtqJfx8R5D110vW627BOzdrCXmFMMEOMTUtVzVv2+wSByEssgduLUp35h0FfpsyRDxP7pJNq8Vv3myljj3IYV5ILSLG8FbLC31neiaBFLQu8bqlycmAOq4a8/6QWneR6GBhxT/dStoSPBOuZJqOUj2z5xKaocInTmIqj6CwIDAQAB';
      // print(sku);
      await MyketIAP.init(rsaKey: RSA, enableDebugLogging: true);

      Map<dynamic, dynamic> result = await MyketIAP.launchPurchaseFlow(
          sku: sku,
          payload:'payload');
      print("what happend: "+ result.toString());
      Purchase purchase = result[MyketIAP.PURCHASE];
      IabResult purchaseResult = result[MyketIAP.RESULT];
      print('result :'+purchaseResult.mMessage);
      if(purchaseResult.isFailure()){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('خرید انجام نشد. در صورت مشکل با پشتیبانی تماس بگیرید.'))
        );
      }else{
        showLoaderDialog(context);
        await MyketIAP.consume(purchase: purchase);
        Navigator.of(context).pop();
        showModalBottomSheet(context: context,
          isDismissible: false,
          builder: (context) => UpdateDateBottomSheet(
              id,
              purchase.mToken),
        );
      }
    }catch(e){
      // showMarketDialog(context);
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