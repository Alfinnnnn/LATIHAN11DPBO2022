<?php

include("conf.php");
include("includes/Template.class.php");
include("includes/DB.class.php");
include("includes/member.php");


$member = new member($db_host, $db_user, $db_pass, $db_name);
$member->open();
$member->getmember();

if (isset($_POST['add'])) {
    //memanggil add
    $member->add($_POST);
    header("location:member.php");
}

if (!empty($_GET['id_hapus'])) {
    //memanggil add
    $id = $_GET['id_hapus'];

    $member->delete($id);
    header("location:member.php");
}

if (!empty($_GET['id_edit'])) {
    //memanggil add
    $id = $_GET['id_edit'];

    $member->statusmember($id);
    header("location:member.php");
}

$data = null;
$no = 1;

while (list($nim, $nama, $jurusan) = $member->getResult()) {
    if ($nim == ' ') {
        $data .= "<tr>
                <td>" . $no++ . "</td>
                <td>" . $nim . "</td>
                <td>" . $nama . "</td>
                <td>" . $jurusan . "</td>
                <td>
                <a href='member.php?id_hapus=" . $id . "' class='btn btn-danger''>Hapus</a>
                </td>
                </tr>";
    } else {
        $data .= "<tr>
                <td>" . $no++ . "</td>
                <td>" . $nim . "</td>
                <td>" . $nama . "</td>
                <td>" . $jurusan . "</td>
                <td>
                <a href='member.php?id_edit=" . $id .  "' class='btn btn-warning''>Edit</a>
                <a href='member.php?id_hapus=" . $id . "' class='btn btn-danger''>Hapus</a>
                </td>
                </tr>";
    }
}


$member->close();
$tpl = new Template("templates/member.html");
$tpl->replace("DATA_TABEL", $data);
$tpl->write();
