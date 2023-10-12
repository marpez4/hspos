<?php
class ControladorCatalogosSat
{

    // MOSTRAR CLAVE PRODUCTOS

    static public function ctrMostrarClaves($item, $valor)
    {

        $tabla = "catalogoclavessat";

        $respuesta = ModeloCatalogosSat::mdlMostrarCatalogoSat($tabla, $item, $valor);

        return $respuesta;
    }

    // MOSTRAR UNIDAD PRODUCTOS

    static public function ctrMostrarUnidades($item, $valor)
    {

        $tabla = "catalogounidaessat";

        $respuesta = ModeloCatalogosSat::mdlMostrarCatalogoSat($tabla, $item, $valor);

        return $respuesta;
    }
}
