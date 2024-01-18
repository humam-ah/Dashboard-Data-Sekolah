<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Siswa</title>
    <link rel="stylesheet" href="../bootstrap-5.3.2-dist/css/bootstrap.min.css">
</head>
<body>

    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
            <a href="siswa.php" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Kembali
            </a>
        </div>
    </div>

<?php
$koneksi = mysqli_connect("localhost", "root", "", "sekolah");

if (isset($_GET['id'])) {
    $nis = $_GET['id'];
    $query = "SELECT * FROM siswa WHERE nis = '$nis'";
    $result = mysqli_query($koneksi, $query);
    $data = mysqli_fetch_assoc($result);

    if (!$data) {
        die("Siswa tidak ditemukan");
    }
} else {
    die("NIS tidak ditemukan");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST['nama'];
    $alamat = $_POST['alamat'];
    $tanggal_lahir = $_POST['tanggal_lahir'];
    $gender = $_POST['gender'];
    $nis2 = $_POST['nis'];

    $update_query = "UPDATE siswa SET nama='$nama', nis='$nis2', alamat='$alamat', tanggal_lahir='$tanggal_lahir', gender_id_gender='$gender' WHERE nis='$nis'";
    
    if (mysqli_query($koneksi, $update_query)) {
        echo "Data siswa berhasil diupdate!";
    } else {
        echo "Error: " . mysqli_error($koneksi);
    }

    mysqli_close($koneksi);

    header("Location: siswa.php");
    exit;
}

?>
<div class="container mt-5">
    <h2>Edit Siswa</h2>
    <form action="" method="post">
        <div class="mb-3">
            <label for="nama" class="form-label">Nama</label>
            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo $data['nama']; ?>" required>
        </div>
        <div class="mb-3">
            <label for="nis" class="form-label">NIS</label>
            <input type="text" class="form-control" id="nis" name="nis" value="<?php echo $data['nis']; ?>" required>
        </div>
        <div class="mb-3">
            <label for="alamat" class="form-label">Alamat</label>
            <textarea class="form-control" id="alamat" name="alamat" rows="3" required><?php echo $data['alamat']; ?></textarea>
        </div>
        <div class="mb-3">
            <label for="tanggal_lahir" class="form-label">Tanggal Lahir</label>
            <input type="date" class="form-control" id="tanggal_lahir" name="tanggal_lahir" value="<?php echo $data['tanggal_lahir']; ?>" required>
        </div>
        <div class="mb-3">
            <label for="gender" class="form-label">Gender</label>
            <select class="form-control" id="gender" name="gender" required>
                <option value="0" <?php if ($data['gender_id_gender'] == '0') echo 'selected'; ?>>Perempuan</option>
                <option value="1" <?php if ($data['gender_id_gender'] == '1') echo 'selected'; ?>>Laki-laki</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

</body>
</html>
