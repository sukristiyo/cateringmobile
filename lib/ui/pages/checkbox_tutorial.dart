part of 'pages.dart';

class CheckBoxTutorial extends StatefulWidget {
  @override
  _CheckBoxTutorialState createState() => _CheckBoxTutorialState();
}

class _CheckBoxTutorialState extends State<CheckBoxTutorial> {
  bool nilai = false;
  bool nilai1 = false;
  bool nilai2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blackColor),
          onPressed: () {
            Navigator.pushNamed(context, '/home_page');
          },
        ),
        title: Text('Belajar CheckBox'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkbox_tutorial2');
              },
              child: Text(
                'Menuju tutorial CheckBox 2',
                style: GoogleFonts.poppins(
                    fontSize: 18, color: CupertinoColors.systemYellow),
              ),
            ),
          ),
          Center(
            child: Text(
              'Single CheckBox',
              textAlign: TextAlign.center, // Gak ngaruh
              style: GoogleFonts.poppins(
                  fontSize: 25, color: CupertinoColors.systemYellow),
            ),
          ),
          singleCheckBox(),
          Divider(thickness: 2, indent: 35),
          Center(
            child: Text(
              'CheckBox List',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 25, color: CupertinoColors.systemYellow),
            ),
          ),
          // checkboxList(),
          CheckboxListTile(
            title: Text('CheckboxListTile 1'),
            value: nilai1,
            onChanged: (newNilai1) {
              setState(
                () {
                  nilai1 = newNilai1;
                  print(nilai1);
                  print('Nilai1 = $nilai1');
                },
              );
            },
          ),
          CheckboxListTile(
            title: Text('CheckboxListTile 2'),
            value: nilai2,
            onChanged: (newNilai2) {
              setState(
                () {
                  nilai2 = newNilai2;
                  print(nilai2);
                  print('Nilai2 = $nilai2');
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget singleCheckBox() {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          child: Checkbox(
            value: nilai,
            onChanged: (newNilai) {
              setState(
                () {
                  nilai = !nilai;
                  print('Nilai = $nilai');
                  print(nilai);
                },
              );
            },
          ),
        ),
        Text('Single Checkbox saja'),
      ],
    );
  }

  Widget singleCheckBox1() {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          child: Checkbox(
            value: nilai1,
            onChanged: (newNilai1) {
              setState(
                () {
                  nilai1 = !nilai1;
                  print(nilai1);
                  print('Nilai1 = $nilai1');
                },
              );
            },
          ),
        ),
        Text('Single Checkbox saja'),
      ],
    );
  }

  List<Widget> checkboxList() {
    return [
      CheckboxListTile(
        title: Text('CheckboxListTile 1'),
        value: nilai,
        onChanged: (newNilai) {},
      ),
    ];
  }
}
