import 'package:flutter/material.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';

class HomeMiddleWidget extends StatelessWidget {
  const HomeMiddleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                GlobalStrings.getHelp,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: GlobalColors.whiteTextColor),
              ),
              ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.darkBlueButtonColor,
                    // fixedSize: Size(100, 20)
                  ),
                  child: Text(GlobalStrings.tasks,
                  style: TextStyle(
                    fontSize: 14,
                    color: GlobalColors.blueTextColor,
                    fontWeight: FontWeight.bold
                  ),)
              )
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,

              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: GlobalColors.primaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GlobalStrings.socialMedia,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: GlobalColors.whiteTextColor),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            GlobalStrings.socialMediaDesc,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: GlobalColors.whiteTextColor),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/icons/social.png',
                              width: 48,
                              height: 49,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: GlobalColors.borderColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          GlobalStrings.summary,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: GlobalColors.whiteTextColor),
                                        ),
                                        // const SizedBox(height: 10,),
                                        Text(
                                          GlobalStrings.summaryDesc,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: GlobalColors.whiteTextColor),
                                        ),
                                        const SizedBox(height: 10,),

                                      ],
                                    ),
                                    const Spacer(),
                                    Image.asset('assets/icons/summary.png')
                                  ],
                                ),
                              )
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Flexible(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color.fromARGB(255,238, 119, 10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,                                      children: [
                                        Text(
                                          GlobalStrings.studying,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: GlobalColors.whiteTextColor),
                                        ),
                                        const SizedBox(height: 10,),
                                        Text(
                                          GlobalStrings.studyingDesc,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: GlobalColors.whiteTextColor),
                                        ),
                                        const SizedBox(height: 10,),

                                      ],
                                    ),
                                    const Spacer(),
                                    Image.asset('assets/icons/studying.png')
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
