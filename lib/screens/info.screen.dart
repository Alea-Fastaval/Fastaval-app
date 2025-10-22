import 'package:easy_localization/easy_localization.dart';
import 'package:fastaval_app/core/constants/app_constants.dart';
import 'package:fastaval_app/core/theme/app_colors.dart';
import 'package:fastaval_app/core/theme/app_text_styles.dart';
import 'package:fastaval_app/core/theme/app_theme.dart';
import 'package:fastaval_app/core/theme/app_decorations.dart';
import 'package:fastaval_app/controllers/notification.controller.dart';
import 'package:fastaval_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  final notoficationCtrl = Get.find<NotificationController>();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        toolbarHeight: 40,
        centerTitle: true,
        titleTextStyle: AppTextStyles.appBarTitle,
        title: Text(tr('screenTitle.info')),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: AppDecorations.backgroundImage,
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      _buildSafeFastavalCard(),
                      _buildOpenHoursCard(),
                      _buildWifiCard(),
                      _buildLostFoundCard(),
                      _buildTransportCard(),
                      _buildFastaWearCard(),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildFastaWearCard() => textAndIconCard(
      tr('info.fastaWear.title'),
      Icons.shopping_bag_outlined,
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Row(
          children: [
            Flexible(
              child: Text(tr('info.fastaWear.text'), style: AppTextStyles.normal),
            ),
          ],
        ),
      ),
    );

Widget _buildLostFoundCard() => textAndIconCard(
      tr('info.lostAndFound.title'),
      Icons.move_to_inbox,
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Row(
          children: [
            Text(tr('info.lostAndFound.text'), style: AppTextStyles.normal)
          ],
        ),
      ),
    );

Widget _buildOpenHoursCard() => textAndIconCard(
      tr('info.openHours.title'),
      Icons.access_time,
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Column(
          children: [
            textRowHeader(tr('info.openHours.bar.title')),
            twoTextRow(
              tr('info.openHours.bar.day1'),
              AppConstants.serviceOpeningHours["bar"]!["day1"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.openHours.boardGames.title')),
            twoTextRow(
              tr('info.openHours.boardGames.day1'),
              AppConstants.serviceOpeningHours["boardGames"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.openHours.boardGames.day2'),
              AppConstants.serviceOpeningHours["boardGames"]!["day2"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.openHours.information.title')),
            twoTextRow(
              tr('info.openHours.information.day1'),
              AppConstants.serviceOpeningHours["information"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.openHours.information.day2'),
              AppConstants.serviceOpeningHours["information"]!["day2"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.openHours.information.day3'),
              AppConstants.serviceOpeningHours["information"]!["day3"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.openHours.kiosk.title')),
            twoTextRow(
              tr('info.openHours.kiosk.day1'),
              AppConstants.serviceOpeningHours["kiosk"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.openHours.kiosk.day2'),
              AppConstants.serviceOpeningHours["kiosk"]!["day2"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.openHours.ottosLivingRoom.title')),
            twoTextRow(
              tr('info.openHours.ottosLivingRoom.day1'),
              AppConstants.serviceOpeningHours["ottosLivingRoom"]!["day1"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.openHours.coffeeCafe.title')),
            twoTextRow(
              tr('info.openHours.coffeeCafe.day1'),
              AppConstants.serviceOpeningHours["coffeeCafe"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.openHours.coffeeCafe.day2'),
              AppConstants.serviceOpeningHours["coffeeCafe"]!["day2"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.openHours.coffeeCafe.day3'),
              AppConstants.serviceOpeningHours["coffeeCafe"]!["day3"]!,
              sidePadding: true,
            ),
            SizedBox(height: 20),
            SizedBox(height: 1, child: Divider(color: AppColors.textPrimary)),
            SizedBox(height: 20),
            textRowHeader(tr('info.stores.store1.title')),
            twoTextRow(
              tr('info.stores.store1.day1'),
              AppConstants.storeOpeningHours["store1"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.stores.store1.day2'),
              AppConstants.storeOpeningHours["store1"]!["day2"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.stores.store1.day3'),
              AppConstants.storeOpeningHours["store1"]!["day3"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.stores.store2.title')),
            twoTextRow(
              tr('info.stores.store2.day1'),
              AppConstants.storeOpeningHours["store2"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.stores.store2.day2'),
              AppConstants.storeOpeningHours["store2"]!["day2"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.stores.store2.day3'),
              AppConstants.storeOpeningHours["store2"]!["day3"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.stores.store3.title')),
            twoTextRow(
              tr('info.stores.store3.day1'),
              AppConstants.storeOpeningHours["store3"]!["day1"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.stores.store3.day2'),
              AppConstants.storeOpeningHours["store3"]!["day2"]!,
              sidePadding: true,
            ),
            twoTextRow(
              tr('info.stores.store3.day3'),
              AppConstants.storeOpeningHours["store3"]!["day3"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.stores.store4.title')),
            twoTextRow(
              tr('info.stores.store4.day1'),
              AppConstants.storeOpeningHours["store4"]!["day1"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
            textRowHeader(tr('info.stores.store5.title')),
            twoTextRow(
              tr('info.stores.store5.day1'),
              AppConstants.storeOpeningHours["store5"]!["day1"]!,
              sidePadding: true,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );

Widget _buildSafeFastavalCard() => textAndIconCard(
      tr('info.safe.title'),
      Icons.phone,
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Column(
          children: [
            twoTextRowWithTapAction(
              tr('info.safe.dutyGeneral'),
              AppConstants.dutyGeneralPhoneNumber["name"]!,
              Uri(scheme: 'tel', path: AppConstants.dutyGeneralPhoneNumber["value"]),
            ),
            SizedBox(height: 10),
            twoTextRowWithTapAction(
              tr('info.safe.heroForce'),
              AppConstants.heroForcePhoneNumber["name"]!,
              Uri(scheme: 'tel', path: AppConstants.heroForcePhoneNumber["value"]),
            ),
            SizedBox(height: 10),
            twoTextRowWithTapAction(
              tr('info.safe.safetyHost'),
              AppConstants.safetyHostPhoneNumber["name"]!,
              Uri(scheme: 'tel', path: AppConstants.safetyHostPhoneNumber["value"]),
            ),
            SizedBox(height: 10),
            twoTextRowWithTapAction(
              tr('info.safe.safetyMail'),
              AppConstants.safeFastavalEmail,
              Uri(scheme: 'mailto', path: AppConstants.safeFastavalEmail),
            ),
          ],
        ),
      ),
    );

Widget _buildTransportCard() => textAndIconCard(
      tr('info.transportAndParking.title'),
      Icons.local_parking,
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Column(
          children: [
            Text(tr('info.transportAndParking.text'), style: AppTextStyles.normal),
            SizedBox(height: 20),
            twoTextRowWithTapAction(
              tr('info.transportAndParking.taxi1'),
              AppConstants.taxi1PhoneNumber['name']!,
              Uri(scheme: 'tel', path: AppConstants.taxi1PhoneNumber['value']),
            ),
            SizedBox(height: 20),
            twoTextRowWithTapAction(
              tr('info.transportAndParking.taxi2'),
              AppConstants.taxi2PhoneNumber['name']!,
              Uri(scheme: 'tel', path: AppConstants.taxi2PhoneNumber['value']),
            ),
          ],
        ),
      ),
    );

Widget _buildWifiCard() => textAndIconCard(
      tr('info.wifi.title'),
      Icons.wifi,
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            twoTextRow(tr('info.wifi.networkName'), AppConstants.wifiNetworkName),
            SizedBox(height: 10),
            Text(tr('info.wifi.explainer'), style: AppTextStyles.normal),
          ],
        ),
      ),
    );
