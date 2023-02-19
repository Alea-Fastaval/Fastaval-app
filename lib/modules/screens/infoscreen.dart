import 'package:easy_localization/easy_localization.dart';
import 'package:fastaval_app/constants/styleconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildSideBySideText(String left, String right, [bool? selectable]) {
  selectable = selectable ?? false;
  return Row(
    children: <Widget>[
      Expanded(
        flex: 4,
        child: Text(
          left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      Expanded(
        flex: 6,
        child: selectable
            ? SelectableText(
                right,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'OpenSans',
                ),
              )
            : Text(
                right,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'OpenSans',
                ),
              ),
      ),
    ],
  );
}

Widget buildSideBySideTextWithUrlAction(String title, String link, Uri url) {
  return Row(
    children: <Widget>[
      Expanded(
        flex: 11,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      Expanded(
        flex: 9,
        child: GestureDetector(
          onTap: () {
            canLaunchUrl(url).then((bool result) async {
              if (result) {
                await launchUrl(url);
              }
            });
          },
          child: Text(
            url.path,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildFastaWaer() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.person),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: Text(
            tr('info.fastaWear.title'),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr('info.fastaWear.text'),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'OpenSans',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildLostFound() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.move_to_inbox),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: Text(
            tr('info.lostAndFound.title'),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr('info.lostAndFound.text'),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildOpenHours() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.access_time),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: Text(
            tr('info.openHours.title'),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr('info.openHours.information.title'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText(
                        tr('info.openHours.information.day1.text'),
                        tr('info.openHours.information.day1.time')),
                    buildSideBySideText(
                        tr('info.openHours.information.day2.text'),
                        tr('info.openHours.information.day2.time')),
                    buildSideBySideText(
                        tr('info.openHours.information.day3.text'),
                        tr('info.openHours.information.day3.time')),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  tr('info.openHours.coffeeCafe.title'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText(
                        tr('info.openHours.coffeeCafe.day1.text'),
                        tr('info.openHours.coffeeCafe.day1.time')),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  tr('info.openHours.boardgames.title'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText(
                        tr('info.openHours.boardgames.day1.text'),
                        tr('info.openHours.boardgames.day1.time')),
                    buildSideBySideText(
                        tr('info.openHours.boardgames.day2.text'),
                        tr('info.openHours.boardgames.day2.time')),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Kiosken:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText('Ons-lør:', 'kl. 09:00 - 00:00'),
                    buildSideBySideText('Søndag:', 'kl. 09:00 - 17:00'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Baren:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText('Ons-søn:', 'kl. 17:00 - 02:00'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Oasen:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText('Onsdag:', 'kl. 16:00 - 02:00'),
                    buildSideBySideText('Tor-lør:', 'kl. 12:00 - 02:00'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildSafeFastaval() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: const Text(
            'Safe Fastaval',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                buildSideBySideTextWithUrlAction(
                    'Vagthavende General:',
                    '+45 61 40 90 65',
                    Uri(
                      scheme: 'tel',
                      path: '+4561409065',
                    )),
                const SizedBox(
                  height: 10,
                ),
                buildSideBySideTextWithUrlAction(
                    'GDS:',
                    '+45 61 40 92 63',
                    Uri(
                      scheme: 'tel',
                      path: '+4561409263',
                    )),
                const SizedBox(
                  height: 10,
                ),
                buildSideBySideTextWithUrlAction(
                    'Tryghedsvært:',
                    '+45 61 40 92 64',
                    Uri(
                      scheme: 'tel',
                      path: '+4561409264',
                    )),
                const SizedBox(
                  height: 10,
                ),
                buildSideBySideTextWithUrlAction(
                    'Safemail:',
                    'safe@fastaval.dk',
                    Uri(
                      scheme: 'mailto',
                      path: 'safe@fastaval.dk',
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildStores() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.store),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: const Text(
            'Butikker',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Epic Panda i B45',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText('Onsdag:', 'kl. 16.00 - 23.00'),
                    buildSideBySideText('Tors-lør:', 'kl. 10.00 - 23.00'),
                    buildSideBySideText('Søndag:', 'kl. 10.00 - 15.00'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tier1MTG i A07',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText('Ons-søn:', 'kl. 10.00 - 22.00'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Corra Design i fællesområdet',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    buildSideBySideText('Fre-søn:', 'kl. 10.00 - 16.00'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildTransport() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.local_parking),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: const Text(
            'Transport og Parkering',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5),
                const Text(
                    "Parkering kan gøres på Gymnasiets eller Idrætscenterets Parkeringsplads.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                    )),
                const SizedBox(height: 10),
                const Text("Hobro Togstation er ca. 2,5 km fra Fastaval.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                    )),
                const SizedBox(height: 10),
                buildSideBySideTextWithUrlAction(
                    'Hobro Taxa:',
                    '+45 98 51 23 00',
                    Uri(
                      scheme: 'tel',
                      path: '+4598512300',
                    )),
                const SizedBox(height: 10),
                buildSideBySideTextWithUrlAction(
                    'Krone Taxa:',
                    '+45 98 52 11 11',
                    Uri(
                      scheme: 'tel',
                      path: '+4598521111',
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildWiFi() {
  return SizedBox(
    width: double.infinity,
    child: Card(
      margin: kCardMargin,
      elevation: 5,
      child: Padding(
        padding: kCardPadding,
        child: ListTile(
          trailing: const Icon(Icons.wifi),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: const Text(
            'WIFI',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildSideBySideText('Netværk:', 'Undervisning'),
                buildSideBySideText('Brugernavn:', 'mfg-guest@mf-gym.dk', true),
                buildSideBySideText('Kode:', 'Teleskop2022', true),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFF9800),
                      Color(0xFFFB8c00),
                      Color(0xFFF57C00),
                      Color(0xFFEF6c00),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildSafeFastaval(),
                      _buildWiFi(),
                      _buildOpenHours(),
                      _buildStores(),
                      _buildFastaWaer(),
                      _buildLostFound(),
                      _buildTransport(),
                      const Padding(padding: EdgeInsets.only(bottom: 80))
                    ],
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
