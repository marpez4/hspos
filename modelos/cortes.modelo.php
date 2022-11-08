<?php

require_once "conexion.php";

class ModeloCierreCortes
{

	static public function mdlMostrarCierreCortes($tabla, $item, $valor)
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

	static public function mdlCrearCajaCorte($tabla, $datos)
	{

		$fechaActual = date('y-m-d h:i:s');

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(monto_inicial, fecha_apertura, id_caja) VALUES (:monto_inicial, :fechaInicial, :id_caja)");

		$stmt->bindParam(":monto_inicial", $datos["montoInicial"], PDO::PARAM_INT);
		$stmt->bindParam(":fechaInicial", $fechaActual, PDO::PARAM_STR);
		$stmt->bindParam(":id_caja", $datos["idCaja"], PDO::PARAM_INT);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();
		$stmt = null;
	}

	static public function mdlMostrarInfoCorte($tabla, $item, $valor)
	{

		$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

		$stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

		if ($stmt->execute()) {

			foreach ($stmt as $value) {

				$idCaja = $value["id"];
			}
		}

		// VENTAS Y NO. DE VENTAS EN VENTAS

		$stmtV = Conexion::conectar()->prepare("SELECT COUNT(*) AS TotalVentas FROM ventas WHERE id_caja = :id_caja");

		$stmtV->bindParam(":id_caja", $idCaja, PDO::PARAM_INT);

		$stmtV->execute();

		foreach ($stmtV as $value2) {

			$totalVentas = $value2["TotalVentas"];
		}

		$stmtVT = Conexion::conectar()->prepare("SELECT SUM(total) AS TotalPVentas FROM ventas WHERE id_caja = :id_caja");

		$stmtVT->bindParam(":id_caja", $idCaja, PDO::PARAM_INT);

		$stmtVT->execute();

		foreach ($stmtVT as $value5) {

			$totalPVentas = $value5["TotalPVentas"];
		}

		// VENTAS Y NO. DE SERVICIOS

		$stmtS = Conexion::conectar()->prepare("SELECT COUNT(*) AS TotalServicios FROM servicios WHERE id_caja = :id_caja AND estatus = 6");

		$stmtS->bindParam(":id_caja", $idCaja, PDO::PARAM_INT);

		$stmtS->execute();

		foreach ($stmtS as $value3) {

			$totalServicios = $value3["TotalServicios"];
		}

		$stmtST = Conexion::conectar()->prepare("SELECT SUM(total) AS TotalPServicios FROM servicios WHERE id_caja = :id_caja AND estatus = 6");

		$stmtST->bindParam(":id_caja", $idCaja, PDO::PARAM_INT);

		$stmtST->execute();

		foreach ($stmtST as $value4) {

			$totalPServicios = $value4["TotalPServicios"];
		}

		// INFO DE CORTE_CAJA

		$stmtCC = Conexion::conectar()->prepare("SELECT monto_inicial, fecha_apertura, id_caja FROM corte_caja WHERE id_caja = :id_caja");

		$stmtCC->bindParam(":id_caja", $idCaja, PDO::PARAM_INT);

		$stmtCC->execute();

		foreach ($stmtCC as $value5) {

			$montoInicial =  $value5["monto_inicial"];
		}

		$res = array(
			"idCaja" => $idCaja,
			"totalVentas" => $totalVentas,
			"totalPVentas" => $totalPVentas,
			"totalServicios" => $totalServicios,
			"totalPServicios" => $totalPServicios,
			"montoInicial" => $montoInicial
		);

		return $res;
	}

	static public function mdlCrearCierreCaja($tabla, $datos)
	{

		$fechaActual = date('y-m-d h:i:s');

		$estatus = 0;

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET monto_final = :monto_final, fecha_cierre = :fecha_cierre, total_servicios = :total_servicios, total_ventas = :total_ventas, monto_total = :monto_total, estatus = :estatus, id_usuario = :id_usuario WHERE id_caja = :id_caja");

		$stmt->bindParam(":monto_final", $datos["montoFinal"], PDO::PARAM_STR);
		$stmt->bindParam(":fecha_cierre", $fechaActual, PDO::PARAM_STR);
		$stmt->bindParam(":total_servicios", $datos["totalServicios"], PDO::PARAM_INT);
		$stmt->bindParam(":total_ventas", $datos["totalVentas"], PDO::PARAM_INT);
		$stmt->bindParam(":monto_total", $datos["montoGeneral"], PDO::PARAM_STR);
		$stmt->bindParam(":estatus", $estatus, PDO::PARAM_INT);
		$stmt->bindParam(":id_usuario", $_SESSION["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(":id_caja", $datos["idCajaCierre"], PDO::PARAM_INT);

		$stmt->execute();

		$stmtC = Conexion::conectar()->prepare("UPDATE cajas SET fecha_cierre = :fecha_cierre, estatus = :estatus WHERE id = :id");

		$stmtC->bindParam(":fecha_cierre", $fechaActual, PDO::PARAM_STR);
		$stmtC->bindParam(":estatus", $estatus, PDO::PARAM_INT);
		$stmtC->bindParam(":id", $datos["idCajaCierre"], PDO::PARAM_INT);

		if ($stmtC->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmtC->close();
		$stmtC = null;
	}

	static public function mdlVerVentas($tabla, $item, $valor)
	{
		$table = '<hr>
		
					<div style="text-align: center;">
		  				<h4>Ventas</h4>
					</div>';

		$table .= '<table class="table table-bordered table-striped dt-responsive tablas tablaVentas" width="100%">

					<thead>

					<tr>

						<th style="width:10px">#</th>
						<th>Código</th>
						<th>Metodo de pago</th>
						<th>Monto Total</th>
						<th>Fecha</th>

					</tr>

					</thead>

					<tbody>';

		$stmtV = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :id_caja");

		$stmtV->bindParam(":id_caja", $valor, PDO::PARAM_INT);

		$stmtV->execute();

		foreach ($stmtV as $key => $value) {

			$table .= '<tr>

						<td>' . ($key + 1) . '</td>						
						<td class="text-uppercase">' . $value["codigo"] . '</td>
						<td class="text-uppercase">' . $value["metodo_pago"] . '</td>
						<td class="text-uppercase">$' . number_format($value["total"], 2) . '</td>
						<td class="text-uppercase">' . date("d-m-Y", strtotime($value["fecha"])) . '</td> 

					   </tr>';
		}

		$table .= '</tbody>
				</table>';

		$table .= '<hr>
		
					<div style="text-align: center;">
		  				<h4>Servicios</h4>
					</div>';

		$table .= '<table class="table table-bordered table-striped dt-responsive tablas" width="100%">

						<thead>

							<tr>

							<th style="width:10px">#</th>
							<th>Cliente</th>
							<th>Tipo de servicio</th>
							<th>Monto Total</th>
							<th>Fecha llegada</th>
							<th>Fecha entrega</th>

							</tr>

						</thead>

						<tbody>';

		$stmtS = Conexion::conectar()->prepare("SELECT * FROM servicios WHERE $item = :id_caja AND estatus = 6");

		$stmtS->bindParam(":id_caja", $valor, PDO::PARAM_INT);

		$stmtS->execute();

		foreach ($stmtS as $key => $value) {

			$table .= '<tr>

						<td>' . ($key + 1) . '</td>						
						<td class="text-uppercase">' . $value["cliente"] . '</td>
						<td class="text-uppercase">' . $value["tipo_servicio"] . '</td>
						<td class="text-uppercase">$' . number_format($value["total"], 2) . '</td>
						<td class="text-uppercase">' . date("d-m-Y", strtotime($value["fecha_llegada"])) . '</td> 
						<td class="text-uppercase">' . date("d-m-Y", strtotime($value["fecha_llegada"])) . '</td> 

					   </tr>';
		}

		$table .= '	</tbody>
					</table>';


		echo $table;
	}
}
