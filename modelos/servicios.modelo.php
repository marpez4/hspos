<?php

require_once "conexion.php";

class ModeloServicios
{

	/*=============================================
	CREAR SERVICIO
	=============================================*/

	static public function mdlIngresarServicios($tabla, $datos)
	{

		$stmtC = Conexion::conectar()->prepare("SELECT * FROM cajas WHERE estatus = 1");

		if ($stmtC->execute()) {

			foreach ($stmtC as $key => $value) {

				$idCaja = $value["id"];
			}
		}

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(fecha_llegada, folio, cliente, telefono, id_empleado, equipo, marca, procesador, ram, dd, ssd, so, cargador, contrasena, falla, solucion, obs, fecha_entrega, total, estatus, id_caja ) VALUES (:fecha_llegada, :folio, :id_cliente, :telefono, :id_empleado, :equipo, :marca, :procesador, :ram, :dd, :ssd, :so, :cargador, :contrasena, :falla, :solucion, :obs, :fecha_entrega, :total, :estatus, :idCaja)");

		$stmt->bindParam(":fecha_llegada", $datos["fecha_llegada"], PDO::PARAM_STR);
		$stmt->bindParam(":folio", $datos["folio"], PDO::PARAM_INT);
		$stmt->bindParam(":id_cliente", $datos["id_cliente"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_INT);
		$stmt->bindParam(":id_empleado", $datos["id_empleado"], PDO::PARAM_INT);
		$stmt->bindParam(":equipo", $datos["equipo"], PDO::PARAM_STR);
		$stmt->bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
		$stmt->bindParam(":procesador", $datos["procesador"], PDO::PARAM_STR);
		$stmt->bindParam(":ram", $datos["ram"], PDO::PARAM_STR);
		$stmt->bindParam(":dd", $datos["dd"], PDO::PARAM_STR);
		$stmt->bindParam(":ssd", $datos["ssd"], PDO::PARAM_STR);
		$stmt->bindParam(":so", $datos["so"], PDO::PARAM_STR);
		$stmt->bindParam(":cargador", $datos["cargador"], PDO::PARAM_STR);
		$stmt->bindParam(":contrasena", $datos["contrasena"], PDO::PARAM_STR);
		$stmt->bindParam(":falla", $datos["falla"], PDO::PARAM_STR);
		$stmt->bindParam(":solucion", $datos["solucion"], PDO::PARAM_STR);
		$stmt->bindParam(":obs", $datos["obs"], PDO::PARAM_STR);
		$stmt->bindParam(":fecha_entrega", $datos["fecha_entrega"], PDO::PARAM_STR);
		$stmt->bindParam(":total", $datos["tipo_servicio"], PDO::PARAM_INT);
		$stmt->bindParam(":estatus", $datos["estatus"], PDO::PARAM_STR);
		$stmt->bindParam(":idCaja", $idCaja, PDO::PARAM_STR);


		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();
		$stmt = null;
	}

	/*=============================================
	MOSTRAR SERVICIOS
	=============================================*/

	static public function mdlMostrarServicios($tabla, $item, $valor)
	{

		if ($item != null) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

			$stmt->execute();

			return $stmt->fetch();
		} else {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id DESC");

			$stmt->execute();

			return $stmt->fetchAll();
		}

		$stmt->close();

		$stmt = null;
	}

	static public function mdlMostrarFolio($tabla)
	{

		$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

		$stmt->execute();

		return $stmt->fetchAll();

		$stmt->close();

		$stmt = null;
	}
	/*=============================================
	EDITAR CATEGORIA
	=============================================*/

	static public function mdlEditarServicio($tabla, $datos)
	{

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET fecha_llegada = :fecha_llegada, cliente = :id_cliente, telefono = :telefono, equipo = :equipo, marca = :marca, procesador = :procesador, ram = :ram, dd = :dd, ssd = :ssd, so = :so, cargador = :cargador, contrasena = :contrasena, falla = :falla, solucion = :solucion, obs = :obs, fecha_entrega = :fecha_entrega, total = :tipo_servicio, estatus = :estatus WHERE id = :id");

		// id_cliente = :id_cliente, equipo = :equipo, marca = :marca, procesador = :procesador, ram = :ram, dd = :dd, so = :so, falla = :falla, solucion = :solucion, obs = :obs, fecha_entrega = :fecha_entrega, tipo_servicio = :tipo_servicio, total = :total, estatus = :estatus
		$stmt->bindParam(":fecha_llegada", $datos["fecha_llegada"], PDO::PARAM_STR);
		$stmt->bindParam(":id_cliente", $datos["id_cliente"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":equipo", $datos["equipo"], PDO::PARAM_STR);
		$stmt->bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
		$stmt->bindParam(":procesador", $datos["procesador"], PDO::PARAM_STR);
		$stmt->bindParam(":ram", $datos["ram"], PDO::PARAM_STR);
		$stmt->bindParam(":dd", $datos["dd"], PDO::PARAM_STR);
		$stmt->bindParam(":ssd", $datos["ssd"], PDO::PARAM_STR);
		$stmt->bindParam(":so", $datos["so"], PDO::PARAM_STR);
		$stmt->bindParam(":cargador", $datos["cargador"], PDO::PARAM_STR);
		$stmt->bindParam(":contrasena", $datos["contrasena"], PDO::PARAM_STR);
		$stmt->bindParam(":falla", $datos["falla"], PDO::PARAM_STR);
		$stmt->bindParam(":solucion", $datos["solucion"], PDO::PARAM_STR);
		$stmt->bindParam(":obs", $datos["obs"], PDO::PARAM_STR);
		$stmt->bindParam(":fecha_entrega", $datos["fecha_entrega"], PDO::PARAM_STR);
		$stmt->bindParam(":tipo_servicio", $datos["tipo_servicio"], PDO::PARAM_STR);
		$stmt->bindParam(":estatus", $datos["estatus"], PDO::PARAM_STR);
		$stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();
		$stmt = null;
	}

	/*=============================================
	BORRAR CATEGORIA
	=============================================*/

	static public function mdlBorrarServicio($tabla, $datos)
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
	RANGO FECHAS
	=============================================*/

	static public function mdlRangoFechasServicios($tabla, $fechaInicial, $fechaFinal)
	{

		if ($fechaInicial == null) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id DESC");

			$stmt->execute();

			return $stmt->fetchAll();
		} else if ($fechaInicial == $fechaFinal) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada like '%$fechaFinal%'");

			$stmt->bindParam(":fecha", $fechaFinal, PDO::PARAM_STR);

			$stmt->execute();

			return $stmt->fetchAll();
		} else {

			$fechaActual = new DateTime();
			$fechaActual->add(new DateInterval("P1D"));
			$fechaActualMasUno = $fechaActual->format("Y-m-d");

			$fechaFinal2 = new DateTime($fechaFinal);
			$fechaFinal2->add(new DateInterval("P1D"));
			$fechaFinalMasUno = $fechaFinal2->format("Y-m-d");

			if ($fechaFinalMasUno == $fechaActualMasUno) {

				$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada BETWEEN '$fechaInicial' AND '$fechaFinalMasUno'");
			} else {


				$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada BETWEEN '$fechaInicial' AND '$fechaFinal'");
			}

			$stmt->execute();

			return $stmt->fetchAll();
		}
	}

	static public function mdlRangoFechasReporteServicios($tabla, $fechaInicial, $fechaFinal)
	{

		if ($fechaInicial == null) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE estatus = 6 ORDER BY id DESC");

			$stmt->execute();

			return $stmt->fetchAll();
		} else if ($fechaInicial == $fechaFinal) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada AND estatus = 6 like '%$fechaFinal%'");

			$stmt->bindParam(":fecha", $fechaFinal, PDO::PARAM_STR);

			$stmt->execute();

			return $stmt->fetchAll();
		} else {

			$fechaActual = new DateTime();
			$fechaActual->add(new DateInterval("P1D"));
			$fechaActualMasUno = $fechaActual->format("Y-m-d");

			$fechaFinal2 = new DateTime($fechaFinal);
			$fechaFinal2->add(new DateInterval("P1D"));
			$fechaFinalMasUno = $fechaFinal2->format("Y-m-d");

			if ($fechaFinalMasUno == $fechaActualMasUno) {

				$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada BETWEEN '$fechaInicial' AND '$fechaFinalMasUno' AND estatus = 6");
			} else {


				$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada BETWEEN '$fechaInicial' AND '$fechaFinal' AND estatus = 6");
			}

			$stmt->execute();

			return $stmt->fetchAll();
		}
	}

	static public function mdlRangoFechasReporteServiciosGral($tabla, $fechaInicial, $fechaFinal)
	{

		if ($fechaInicial == null) {

			$stmt = Conexion::conectar()->prepare("SELECT SUM(total) AS totalServicios FROM $tabla WHERE estatus = 6");

			$stmt->execute();

			foreach ($stmt as $value) {

				$totalServicios = $value["totalServicios"];
			}

			$stmtNo = Conexion::conectar()->prepare("SELECT COUNT(*) AS totalNoServicios FROM $tabla WHERE estatus = 6");

			$stmtNo->execute();

			foreach ($stmtNo as $value2) {

				$totalNoServicios = $value2["totalNoServicios"];
			}

			$respuesta = array(
				'totalServicio' => $totalServicios,
				'totalNoServicios' => $totalNoServicios
			);

			return $respuesta;
		} else if ($fechaInicial == $fechaFinal) {

			$stmt = Conexion::conectar()->prepare("SELECT SUM(total) AS totalServicios FROM $tabla WHERE fecha_entrega like '%$fechaFinal%' AND estatus = 6 ");

			$stmt->bindParam(":fecha_entrega", $fechaFinal, PDO::PARAM_STR);

			$stmt->execute();

			foreach ($stmt as $value) {

				$totalServicios = $value["totalServicios"];
			}

			$stmtNo = Conexion::conectar()->prepare("SELECT COUNT(*) AS totalNoServicios FROM $tabla WHERE fecha_entrega  like '%$fechaFinal%' AND estatus = 6");

			$stmtNo->bindParam(":fecha_entrega", $fechaFinal, PDO::PARAM_STR);

			$stmtNo->execute();

			foreach ($stmtNo as $value2) {

				$totalNoServicios = $value2["totalNoServicios"];
			}

			$respuesta = array(
				'totalServicio' => $totalServicios,
				'totalNoServicios' => $totalNoServicios
			);

			return $respuesta;
		} else {

			$fechaActual = new DateTime();
			$fechaActual->add(new DateInterval("P1D"));
			$fechaActualMasUno = $fechaActual->format("Y-m-d");

			$fechaFinal2 = new DateTime($fechaFinal);
			$fechaFinal2->add(new DateInterval("P1D"));
			$fechaFinalMasUno = $fechaFinal2->format("Y-m-d");

			if ($fechaFinalMasUno == $fechaActualMasUno) {

				$stmt = Conexion::conectar()->prepare("SELECT SUM(total) AS totalServicios FROM $tabla WHERE fecha_entrega BETWEEN '$fechaInicial' AND '$fechaFinalMasUno' AND estatus = 6");

				$stmt->execute();

				foreach ($stmt as $value) {

					$totalServicios = $value["totalServicios"];
				}

				$stmtNo = Conexion::conectar()->prepare("SELECT COUNT(*) AS totalNoServicios FROM $tabla WHERE fecha_entrega BETWEEN '$fechaInicial' AND '$fechaFinalMasUno' AND estatus = 6");

				$stmtNo->execute();

				foreach ($stmtNo as $value2) {

					$totalNoServicios = $value2["totalNoServicios"];
				}

				$respuesta = array(
					'totalServicio' => $totalServicios,
					'totalNoServicios' => $totalNoServicios
				);

				return $respuesta;
			} else {

				$stmt = Conexion::conectar()->prepare("SELECT SUM(total) AS totalServicios FROM $tabla WHERE fecha_entrega BETWEEN '$fechaInicial' AND '$fechaFinalMasUno' AND estatus = 6");

				$stmt->execute();

				foreach ($stmt as $value) {

					$totalServicios = $value["totalServicios"];
				}

				$stmtNo = Conexion::conectar()->prepare("SELECT COUNT(*) AS totalNoServicios FROM $tabla WHERE fecha_entrega BETWEEN '$fechaInicial' AND '$fechaFinalMasUno' AND estatus = 6");

				$stmtNo->execute();

				foreach ($stmtNo as $value2) {

					$totalNoServicios = $value2["totalNoServicios"];
				}
			}

			$respuesta = array(
				'totalServicio' => $totalServicios,
				'totalNoServicios' => $totalNoServicios
			);

			return $respuesta;
		}
	}

	static public function mdlRangoFechasServiciosGrafica($tabla, $fechaInicial, $fechaFinal)
	{

		if ($fechaInicial == null) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE estatus = 6 ORDER BY id DESC");

			$stmt->execute();

			return $stmt->fetchAll();
		} else if ($fechaInicial == $fechaFinal) {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada like '%$fechaFinal%' AND estatus = 6");

			$stmt->bindParam(":fecha", $fechaFinal, PDO::PARAM_STR);

			$stmt->execute();

			return $stmt->fetchAll();
		} else {

			$fechaActual = new DateTime();
			$fechaActual->add(new DateInterval("P1D"));
			$fechaActualMasUno = $fechaActual->format("Y-m-d");

			$fechaFinal2 = new DateTime($fechaFinal);
			$fechaFinal2->add(new DateInterval("P1D"));
			$fechaFinalMasUno = $fechaFinal2->format("Y-m-d");

			if ($fechaFinalMasUno == $fechaActualMasUno) {

				$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada BETWEEN '$fechaInicial' AND '$fechaFinalMasUno' AND estatus = 6");
			} else {


				$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE fecha_llegada BETWEEN '$fechaInicial' AND '$fechaFinal' AND estatus = 6");
			}

			$stmt->execute();

			return $stmt->fetchAll();
		}
	}
}
