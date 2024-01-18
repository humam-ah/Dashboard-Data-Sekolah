<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../bootstrap-5.3.2-dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center">
        <a href="..\home.php" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
        <h2>Data Siswa</h2>
        <a href="tambah_siswa.php" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tambah Siswa
        </a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>NAMA</th>
                <th>NIS</th>
                <th>ALAMAT</th>
                <th>TANGGAL LAHIR</th>
                <th>GENDER</th>
                <th>EDIT</th>
                <th>HAPUS</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $koneksi = mysqli_connect("localhost", "root", "", "sekolah");

            $tampil = "SELECT 
                            nama,
                            nis,
                            alamat,
                            tanggal_lahir,
                            CASE 
                                WHEN gender_id_gender = 0 THEN 'perempuan'
                                ELSE 'laki-laki'
                            END AS gender
                        FROM siswa";
            $hasil  = mysqli_query($koneksi, $tampil);

            while ($data = mysqli_fetch_array($hasil)) {
                echo "<tr>";
                echo "<td>" . $data['nama'] . "</td>";
                echo "<td>" . $data['nis'] . "</td>";
                echo "<td>" . $data['alamat'] . "</td>";
                echo "<td>" . $data['tanggal_lahir'] . "</td>";
                echo "<td>" . $data['gender'] . "</td>";
                echo "<td><a href='edit_siswa.php?id=" . $data['nis'] . "' class='btn btn-primary btn-sm'>Edit</a></td>";
                echo "<td><a href='hapus_siswa.php?id=" . $data['nis'] . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Apakah Anda yakin ingin menghapus siswa ini?\")'>Hapus</a></td>";
                echo "</tr>";
            }
            mysqli_close($koneksi);
            ?>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>