import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(
                    'https://storage.googleapis.com/a1aa/image/6Yg_Zr-fo3fsXlC0CYiqVGFEucCgr5tTyaobINLec-A.jpg',
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Take Care!',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Richa Bose',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Settings',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildSettingsItem(Icons.notifications, 'Notification',
                'Check your medicine notification'),
            _buildSettingsItem(
                Icons.volume_up, 'Sound', 'Ring, Silent, Vibrate'),
            _buildSettingsItem(Icons.person, 'Manage Your Account',
                'Password, Email ID, Phone Number'),
            _buildSettingsItem(Icons.notifications, 'Notification',
                'Check your medicine notification'),
            _buildSettingsItem(Icons.notifications, 'Notification',
                'Check your medicine notification'),
            const SizedBox(height: 24),
            const Text(
              'Device',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSettingsItem(
                      Icons.volume_up, 'Connect', 'Bluetooth, Wi-Fi',
                      isInner: true),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _buildSettingsItem(Icons.volume_up, 'Sound Option',
                        'Ring, Silent, Vibrate',
                        isInner: true),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Caretakers: 03',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _buildCaretakerAvatar(
                      'https://storage.googleapis.com/a1aa/image/btuPK8Wx79JwTp2QaiY4kdPEXbjJTdNE7rgJyxPuKrU.jpg'),
                  const SizedBox(width: 8),
                  _buildCaretakerAvatar(
                      'https://storage.googleapis.com/a1aa/image/xH8VRwIRscX8dsAtrdnk29wzmt6559hHrEF7V7t_APA.jpg'),
                  const SizedBox(width: 8),
                  _buildCaretakerAvatar(
                      'https://storage.googleapis.com/a1aa/image/OIVrydOog1TFFL4I5_WPGX_x6YlJI9tm_hfQGguwWhM.jpg'),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.add, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue[200],
                    child: const Icon(Icons.add, color: Colors.blue),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Your Doctor',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Or use invite link',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildLinkItem('Privacy Policy'),
            _buildLinkItem('Terms of Use'),
            _buildLinkItem('Rate Us'),
            _buildLinkItem('Share'),
            const SizedBox(height: 24),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, String subtitle,
      {bool isInner = false}) {
    return Row(
      children: [
        Icon(icon, color: isInner ? Colors.grey : Colors.grey[400]),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCaretakerAvatar(String imageUrl) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: NetworkImage(imageUrl),
    );
  }

  Widget _buildLinkItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
