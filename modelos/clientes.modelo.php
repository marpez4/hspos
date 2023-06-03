<!-- <script src="vistas/js/facturas.js"></script> -->

<?php

require_once "conexion.php";

class ModeloClientes
{

	/*=============================================
	CREAR CLIENTE
	=============================================*/

	static public function mdlIngresarCliente($tabla, $datos)
	{

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombre, frecuente, email, telefono) VALUES (:nombre, :frecuente, :email, :telefono)");

		$stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(":frecuente", $datos["frecuente"], PDO::PARAM_INT);
		$stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);

		$stmt->execute();

		if ($datos["rfc"] != "") {

			$idCliente = Conexion::conectar()->prepare("SELECT MAX(id) AS id FROM $tabla");

			$idCliente->execute();

			foreach ($idCliente as $value) {

				$idClienteFact = $value["id"];
			}

			$fact = Conexion::conectar()->prepare("INSERT INTO cliente_infofac(id_cliente, Street, ExteriorNumber, InteriorNumber, Neighborhood, ZipCode, Municipality, StateF, Country, Rfc, CfdiUse, FiscalRegime) VALUES (:id_cliente, :Street, :ExteriorNumber, :InteriorNumber, :Neighborhood, :ZipCode, :Municipality, :StateF,:Country, :Rfc, :CfdiUse, :FiscalRegime)");

			$fact->bindParam(":id_cliente", $idClienteFact, PDO::PARAM_INT);
			$fact->bindParam(":Street", $datos["calle"], PDO::PARAM_STR);
			$fact->bindParam(":ExteriorNumber", $datos["ext"], PDO::PARAM_INT);
			$fact->bindParam(":InteriorNumber", $datos["int"], PDO::PARAM_INT);
			$fact->bindParam(":Neighborhood", $datos["colonia"], PDO::PARAM_STR);
			$fact->bindParam(":ZipCode", $datos["cp"], PDO::PARAM_INT);
			$fact->bindParam(":Municipality", $datos["municipio"], PDO::PARAM_STR);
			$fact->bindParam(":StateF", $datos["estado"], PDO::PARAM_STR);
			$fact->bindParam(":Country", $datos["pais"], PDO::PARAM_STR);
			$fact->bindParam(":Rfc", $datos["rfc"], PDO::PARAM_STR);
			$fact->bindParam(":CfdiUse", $datos["cfdi"], PDO::PARAM_STR);
			$fact->bindParam(":FiscalRegime", $datos["regimen"], PDO::PARAM_STR);

			$fact->execute();

			$newData = json_encode($datos);

			echo '<script> 

					agregarCliente(' . $newData . ');
				
			    </script>';
		}

		return "ok";
		$stmt->close();
		$stmt = null;
	}

	/*=============================================
	MOSTRAR CLIENTES
	=============================================*/

	static public function mdlMostrarClientes($tabla, $item, $valor)
	{

		if ($item != null) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

			$stmt->execute();

			return $stmt->fetch();
		} else {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt->execute();

			return $stmt->fetchAll();
		}

		$stmt->close();

		$stmt = null;
	}

	/*=============================================
	EDITAR CLIENTE
	=============================================*/

	static public function mdlEditarCliente($tabla, $datos)
	{

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre = :nombre, frecuente = :frecuente, email = :email, telefono = :telefono WHERE id = :id");

		$stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);
		$stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(":frecuente", $datos["frecuente"], PDO::PARAM_INT);
		$stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);

		$stmt->execute();		

		if($datos["rfc"] != ""){

			$stmtInfofac = Conexion::conectar()->prepare("UPDATE cliente_infofac SET Street = :calle, ExteriorNumber = :noExt, InteriorNumber = :noInt, Neighborhood = :colonia, ZipCode = :cp, Municipality = :municipio, StateF = :estado, Country = :pais, Rfc = :rfc, CfdiUse = :cfdi, TaxZipCode = :cp2, FiscalRegime = :regimen WHERE id_cliente = :id");

			$stmtInfofac->bindParam(":id", $datos["id"], PDO::PARAM_INT);
			$stmtInfofac->bindParam(":calle", $datos["calle"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":noExt", $datos["noext"], PDO::PARAM_INT);
			$stmtInfofac->bindParam(":noInt", $datos["noInt"], PDO::PARAM_INT);
			$stmtInfofac->bindParam(":colonia", $datos["colonia"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":cp", $datos["cp"], PDO::PARAM_INT);
			$stmtInfofac->bindParam(":municipio", $datos["municipio"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":pais", $datos["pais"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":rfc", $datos["rfc"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":cfdi", $datos["cfdi"], PDO::PARAM_STR);
			$stmtInfofac->bindParam(":cp2", $datos["cp"], PDO::PARAM_INT);
			$stmtInfofac->bindParam(":regimen", $datos["regimen"], PDO::PARAM_STR);


		}

		if ($stmtInfofac->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();
		$stmt = null;
	}

	/*=============================================
	ELIMINAR CLIENTE
	=============================================*/

	static public function mdlEliminarCliente($tabla, $datos)
	{

		$stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id = :id");

		$stmt->bindParam(":id", $datos, PDO::PARAM_INT);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();

		$stmt = null;
	}

	/*=============================================
	ACTUALIZAR CLIENTE
	=============================================*/

	static public function mdlActualizarCliente($tabla, $item1, $valor1, $valor)
	{

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET $item1 = :$item1 WHERE id = :id");

		$stmt->bindParam(":" . $item1, $valor1, PDO::PARAM_STR);
		$stmt->bindParam(":id", $valor, PDO::PARAM_STR);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();

		$stmt = null;
	}
}
