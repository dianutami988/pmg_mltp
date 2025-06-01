class Kabupaten {
  final int? id;
  final String nama;
  final String logoUrl;
  final String pusatPemerintahan;
  final String bupati;
  final String luasWilayah;
  final int jumlahPenduduk;
  final int jumlahKecamatan;
  final int jumlahKelurahan;
  final int jumlahDesa;
  final String website;

  Kabupaten({
    this.id,
    required this.nama,
    required this.logoUrl,
    required this.pusatPemerintahan,
    required this.bupati,
    required this.luasWilayah,
    required this.jumlahPenduduk,
    required this.jumlahKecamatan,
    required this.jumlahKelurahan,
    required this.jumlahDesa,
    required this.website,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'logoUrl': logoUrl,
      'pusatPemerintahan': pusatPemerintahan,
      'bupati': bupati,
      'luasWilayah': luasWilayah,
      'jumlahPenduduk': jumlahPenduduk,
      'jumlahKecamatan': jumlahKecamatan,
      'jumlahKelurahan': jumlahKelurahan,
      'jumlahDesa': jumlahDesa,
      'website': website,
    };
  }

  factory Kabupaten.fromMap(Map<String, dynamic> map) {
    return Kabupaten(
      id: map['id'],
      nama: map['nama'],
      logoUrl: map['logoUrl'],
      pusatPemerintahan: map['pusatPemerintahan'],
      bupati: map['bupati'],
      luasWilayah: map['luasWilayah'],
      jumlahPenduduk: map['jumlahPenduduk'],
      jumlahKecamatan: map['jumlahKecamatan'],
      jumlahKelurahan: map['jumlahKelurahan'],
      jumlahDesa: map['jumlahDesa'],
      website: map['website'],
    );
  }
}
