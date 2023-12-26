
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';
import 'package:gpt/module/shop/update_bottom_sheet.dart';

class ShopService{
  myketShop(BuildContext context, String sku, int id) async{
    String RSA = 'MIHNMA0GCSqGSIb3DQEBAQUAA4G7ADCBtwKBrwC9I1VES/ddNtmhLCZylMOFPTbocItnIgb31nyVlvXI1ixTOuksuzEs7eQ1AD3soJWl8MzkjNBUQuv6w45G8arZo/qawTsRo2lq6p3SPsMOP1ZoWQxdrkMVxpjtbfWKWtP4H6vkb3wFecAOQRK7WGDs/BgPHboERZ+aqeJVSn0jJVPzDehv8cSbtkIEelgR3gMEdzNAnQmwDxPqc/5St5cCiFXsClHomOAOk6pw178CAwEAAQ==';
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