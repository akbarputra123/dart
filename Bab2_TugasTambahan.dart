
enum StatusMahasiswa { aktif, cuti, alumni }

abstract class Kehadiran {
  void absensi();
}


mixin AktivitasOrganisasi {
  void ikutOrganisasi(String organisasi) {
    print('Ikut dalam organisasi $organisasi');
  }
}

class Mahasiswa {
  String nama;
  String _npm;
  String jurusan;
  StatusMahasiswa status;

  Mahasiswa(this.nama, this._npm, this.jurusan, this.status);

  String get npm => _npm;
  set npm(String value) {
    if (value.length == 8) {
      _npm = value;
    } else {
      print('NPM harus 8 karakter.');
    }
  }

  
  void belajar() {
    print('$nama sedang belajar.');
  }

  void menyelesaikanTugas() {
    print('$nama telah menyelesaikan tugas.');
  }

  void cekStatus() {
    print('$nama memiliki status $status');
  }
}


class MahasiswaAktif extends Mahasiswa with AktivitasOrganisasi implements Kehadiran {
  int semester;

  
  MahasiswaAktif(String nama, String npm, String jurusan, StatusMahasiswa status, this.semester)
      : super(nama, npm, jurusan, status);

 
  @override
  void absensi() {
    print('$nama telah hadir di kelas.');
  }
  void ambilKRS() {
    print('$nama sedang mengambil KRS untuk semester $semester');
  }
}

void main() {

  var mahasiswa = MahasiswaAktif('Budi', '12345678', 'Informatika', StatusMahasiswa.aktif, 5);
  mahasiswa.belajar();
  mahasiswa.menyelesaikanTugas();
  mahasiswa.absensi();
  mahasiswa.ambilKRS();
  mahasiswa.ikutOrganisasi('BEM');
  mahasiswa.cekStatus();
}