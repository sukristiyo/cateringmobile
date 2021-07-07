part of 'pages.dart';

class CheckBoxTutorial2 extends StatefulWidget {
  @override
  _CheckBoxTutorial2State createState() => _CheckBoxTutorial2State();
}

class _CheckBoxTutorial2State extends State<CheckBoxTutorial2> {
  bool value = false;

  final notifications = [
    NotificationSetting(title: 'Checkbox 1 dong'),
    NotificationSetting(title: 'Checkbox 2 dong'),
    NotificationSetting(title: 'Checkbox 3 dong'),
    NotificationSetting(title: 'Checkbox 4 dong'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'), // Kekmana bikin Text(widget.title),
      ),
      body: ListView(
        children: [
          // buildCheckbox(), // Diganti dengan arraykah?
          ...notifications.map(buildSingleCheckbox).toList(),
        ],
      ),
    );
  }

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
      notification: notification,
      onClicked: () {
        setState(() {
          final newValue = !notification.value;
          notification.value = newValue;
        });
      });

  Widget buildCheckbox(
          // Penambahan baru tentang required
          {
    @required NotificationSetting notification, //Masih belum tau apa artinya
    @required VoidCallback onClicked, //Masih belum tau apa artinya
  }
          // Batas penambahannya sampai atas saja
          ) =>
      ListTile(
        onTap:
            onClicked, // sebelumnya ini adalah setState dari this.value = !value
        leading: Checkbox(
          value: value,
          onChanged: (value) =>
              onClicked(), // Sebelumnya ini adalah setState dari this.value=value
        ),
        title: Text(notification.title),
      );
}

// SEHARUSNYA DI HALAMAN BARU, TAPI INI UNTUK BELAJAR SAJA,
// JADI GAK APA-APA DIJADIKAN SATU HALAMAN SAJA
class NotificationSetting {
  String title;
  bool value;

  NotificationSetting({
    @required this.title,
    this.value = false,
  });
}
