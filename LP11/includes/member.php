<?php

class member extends DB
{
    function getmember()
    {
        $query = "SELECT * FROM member";
        return $this->execute($query);
    }

    function add($data)
    {
        $nim = $data['tnim'];
        $nama = $data['tnama'];
        $jurusan = $data['tjurusan'];

        $query = "insert into member values ('', '$nim', '$nama', '$jurusan')";

        // Mengeksekusi query
        return $this->execute($query);
    }

    function delete($id)
    {

        $query = "delete FROM member WHERE id_member = '$id'";

        // Mengeksekusi query
        return $this->execute($query);
    }

}
