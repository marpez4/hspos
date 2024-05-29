<?php

require_once "conexion.php";

class ModeloProductos
{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function mdlMostrarProductos($tabla, $item, $valor, $orden)
	{

		if ($item != null) {

			$stmt = Conexion::conectar()->prepare("SELECT
												   	*
												   FROM
												   	$tabla p
												   JOIN comp_prod_factura CPF ON p.id = CPF.id_producto
												   WHERE
												   	p.id = :$item ORDER BY id DESC");			

			$stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

			$stmt->execute();

			return $stmt->fetch();
		} else {

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY $orden DESC");

			$stmt->execute();

			return $stmt->fetchAll();
		}

		$stmt->close();

		$stmt = null;
	}


	/*=============================================
	REGISTRO DE PRODUCTO
	=============================================*/

	static public function mdlIngresarProducto($tabla, $datos)
	{

		if ($datos["marca"] == "") {

			$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo, nombre, descripcion, stock, id_categoria, imagen, precio_compra, precio_venta, precio_ml, precio_cliente) VALUES (:codigo, :nombre, :descripcion, :stock, :id_categoria, :imagen, :precio_compra, :precio_venta, :precio_ml, :precio_cliente)");

			$stmt->bindParam(":codigo", $datos["codigo"], PDO::PARAM_STR);
			$stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
			$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
			$stmt->bindParam(":stock", $datos["stock"], PDO::PARAM_INT);
			$stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
			$stmt->bindParam(":imagen", $datos["imagen"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_compra", $datos["precio_compra"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_venta", $datos["precio_venta"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_ml", $datos["precio_ml"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_cliente", $datos["precio_cliente"], PDO::PARAM_STR);
		} else {

			$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo, nombre, descripcion, stock, id_categoria, imagen, precio_compra, precio_venta, precio_ml, precio_cliente) VALUES (:codigo, :nombre, :descripcion, :stock, :id_categoria, :imagen, :precio_compra, :precio_venta, :precio_ml, :precio_cliente)");

			$stmt->bindParam(":codigo", $datos["codigo"], PDO::PARAM_STR);
			$stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
			$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
			$stmt->bindParam(":stock", $datos["stock"], PDO::PARAM_INT);
			$stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
			$stmt->bindParam(":imagen", $datos["imagen"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_compra", $datos["precio_compra"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_venta", $datos["precio_venta"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_ml", $datos["precio_ml"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_cliente", $datos["precio_cliente"], PDO::PARAM_STR);
		}

		if ($stmt->execute()) {

			$ultIdProd = Conexion::conectar()->prepare("SELECT MAX(id) AS id FROM productosfacturas");

			$ultIdProd->execute();

			foreach ($ultIdProd as $value) {

				$idProd =  $value["id"];
			}

			$comp = Conexion::conectar()->prepare("INSERT INTO comp_prod_factura(IdentificationNumber, Descripcion,	Nombre, Unit, UnitCode,Taxes, ObjetoImp, id_producto) VALUES (:IdentificationNumber, :Descripcion, :Nombre, :Unit, :UnitCode, :Taxes, :ObjetoImp, :id_producto)");

			$comp->bindParam(":IdentificationNumber", $datos["codigo"], PDO::PARAM_STR);
			$comp->bindParam(":Descripcion", $datos["descripcion"], PDO::PARAM_STR);
			$comp->bindParam(":Nombre", $datos["nombre"], PDO::PARAM_STR);
			$comp->bindParam(":Unit", $datos["unidad"], PDO::PARAM_STR);
			$comp->bindParam(":UnitCode", $datos["clave"], PDO::PARAM_STR);
			$comp->bindParam(":Taxes", $datos["iva"], PDO::PARAM_STR);
			$comp->bindParam(":ObjetoImp", $datos["impuesto"], PDO::PARAM_STR);
			$comp->bindParam(":id_producto", $idProd, PDO::PARAM_INT);

			$comp->execute();

			if ($datos["marca"] != "") {

				$stmtCp = Conexion::conectar()->prepare("INSERT INTO complemento_producto(id_producto, marca, ram, procesador, tam_pantalla, graficos, ssd, hhd) VALUES (:id_producto, :marca, :ram, :procesador, :tam_pantalla, :graficos, :ssd, :hhd)");

				$stmtCp->bindParam(":id_producto", $idProd, PDO::PARAM_INT);
				$stmtCp->bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
				$stmtCp->bindParam(":ram", $datos["ram"], PDO::PARAM_STR);
				$stmtCp->bindParam(":procesador", $datos["procesador"], PDO::PARAM_STR);
				$stmtCp->bindParam(":tam_pantalla", $datos["tam_pantalla"], PDO::PARAM_STR);
				$stmtCp->bindParam(":graficos", $datos["graficos"], PDO::PARAM_STR);
				$stmtCp->bindParam(":ssd", $datos["ssd"], PDO::PARAM_STR);
				$stmtCp->bindParam(":hhd", $datos["hhd"], PDO::PARAM_STR);

				$stmtCp->execute();
			}

			$newData = json_encode($datos);

			echo '<script> 

					agregarProducto(' . $newData . ');
				
			    </script>';


			return "ok";
		} else {

			return "error";
		}

		$stmt->close();
		$stmt = null;
	}


	/*=============================================
	EDITAR PRODUCTO
	=============================================*/
	static public function mdlEditarProducto($tabla, $datos)
	{

		if ($datos["marca"] == "") {

			$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET id_categoria = :id_categoria, descripcion = :descripcion, imagen = :imagen, stock = :stock, precio_compra = :precio_compra, precio_venta = :precio_venta, precio_cliente = :precio_cliente, precio_ml = :precio_ml  WHERE codigo = :codigo");

			$stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
			$stmt->bindParam(":codigo", $datos["codigo"], PDO::PARAM_STR);
			$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
			$stmt->bindParam(":imagen", $datos["imagen"], PDO::PARAM_STR);
			$stmt->bindParam(":stock", $datos["stock"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_compra", $datos["precio_compra"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_venta", $datos["precio_venta"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_cliente", $datos["precio_cliente"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_ml", $datos["precio_ml"], PDO::PARAM_STR);
		} else {

			$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET id_categoria = :id_categoria, descripcion = :descripcion, imagen = :imagen, stock = :stock, precio_compra = :precio_compra, precio_venta = :precio_venta, precio_cliente = :precio_cliente, precio_ml = :precio_ml, marca = :marca, ram = :ram, procesador = :procesador, tam_pantalla = :tam_pantalla, graficos = :graficos, ssd = :ssd, hhd = :hhd WHERE codigo = :codigo");

			$stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
			$stmt->bindParam(":codigo", $datos["codigo"], PDO::PARAM_STR);
			$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
			$stmt->bindParam(":imagen", $datos["imagen"], PDO::PARAM_STR);
			$stmt->bindParam(":stock", $datos["stock"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_compra", $datos["precio_compra"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_venta", $datos["precio_venta"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_cliente", $datos["precio_cliente"], PDO::PARAM_STR);
			$stmt->bindParam(":precio_ml", $datos["precio_ml"], PDO::PARAM_STR);
			$stmt->bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
			$stmt->bindParam(":ram", $datos["ram"], PDO::PARAM_STR);
			$stmt->bindParam(":procesador", $datos["procesador"], PDO::PARAM_STR);
			$stmt->bindParam(":tam_pantalla", $datos["tam_pantalla"], PDO::PARAM_STR);
			$stmt->bindParam(":graficos", $datos["graficos"], PDO::PARAM_STR);
			$stmt->bindParam(":ssd", $datos["ssd"], PDO::PARAM_STR);
			$stmt->bindParam(":hhd", $datos["hhd"], PDO::PARAM_STR);
		}


		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();
		$stmt = null;
	}

	/*=============================================
	BORRAR PRODUCTO
	=============================================*/

	static public function mdlEliminarProducto($tabla, $datos)
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
	ACTUALIZAR PRODUCTO
	=============================================*/

	static public function mdlActualizarProducto($tabla, $item1, $valor1, $valor)
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

	/*=============================================
	MOSTRAR SUMA VENTAS
	=============================================*/

	static public function mdlMostrarSumaVentas($tabla)
	{

		$stmt = Conexion::conectar()->prepare("SELECT SUM(ventas) as total FROM $tabla");

		$stmt->execute();

		return $stmt->fetch();

		$stmt->close();

		$stmt = null;
	}

	/*=============================================
	Creando movimiento en bodega 
	=============================================*/

	static public function mdlMovBodega($tabla, $datos)
	{

		/**	
		 * DONDE TIPO DE MOV = 1 = ENTRADA
		 * DONDE TIPO DE MOV = 2 = SALIDA
		 */

		//  EVALUAR SI EXISTE ALGUN REGISTRO DE LA BODEGA DEL PRODUCTO

		$check = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_producto = " . $datos["idProducto"] . "");

		$check->execute();

		$resCheck = $check->fetch();

		// NO EXISTE REGISTRO DE BODEGA EN LA BASE DE DATOS

		if ($resCheck == null) {

			$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(descripcion, id_producto, cantidad, cantidadLlegadas, tipo) VALUES (:descripcion, :id_producto, :cantidad, :cantidadLlegadas, :tipo)");

			$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
			$stmt->bindParam(":id_producto", $datos["idProducto"], PDO::PARAM_INT);
			$stmt->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
			$stmt->bindParam(":cantidadLlegadas", $datos["cantidadLlegadas"], PDO::PARAM_INT);
			$stmt->bindParam(":tipo", $datos["tipoMov"], PDO::PARAM_INT);

			$stmt->execute();

			// TRAEMOS EL ID DE LA BODEGA

			$BodeId = Conexion::conectar()->prepare("SELECT MAX(id) AS id FROM $tabla");

			$BodeId->execute();

			$resBodeId = $BodeId->fetch();

			$resBodeIdR = $resBodeId["id"];

			// AGREGAR HISTORIAL DE BODEGAS

			$hoy = date("Y-m-d H:i:s");

			$movBode = Conexion::conectar()->prepare("INSERT INTO historial_mov_bodega(id_bodega, cantidad, cantidadLlegadas, tipo_movimiento, fecha_mov, id_usuario) VALUES (:id_bodega, :cantidad, :cantidadLlegadas, :tipo_movimiento, :fecha_mov, :id_usuario)");

			$movBode->bindParam(":id_bodega", $resBodeIdR, PDO::PARAM_INT);
			$movBode->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
			$movBode->bindParam(":cantidadLlegadas", $datos["cantidadLlegadas"], PDO::PARAM_INT);
			$movBode->bindParam(":tipo_movimiento", $datos["tipoMov"], PDO::PARAM_INT);
			$movBode->bindParam(":fecha_mov", $hoy, PDO::PARAM_STR);
			$movBode->bindParam(":id_usuario", $datos["idUsuario"], PDO::PARAM_INT);

			$movBode->execute();

			return "Ok";

			$movBode->close();

			$movBode = null;
		} else {

			// SUMAR SI ES ENTRADA 

			if ($datos["tipoMov"] == 1) {


				$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET cantidad = cantidad + :cantidad, cantidadLlegadas = cantidadLlegadas + :cantidadLlegadas WHERE id_producto = :id_producto");

				$stmt->bindParam(":id_producto", $datos["idProducto"], PDO::PARAM_INT);
				$stmt->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
				$stmt->bindParam(":cantidadLlegadas", $datos["cantidadLlegadas"], PDO::PARAM_INT);

				$stmt->execute();

				// AGREGAR HISTORIAL DE BODEGAS

				$hoy = date("Y-m-d H:i:s");

				$movBode = Conexion::conectar()->prepare("INSERT INTO historial_mov_bodega(id_bodega, cantidad, cantidadLlegadas, tipo_movimiento, fecha_mov, id_usuario) VALUES (:id_bodega, :cantidad, :cantidadLlegadas, :tipo_movimiento, :fecha_mov, :id_usuario)");

				$movBode->bindParam(":id_bodega", $datos["idBodega"], PDO::PARAM_INT);
				$movBode->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
				$movBode->bindParam(":cantidadLlegadas", $datos["cantidadLlegadas"], PDO::PARAM_INT);
				$movBode->bindParam(":tipo_movimiento", $datos["tipoMov"], PDO::PARAM_INT);
				$movBode->bindParam(":fecha_mov", $hoy, PDO::PARAM_STR);
				$movBode->bindParam(":id_usuario", $datos["idUsuario"], PDO::PARAM_INT);

				$movBode->execute();

				return "Ok";

				$movBode->close();

				$movBode = null;
			} else {

				$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET cantidad = cantidad - :cantidad  WHERE id_producto = :id_producto");

				$stmt->bindParam(":id_producto", $datos["idProducto"], PDO::PARAM_INT);
				$stmt->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);

				$stmt->execute();

				$stmtP = Conexion::conectar()->prepare("UPDATE productos SET stock = stock + :cantidad  WHERE id = :id_producto");

				$stmtP->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
				$stmtP->bindParam(":id_producto", $datos["idProducto"], PDO::PARAM_INT);

				$stmtP->execute();

				// AGREGAR HISTORIAL DE BODEGAS

				$hoy = date("Y-m-d H:i:s");

				$movBode = Conexion::conectar()->prepare("INSERT INTO historial_mov_bodega(id_bodega, cantidad, cantidadLlegadas, tipo_movimiento, fecha_mov, id_usuario) VALUES (:id_bodega, :cantidad, :cantidadLlegadas, :tipo_movimiento, :fecha_mov, :id_usuario)");

				$valor = 0;

				$movBode->bindParam(":id_bodega", $datos["idBodega"], PDO::PARAM_INT);
				$movBode->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
				$movBode->bindParam(":cantidadLlegadas", $valor, PDO::PARAM_INT);
				$movBode->bindParam(":tipo_movimiento", $datos["tipoMov"], PDO::PARAM_INT);
				$movBode->bindParam(":fecha_mov", $hoy, PDO::PARAM_STR);
				$movBode->bindParam(":id_usuario", $datos["idUsuario"], PDO::PARAM_INT);

				$movBode->execute();

				return "Ok";

				$movBode->close();

				$movBode = null;
			}

			//RESTAR SI ES SALIDA
		}
	}

	static public function mdlMostrarBodega($tabla, $valor)
	{

		$check = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_producto = " . $valor . "");

		$check->execute();

		return $check->fetch();
	}

	static public function mdlMostrarHistorialBodega($tabla, $valor)
	{

		$item = "id_bodega";
		$valor = $valor;

		$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = " . $valor . "");
		// $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = 5");

		$stmt->execute();

		return $stmt->fetchAll();

		// echo $table;
	}

	static public function mdlEliminarProductoReal($valor){
		
		$stmt = Conexion::conectar()->prepare("DELETE FROM productosfacturas WHERE id = :id");

		$stmt->bindParam(":id", $valor, PDO::PARAM_INT);

		$stmt2 = Conexion::conectar()->prepare("DELETE FROM comp_prod_factura WHERE id_producto = :id");

		$stmt2->bindParam(":id", $valor, PDO::PARAM_INT);

		$stmt2->execute();

		$stmt3 = Conexion::conectar()->prepare("DELETE FROM comp_prod_factura WHERE id_producto = :id");

		$stmt3->bindParam(":id", $valor, PDO::PARAM_INT);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}

		$stmt->close();

		$stmt = null;
	}
}
