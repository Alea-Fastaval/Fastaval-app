import 'package:easy_localization/easy_localization.dart';
import 'package:fastaval_app/controllers/notification.controller.dart';
import 'package:fastaval_app/core/theme/app_colors.dart';
import 'package:fastaval_app/core/theme/app_decorations.dart';
import 'package:fastaval_app/core/theme/app_text_styles.dart';
import 'package:fastaval_app/services/config.service.dart';
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
                      //_buildWifiCard(),
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
              child:
                  Text(tr('info.fastaWear.text'), style: AppTextStyles.normal),
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
            Builder(builder: (_) {
              final svc = ConfigService.instance.getServiceOpeningHours();
              final stores = ConfigService.instance.getStoreOpeningHours();
              final children = <Widget>[];

              // Render service opening hours only for entries present in remote config
              svc.entries.toList()
                ..sort((a, b) => a.key.compareTo(b.key))
                ..forEach((entry) {
                  final serviceKey = entry.key;
                  final days = Map<String, String>.from(entry.value);
                  if (days.isEmpty) return;

                  children.add(
                      textRowHeader(tr('info.openHours.$serviceKey.title')));

                  final dayEntries = days.entries.toList()
                    ..sort((a, b) => a.key.compareTo(b.key));
                  for (var d in dayEntries) {
                    children.add(twoTextRow(
                      tr('info.openHours.$serviceKey.${d.key}'),
                      d.value,
                      sidePadding: true,
                    ));
                  }

                  children.add(SizedBox(height: 20));
                });

              // Divider between services and stores when both present
              if (svc.isNotEmpty && stores.isNotEmpty) {
                children.add(SizedBox(
                    height: 1, child: Divider(color: AppColors.textPrimary)));
                children.add(SizedBox(height: 20));
              }

              // Render store opening hours only for entries present in remote config
              stores.entries.toList()
                ..sort((a, b) => a.key.compareTo(b.key))
                ..forEach((entry) {
                  final storeKey = entry.key;
                  final storeMap = Map<String, dynamic>.from(entry.value);
                  if (storeMap.isEmpty) return;

                  // Title and location come from Remote Config now.
                  final rawTitle = storeMap['title']?.toString() ?? storeKey;
                  final rawLocation = storeMap['location']?.toString() ?? '';

                  final displayTitle =
                      rawTitle.contains('.') ? tr(rawTitle) : rawTitle;
                  final displayLocation =
                      rawLocation.contains('.') ? tr(rawLocation) : rawLocation;
                  final header = displayLocation.isNotEmpty
                      ? '$displayTitle @ $displayLocation'
                      : displayTitle;

                  // Build day rows either from the new `days` array format
                  // or fall back to legacy `day1`, `day2`, ... keys.
                  final dayRows = <Widget>[];

                  final daysArray = (storeMap['days'] is List)
                      ? List<dynamic>.from(storeMap['days'] as List)
                      : <dynamic>[];

                  if (daysArray.isNotEmpty) {
                    // helper: translate parts separated by '-' (e.g. "days.thu.short-days.sat.short")
                    String translateComposite(String raw) {
                      if (raw.isEmpty) return '';
                      return raw
                          .split('-')
                          .map((part) => part.contains('.') ? tr(part) : part)
                          .join('-');
                    }

                    for (var item in daysArray) {
                      if (item is Map) {
                        final rawLabel = item['title']?.toString() ?? '';
                        final label = translateComposite(rawLabel);
                        final time = item['time']?.toString() ?? '';
                        if (label.isEmpty && time.isEmpty) continue;
                        dayRows.add(twoTextRow(label, time, sidePadding: true));
                      }
                    }
                  } else {
                    // legacy fallback: day1/day2/... keys
                    final dayEntries = storeMap.entries
                        .where((e) => e.key.startsWith('day'))
                        .toList()
                      ..sort((a, b) => a.key.compareTo(b.key));

                    for (var d in dayEntries) {
                      dayRows.add(twoTextRow(
                        tr('info.stores.$storeKey.${d.key}'),
                        d.value.toString(),
                        sidePadding: true,
                      ));
                    }
                  }

                  // If there are no day rows, skip rendering this store entirely.
                  if (dayRows.isEmpty) return;

                  children.add(textRowHeader(header));
                  children.addAll(dayRows);
                  children.add(SizedBox(height: 10));
                });

              return Column(children: children);
            }),
            SizedBox(height: 10),
          ],
        ),
      ),
    );

Widget _buildSafeFastavalCard() {
  final boxes = ConfigService.instance.getInfoScreenBoxes();
  final safeBox = boxes.firstWhere(
    (b) =>
        b is Map && (b['title'] == 'info.safe.title' || b['icon'] == 'phone'),
    orElse: () => null,
  );

  if (safeBox == null) {
    return SizedBox.shrink();
  }

  final items = (safeBox['items'] as List<dynamic>?) ?? [];
  final children = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    final item = items[i] as Map<String, dynamic>;
    final textKey = item['text']?.toString() ?? '';
    final display =
        item['valueDisplay']?.toString() ?? item['value']?.toString() ?? '';
    final value = item['value']?.toString() ?? '';
    final type = item['type']?.toString() ?? '';

    if (type == 'phone') {
      children.add(twoTextRowWithTapAction(
          tr(textKey), display, Uri(scheme: 'tel', path: value)));
    } else if (type == 'email') {
      children.add(twoTextRowWithTapAction(
          tr(textKey), display, Uri(scheme: 'mailto', path: value)));
    } else {
      children.add(twoTextRow(tr(textKey), display, sidePadding: true));
    }

    if (i < items.length - 1) children.add(SizedBox(height: 10));
  }

  return textAndIconCard(
    tr('info.safe.title'),
    Icons.phone,
    Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
      child: Column(children: children),
    ),
  );
}

Widget _buildTransportCard() {
  final boxes = ConfigService.instance.getInfoScreenBoxes();
  final transportBox = boxes.firstWhere(
    (b) =>
        b is Map &&
        (b['title'] == 'info.transportAndParking.title' ||
            b['icon'] == 'local_parking'),
    orElse: () => null,
  );

  if (transportBox == null) return SizedBox.shrink();

  final items = (transportBox['items'] as List<dynamic>?) ?? [];
  final children = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    final item = items[i] as Map<String, dynamic>;
    final textKey = item['text']?.toString() ?? '';
    final display =
        item['valueDisplay']?.toString() ?? item['value']?.toString() ?? '';
    final value = item['value']?.toString() ?? '';
    final type = item['type']?.toString() ?? '';

    if (type == 'phone') {
      children.add(twoTextRowWithTapAction(
          tr(textKey), display, Uri(scheme: 'tel', path: value)));
    } else {
      children.add(twoTextRow(tr(textKey), display, sidePadding: true));
    }

    if (i < items.length - 1) children.add(SizedBox(height: 20));
  }

  return textAndIconCard(
    tr('info.transportAndParking.title'),
    Icons.local_parking,
    Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Column(children: children)),
  );
}

Widget _buildWifiCard() {
  final boxes = ConfigService.instance.getInfoScreenBoxes();
  final wifiBox = boxes.firstWhere(
    (b) => b is Map && (b['title'] == 'info.wifi.title' || b['icon'] == 'wifi'),
    orElse: () => null,
  );

  if (wifiBox == null) return SizedBox.shrink();

  final items = (wifiBox['items'] as List<dynamic>?) ?? [];
  final children = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    final item = items[i] as Map<String, dynamic>;
    final textKey = item['text']?.toString() ?? '';
    final display =
        item['valueDisplay']?.toString() ?? item['value']?.toString() ?? '';
    children.add(twoTextRow(tr(textKey), display, sidePadding: true));
    if (i < items.length - 1) children.add(SizedBox(height: 10));
  }

  return textAndIconCard(
    tr('info.wifi.title'),
    Icons.wifi,
    Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 24, 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children)),
  );
}
