<?php

header( "Access-Control-Allow-Origin: *" );

require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuarios.controlador.php";
require_once "controladores/categorias.controlador.php";
require_once "controladores/productos.controlador.php";
require_once "controladores/clientes.controlador.php";
require_once "controladores/ventas.controlador.php";
require_once "controladores/componentes.controlador.php";
require_once "controladores/servicios.controlador.php";
require_once "controladores/pedidosPaqueteria.controlador.php";
require_once "controladores/cortes.controlador.php";
require_once "controladores/cajas.controlador.php";
require_once "controladores/facturacion.controlador.php";
require_once "controladores/catalogosSat.controlador.php";
require_once "controladores/codigosProductos.controlador.php";
require_once "controladores/apartados.controlador.php";


require_once "modelos/usuarios.modelo.php";
require_once "modelos/categorias.modelo.php";
require_once "modelos/productos.modelo.php";
require_once "modelos/clientes.modelo.php";
require_once "modelos/ventas.modelo.php";
require_once "modelos/componentes.modelo.php";
require_once "modelos/servicios.modelo.php";
require_once "modelos/pedidosPaqueteria.modelo.php";
require_once "modelos/cortes.modelo.php";
require_once "modelos/cajas.modelo.php";
require_once "extensiones/vendor/autoload.php";
require_once "modelos/facturacion.modelo.php";
require_once "modelos/catalogosSat.modelo.php";
require_once "modelos/codigosProductos.modelo.php";
require_once "modelos/apartados.modelo.php";

$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();