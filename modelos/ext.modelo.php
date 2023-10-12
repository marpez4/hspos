<?php

require_once "conexion.php";

class ModeloPedidosPaqueteria
{

    // INGRESAR PEDIDO

    static public function mdlIngresarPedidoPaqueteria($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombreCompleto, calle, colonia, cp, idCiudad, idEstado, telefono, entreCalles, referencias, archivo ) VALUES (:nombreCompleto, :calle, :colonia, :cp, :ciudad, :estado, :telefono, :entreCalles, :referencias, :archivo)");

        $stmt->bindParam(":nombreCompleto", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":calle", $datos["calle"], PDO::PARAM_STR);
        $stmt->bindParam(":colonia", $datos["colonia"], PDO::PARAM_STR);
        $stmt->bindParam(":cp", $datos["cp"], PDO::PARAM_INT);
        $stmt->bindParam(":ciudad", $datos["ciudad"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
        $stmt->bindParam(":entreCalles", $datos["entreCalles"], PDO::PARAM_STR);
        $stmt->bindParam(":referencias", $datos["referencias"], PDO::PARAM_STR);
        $stmt->bindParam(":archivo", $datos["archivo"], PDO::PARAM_STR);

        // $para = 'soporte_hell@hotmail.com';
        $para = 'ponchomarpez@gmail.com';
        $asunto = 'Nuevo servicio de paquetería';
        // URL de la imagen del logotipo
        $logo_url = 'https://hellssystems.com/resources/logo.png';

        // Contenido del mensaje con logotipo
        $mensaje = '
        <html>
        <head>
            <style>
                /* Estilos en línea */
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f5f5f5;
                }
                .container {
                    max-width: 600px;
                    margin: 0 auto;
                    padding: 20px;
                    background-color: #fff;
                    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                }
            </style>
        </head>
        <body>
            <div class="container">
                <img src="' . $logo_url . '" alt="Logotipo" style="max-width: 25%; height: auto;">
                <h1 style="color: #333;">Nuevo servicio de paquetería abierto.</h1>
                <p style="color: #666;">Hola buen día, se ha subido un nuevo servicio de paquetería del cliente ' . $datos["nombre"] . ', para más información ingresa al sistema.</p>
            </div>
        </body>
        </html>';

        // Cabeceras del correo
        $cabeceras = 'MIME-Version: 1.0' . "\r\n";
        $cabeceras .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
        $cabeceras .= 'From: tu_nombre <sistemas@hellssystems.com>' . "\r\n";

        // Envía el correo
        $mail_enviado = mail($para, $asunto, $mensaje, $cabeceras);

        if ($mail_enviado) {
            echo 'Correo enviado con éxito.';
        } else {
            echo 'Error al enviar el correo.';
        }

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();
        $stmt = null;
    }
}
