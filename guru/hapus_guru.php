<?php
$koneksi = mysqli_connect("localhost", "root", "", "sekolah");

if (mysqli_connect_errno()) {
    echo "Koneksi database gagal.";
    exit();
}

$nip = $_GET['id'];

$cekwalikelas = "SELECT * FROM kelas WHERE guru_nip = '$nip'";
$resultkelas = mysqli_query($koneksi, $cekwalikelas);

$cekEskul = "SELECT * FROM eskul WHERE guru_nip = '$nip'";
$resultEskul = mysqli_query($koneksi, $cekEskul);

if (mysqli_num_rows($resultkelas) > 0 || mysqli_num_rows($resultEskul) > 0) {
    echo "Peringatan: Guru dengan NIP " . $nip . " terdaftar sebagai wali kelas atau dalam eskul. Guru tidak dapat dihapus.";
    echo '<script>
            var konfirmasi = confirm("Guru ini terdaftar sebagai wali kelas atau pembina. Lanjutkan penghapusan?");
            if (konfirmasi) {
                window.location.href = "proses_hapus_guru.php?id=' . $nip . '";
            } else {
                window.location.href = "guru.php";
            }
          </script>';
} else {
    $hapus = "DELETE FROM guru WHERE nip = '$nip'";
    
    if (mysqli_query($koneksi, $hapus)) {
        echo "Data guru dengan NIP " . $nip . " berhasil dihapus.";
        header("Location: guru.php");
        exit();
    } else {
        echo "Gagal menghapus data guru.";
    }
}

mysqli_close($koneksi);
?>
