<?php

    if (isset($_GET['file'])) {

        $file = basename($_GET['file']);
        $root = "uploads/";

        $path = $root.$file;
        $size = filesize($path);

        // Definir headers
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=$file");
        header("Content-Transfer-Encoding: binary");
        header("Content-Length: " . $size);
        
        // Descargar archivo
        readfile($path);

    }