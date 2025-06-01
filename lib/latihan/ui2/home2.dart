import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:p11/latihan/helper2/db_helper.dart';
import 'package:p11/latihan/models2/kabupaten.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DBHelper dbHelper = DBHelper();
  List<Kabupaten> kabupatenList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await dbHelper.getAllKabupaten();
    print('Jumlah data awal di DB: ${data.length}');

    if (data.isEmpty) {
      print('DB kosong, insert dummy...');
      await _insertDummyData();
      data = await dbHelper.getAllKabupaten();
      print('Jumlah data setelah insert: ${data.length}');
    }

    setState(() {
      kabupatenList = data;
    });
  }

  Future<void> _insertDummyData() async {
    final dummyData = [
      Kabupaten(
        nama: 'Kabupaten Bengkalis',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Logo_Bengkalis.png/240px-Logo_Bengkalis.png',
        pusatPemerintahan: 'Bengkalis',
        bupati: 'Kasmarni',
        luasWilayah: '8.586,71 km²',
        jumlahPenduduk: 492800,
        jumlahKecamatan: 12,
        jumlahKelurahan: 56,
        jumlahDesa: 108,
        website: 'https://bengkaliskab.go.id/',
      ),
      Kabupaten(
        nama: 'Kota Pekanbaru',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Logo_Kota_Pekanbaru.png/240px-Logo_Kota_Pekanbaru.png',
        pusatPemerintahan: 'Pekanbaru',
        bupati: 'Firdaus',
        luasWilayah: '632,26 km²',
        jumlahPenduduk: 1050000,
        jumlahKecamatan: 12,
        jumlahKelurahan: 83,
        jumlahDesa: 0,
        website: 'https://pekanbaru.go.id/',
      ),
      // Tambahkan kabupaten/kota lain sesuai data Wikipedia
    ];

    for (var kab in dummyData) {
      await dbHelper.insertKabupaten(kab);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kabupaten/Kota Riau',
      home: Scaffold(
        appBar: AppBar(title: Text('Daftar Kabupaten/Kota Riau')),
        body: ListView.builder(
          itemCount: kabupatenList.length,
          itemBuilder: (context, index) {
            final kab = kabupatenList[index];
            return ListTile(
              title: Text(kab.nama),
              subtitle: Text('Pusat Pemerintahan: ${kab.pusatPemerintahan}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(kabupaten: kab)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Kabupaten kabupaten;

  DetailPage({required this.kabupaten});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kabupaten.nama)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(kabupaten.logoUrl, height: 120),
            SizedBox(height: 16),
            Text(
              'Nama: ${kabupaten.nama}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Pusat Pemerintahan: ${kabupaten.pusatPemerintahan}'),
            Text('Bupati/Walikota: ${kabupaten.bupati}'),
            Text('Luas Wilayah: ${kabupaten.luasWilayah}'),
            Text('Jumlah Penduduk: ${kabupaten.jumlahPenduduk}'),
            Text('Jumlah Kecamatan: ${kabupaten.jumlahKecamatan}'),
            Text('Jumlah Kelurahan: ${kabupaten.jumlahKelurahan}'),
            Text('Jumlah Desa: ${kabupaten.jumlahDesa}'),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.open_in_browser),
              label: Text('Buka Website Resmi'),
              onPressed: () async {
                final url = kabupaten.website;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tidak dapat membuka link')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
