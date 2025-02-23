import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion1/view/settings/about_us.dart';
import 'package:fashion1/view/settings/account.dart';

class SettingsPage extends StatelessWidget {
  final _selectedIndex = 0.obs;

  void _onTileTap(int index) {
    _selectedIndex.value = index;
    Get.snackbar('Selected', 'Selected: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView(
                  children: [
                    SettingsTile(
                        icon: Icons.account_circle_outlined,
                        title: 'Account',
                        isSelected: _selectedIndex.value == 0,
                        onTap: () {
                          _onTileTap(0);
                          Get.to(() => AccountPage());
                        }),
                    SettingsTile(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Mode',
                      isSelected: _selectedIndex.value == 1,
                      onTap: () {
                        if (Get.isDarkMode) {
                          Get.changeTheme(ThemeData.light());
                        } else {
                          Get.changeTheme(ThemeData.dark());
                        }
                      },
                    ),
                    SettingsTile(
                        icon: Icons.bug_report_outlined,
                        title: 'Report a bug',
                        isSelected: _selectedIndex.value == 2,
                        onTap: () => _showReportBugDialog(context)),
                    SettingsTile(
                        icon: Icons.info_outline,
                        title: 'About us',
                        isSelected: _selectedIndex.value == 3,
                        onTap: () {
                          _onTileTap(3);
                          Get.to(() => AboutUsPage());
                        }),
                  ],
                ),
              ),
            ),
            UserInfoTile(),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SettingsTile({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black, size: 30),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.black,
            child: Text(
              'K',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'khaled alaya',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'khaled@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app, color: Colors.black, size: 30),
          ),
        ],
      ),
    );
  }
}

void _showReportBugDialog(BuildContext context) {
  final TextEditingController _reportController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        title: Text(
          'Report',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Report a bug:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity * 0.4,
              height: 50,
              child: TextField(
                controller: _reportController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the report submission logic here
                print('Report: ${_reportController.text}');
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Send'),
            ),
          ],
        ),
      );
    },
  );
}
