Caroline Esther (2106751915)

# Tugas 7

### Jelaskan apa yang dimaksud dengan *stateless widget* dan *stateful widget* dan jelaskan perbedaan dari keduanya.
    
*Stateless widget* adalah *widget* yang tidak berubah atau *immutable*. Tampilan dan propertinya tidak akan berubah sepanjang masa hidupnya. Dengan kata lain, *stateless widget* tidak dapat mengubah *state*-nya saat *runtime* aplikasi. Contoh dari *stateless widget* adalah *Text, Icon, IconButton,* dan *RaisedButton*.

*Stateful widget* adalah *widget* yang dapat mengubah propertinya saat *runtime*. Widget ini dinamis atau *mutable*. *Stateful widget* dapat mengubah tampilannya sebagai respon dari *event* yang di-*trigger* oleh interaksi *user* atau ketika menerima data. Contoh dari *stateful widget* adalah *Checkbox, Radio Button, Slider, InkWell, Form,* dan *Textfield*.
    
Berikut adalah perbedaan dari keduanya.

*Stateless Widget*:
- Merupakan *widget* yang statis
- Tidak bergantung pada perubahan data atau *behavior* apapun
- *Stateless widget* tidak memiliki *state*, akan di-*render* satu kali dan tidak akan memperbarui dirinya sendiri. *Stateless widget* hanya akan berubah ketika data eksternal diubah.

*Stateful Widget*:
- Merupakan *widget* yang dinamis
- Dapat diperbarui ketika *runtime* berdasarkan aksi *user* atau perubahan data
- *Stateful widget* memiliki *state* internal dan dapat di-*render* kembali jika data input berubah atau jika *state widget* berubah

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Text: Menampilkan dan memberikan *style* tulisan
- Icon: Menampilkan simbol atau gambar sebagai representasi dari suatu objek yang melambangkan fungsi objek itu sendiri

### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState` berfungsi untuk memberitahu *framework* bahwa *state* internal dari *object* telah berubah dan menyebabkan *framework* menjadwalkan *build* untuk *state object* tersebut. Variabel yang terdampak dengan fungsi ini adalah variabel yang terdeklarasi secara global di sebuah  *class* dan bersifat *mutable*.
    
### Jelaskan perbedaan antara `const` dengan `final`.
Perbedaan utama antara `const` dengan `final` terdapat pada inialisasi nilai dari variabelnya. `const` mengharuskan variabel diinialisasi pada saat kompilasi, nilainya bersifat konstan, dan secara langsung/eksplisit, sehingga pada saat kompilasi variabel `const` sudah memiliki nilai. Sedangkan pada `final`, variabel tidak harus memiliki nilai secara langsung/eskplisit pada saat kompilasi.
    
### Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas.
1. Membuat program flutter dengan menjalankan perintah `flutter create count_7`.
2. Mengubah *title* pada *class* MyApp.
3. Menambahkan *method* `decrementCounter` yang berfungsi untuk mengurangi nilai pada variabel `counter`. Method ini akan mengurangi nilai `counter` sebanyak satu satuan. Apabila `counter` bernilai nol, maka tombol tidak memiliki efek apapun pada `counter`. 
4. Menambahkan *conditional* yang mengatasi text jika nilai `counter` genap atau ganjil.
5. Memodifikasi `floatingActionButton` sehingga *user* dapat menggunakan *button* sesuai dengan fungsinya.

#### Referensi:
- https://www.geeksforgeeks.org/difference-between-stateless-and-stateful-widget-in-flutter/
- https://api.flutter.dev/flutter/widgets/State/setState.html
- https://belajarflutter.com/perbedaan-final-dan-const-pada-dart-dan-flutter/#:~:text=Perbedaan%20utama%20ada%20pada%20inialisasi,final%20tidak%20mengharuskan%20variabel%20memiliki
- https://docs.flutter.dev/development/ui/widgets
- https://bahasakoding.com/mengenal-widget-icon-di-flutter/

# Tugas 8

### Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.
Pada `Navigator.push`, method push akan melakukan push terhadap route yang diberikan ke navigator, sedangkan pada `Navigator.pushReplacement`, method pushReplacement akan mengganti route terkini dari navigator dengan melakukan push terhadap route baru dan membuang route sebelumnya setelah route baru tersebut masuk.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Drawer: untuk menampilkan drawer yang menyediakan pilihan untuk pindah ka halaman lain
- TextFormField: untuk menerima input teks dari form
- Dropdownbutton: untuk menampilkan pilihan input yang berbentuk dropdown
- Navigator: untuk pindah ke halaman lain
- Form: untuk menerima input dari pengguna
- Text: untuk menampilkan tulisan
- ListTile: sebagai tempat untuk menampung widget lain

### Sebutkan jenis-jenis *event* yang ada pada Flutter (contoh: `onPressed`).
Beberapa contoh event yang ada pada flutter adalah sebagai berikut.
- `onPressed` : event akan terjadi ketika widget ditekan
- `onTap` : event akan terjadi ketika widget di-tap
- `onLongPress` : event akan terjadi ketika widget ditekan di tempat yang sama pada waktu lama
- `onVerticalDragStart` : event yang akan terjadi ketika pointer melakukan kontak dengan layar dan bergerak secara vertikal
- `onPanUpdate` : event yang akan terjadi ketika pointer yang sedang melakukan kontak dengan layar bergerak secara vertikal atau horizontal

### Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter.
Pada Flutter, navigation berbentuk seperti stack dari banyak halaman dimana halaman-halaman tersebut akan di-push dan di-pop. Ide dari implementasi push dan pop ini yang pada dasarnya digunakan untuk “mengganti” halaman dari aplikasi flutter. Pada `Navigator` , halaman yang terletak di paling atas stack yang terlihat di layar. Halaman yang terakhir dimasukkan adalah yang pertama dikeluarkan dari stack.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan drawer dalam sebuah file yang bernama `drawer.dart` terpisah
2. Pada file `drawer.dart`, tambahkan tiga widget navigasi yang akan muncul pada hamburger menu dengan builder
3. Membuat sebuah file baru bernama `form.dart` untuk meng-handle input user. Input yang diambil adalah judul, nominal, dan pilihan jenis. Sebagai tambahan, terdapat date picker untuk menambahkan elemen date. Terdapat juga button untuk menyimpan input.
4. Menambahkan sebuah file baru bernama `showdata.dart` yang akan meng-handle halaman yang memunculkan data budget dan elemen date. Data tersebut dimasukkan ke dalam List dan ditampilkan menggunakan widget Card.

#### Referensi:
- https://api.flutter.dev/flutter/widgets/Navigator/pushReplacement.html
- https://api.flutter.dev/flutter/widgets/Navigator/push.html
- https://docs.flutter.dev/development/ui/advanced/gestures
- https://www.appsdeveloperblog.com/handle-button-tap-event-in-flutter/#:~:text=The%20two%20most%20commonly%20used%20button%20events%20are%20onTap%20and%20onPressed