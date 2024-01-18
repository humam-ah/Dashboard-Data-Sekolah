<?php
$koneksi = mysqli_connect("localhost", "root", "", "sekolah");

if (mysqli_connect_errno()) {
    echo "Koneksi database gagal.";
    exit();
}

$nip = $_GET['id'];

$hapusKomposisikelas = "DELETE FROM kelas WHERE guru_nip = '$nip'";
if (!mysqli_query($koneksi, $hapusKomposisikelas)) {
    echo "Gagal menghapus Guru dari tabel kelas.";
    exit();
}

$hapusKomposisiEskul = "DELETE FROM eskul WHERE guru_nip = '$nip'";
if (!mysqli_query($koneksi, $hapusKomposisiEskul)) {
    echo "Gagal menghapus Guru dari tabel eskul.";
    exit();
}

$hapusSiswa = "DELETE FROM guru WHERE nip = '$nip'";
if (mysqli_query($koneksi, $hapusSiswa)) {
    echo "Data guru dengan NIP " . $nip . " berhasil dihapus.";
    header("Location: guru.php");
    exit();
} else {
    echo "Gagal menghapus data guru.";
}

mysqli_close($koneksi);
?>
