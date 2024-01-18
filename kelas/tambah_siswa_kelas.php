<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Siswa</title>
    <link rel="stylesheet" href="../bootstrap-5.3.2-dist/css/bootstrap.min.css">
</head>
<body>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["kelas_id"], $_POST["siswa_nis"])) {
    $koneksi = mysqli_connect("localhost", "root", "", "sekolah");

    $kelas_id = $_POST["kelas_id"];
    $siswa_nis = $_POST["siswa_nis"];
    $insert_query = "INSERT INTO komposisi_kelas (kelas_id_kelas, siswa_nis) VALUES ('$kelas_id', '$siswa_nis')";

    if (mysqli_query($koneksi, $insert_query)) {
        echo "siswa berhasil ditambahkan.";
        header("Location: kelas.php");
        exit;
    } else {
        echo "Error: " . $insert_query . "<br>" . mysqli_error($koneksi);
    }

    mysqli_close($koneksi);
}
?>


<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center">
        <a href="lihat_siswa.php" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
        <h2>Tambah Siswa</h2>
    </div>

    <?php
    $koneksi = mysqli_connect("localhost", "root", "", "sekolah");

    if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
        $kelas_id = $_GET["id"];
        ?>
        <form action="" method="POST">
            <input type="hidden" name="kelas_id" value="<?php echo $kelas_id; ?>">
            <div class="mb-3">
                <label for="siswa_nis" class="form-label">Pilih Siswa</label>
                <select class="form-select" id="siswa_nis" name="siswa_nis" required>
                    <?php
                    $querySiswa = "SELECT siswa.nis, siswa.nama
                                   FROM siswa
                                   WHERE siswa.nis NOT IN (
                                       SELECT komposisi_kelas.siswa_nis
                                       FROM komposisi_kelas
                                       WHERE komposisi_kelas.kelas_id_kelas = $kelas_id
                                   )";

                    $resultSiswa = mysqli_query($koneksi, $querySiswa);

                    while ($siswa_data = mysqli_fetch_array($resultSiswa)) {
                        echo "<option value='" . $siswa_data['nis'] . "'>" . $siswa_data['nama'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Tambah Siswa</button>
        </form>
        <?php
    }
    mysqli_close($koneksi);
    ?>
</div>    


</body>
</html>
