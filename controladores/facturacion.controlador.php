<?php
class ControladorFacturacion{

    static public function ctrMostrarCatalogos($tabla){

        $respuesta = ModeloFacturacion::mdlMostrarCatalogos($tabla);

        return $respuesta;
        
    }

    static public function ctrVerInfoInicialFactura($item, $valor){

        $tabla = "ventas";

        $respuesta = ModeloFacturacion::mdlVerInfoInicialFactura($tabla, $item, $valor);

        return $respuesta;

    }

    static public function ctrEmitirfactura(){

        if(isset($_POST["rfcRecep"])){

            $datos = array(
                "Name"   => $_POST["nombreCliente"],
                "CfdiUse" => $_POST["cfdiRecep"],
                "Rfc" => $_POST["rfcRecep"],
                "FiscalRegime" => $_POST["fiscalRegRecep"],
                "TaxZipCode" => $_POST["cpRecep"],
                "CfdiType" => $_POST["cfdiType"],
                "NameId" => $_POST["nameId"],
                "ExpeditionPlace" => $_POST["expeditionPlace"],
                "Serie" => $_POST["serie"],
                "Folio" => $_POST["folio"],
                "PaymentForm" => $_POST["paymentForm"],
                "PaymentMethod" => $_POST["paymentMethod"],
                "Exportation" => $_POST["exportation"]
            );

            $respuesta = ModeloFacturacion::mdlEmitirfactura($datos);
        }

    }

    static public function ctrRegistrarFactura($valor, $folio){

        $tabla = "respuesta_facturacion";

        $respuesta = ModeloFacturacion::mdlRegistrarFactura($tabla, $valor, $folio);  

        return $respuesta;

    }

    static public function ctrMostrarFacturasEmitidas($folio){

        $tabla = "respuesta_facturacion";

        $respuesta = ModeloFacturacion::mdlMostrarFacturasEmitidas($tabla, $folio);

        return $respuesta;

    }

    /*=============================================
	RANGO FECHAS
	=============================================*/

	static public function ctrRangoFechasFacturas($fechaInicial, $fechaFinal)
	{

		$tabla = "respuesta_facturacion";

		$respuesta = ModeloFacturacion::mdlRangoFechasFacturas($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;
	}

}
