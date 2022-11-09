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