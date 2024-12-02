import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pixez/i18n.dart';
import 'package:pixez/main.dart';

class NetworkSelectPage extends StatefulWidget {
  @override
  _NetworkSelectPageState createState() => _NetworkSelectPageState();
}

class _NetworkSelectPageState extends State<NetworkSelectPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: userSetting.disableBypassSni ? 1 : 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  I18n.of(context).network_question,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 24,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        text: "Nope",
                      ),
                      Tab(
                        text: "Yes",
                      ),
                    ],
                    onTap: (index) async {
                      await userSetting.setDisableBypassSni(index != 0);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
