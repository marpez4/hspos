<aside class="main-sidebar">

	<section class="sidebar">

		<ul class="sidebar-menu">

			<?php

			if ($_SESSION["perfil"] == "Administrador") {

				echo '<li class="active">

				<a href="inicio">

					<i class="fa fa-home"></i>
					<span>Inicio</span>

				</a>

			</li>

			<li>

				<a href="usuarios">

					<i class="fa fa-user"></i>
					<span>Usuarios</span>

				</a>

			</li>';
			}

			if ($_SESSION["perfil"] == "Administrador" || $_SESSION["perfil"] == "Especial") {

				echo '<li>

				<a href="categorias">

					<i class="fa fa-th"></i>
					<span>Categorías</span>

				</a>

			</li>';

				echo '<li class="treeview">

				<a href="#">

					<i class="fa fa-folder-o"></i>
					
					<span>Productos</span>
					
					<span class="pull-right-container">
					
						<i class="fa fa-angle-left pull-right"></i>

					</span>

				</a>

				<ul class="treeview-menu">
					
					<li>

						<a href="altaProductos">
							
							<i class="fa fa-circle-o"></i>
							<span>Alta productos</span>

						</a>

					</li>
					<li>

						<a href="productos">
							
							<i class="fa fa-circle-o"></i>
							<span>Inventario</span>

						</a>

					</li>

					<li>

						<a href="codigosProductos">
							
							<i class="fa fa-circle-o"></i>
							<span>Códigos productos</span>

						</a>

					</li>
					
					</ul>
			</li>';
			}

			if ($_SESSION["perfil"] == "Administrador" || $_SESSION["perfil"] == "Vendedor") {

				echo '<li>

				<a href="clientes">

					<i class="fa fa-users"></i>
					<span>Clientes</span>

				</a>

			</li>';
			}

			if ($_SESSION["perfil"] == "Administrador" || $_SESSION["perfil"] == "Vendedor") {

				echo '<li class="treeview">

				<a href="#">

					<i class="fa fa-list-ul"></i>
					
					<span>Ventas</span>
					
					<span class="pull-right-container">
					
						<i class="fa fa-angle-left pull-right"></i>

					</span>

				</a>

				<ul class="treeview-menu">
					
					<li>

						<a href="ventas">
							
							<i class="fa fa-circle-o"></i>
							<span>Administrar ventas</span>

						</a>

					</li>

					<li>

						<a href="crear-venta">
							
							<i class="fa fa-circle-o"></i>
							<span>Crear venta</span>

						</a>

					</li>
					<li>

						<a href="apartados">
							
							<i class="fa fa-circle-o"></i>
							<span>Apartados</span>

						</a>

					</li>
					';

				if ($_SESSION["perfil"] == "Administrador") {

					echo '<li>

						<a href="reportes">
							
							<i class="fa fa-circle-o"></i>
							<span>Reporte de ventas</span>

						</a>

					</li>';
				}

				echo '</ul>

			</li>';
			}

			if ($_SESSION["perfil"] == "Administrador" || $_SESSION["perfil"] == "Vendedor") {

				echo '<li class="treeview">

				<a href="#">

					<i class="fa fa-cogs"></i>
					
					<span>Servicios</span>
					
					<span class="pull-right-container">
					
						<i class="fa fa-angle-left pull-right"></i>

					</span>

				</a>

				<ul class="treeview-menu">
					
					<li>

						<a href="servicios">
							
							<i class="fa fa-circle-o"></i>
							<span>Admon. Servicios</span>

						</a>

					</li>
					<li>

						<a href="reporteServicios">
							
							<i class="fa fa-circle-o"></i>
							<span>Reporte servicios</span>

						</a>

					</li>
					
					</ul>
			</li>';
			}

			if ($_SESSION["perfil"] == "Administrador" || $_SESSION["perfil"] == "Vendedor") {

				echo '<li class="treeview">

				<a href="#">

					<i class="fa fa-archive"></i>
					
					<span>Admon. Paquetería</span>
					
					<span class="pull-right-container">
					
						<i class="fa fa-angle-left pull-right"></i>

					</span>

				</a>

				<ul class="treeview-menu">
					
				<li>

				<a href="pedidosPaqueteria">
					
					<i class="fa fa-circle-o"></i>
					<span>Env. Paquetería</span>

				</a>

			</li>
					
					</ul>
			</li>';
			}

			if ($_SESSION["perfil"] == "Administrador" || $_SESSION["perfil"] == "Vendedor") {

				echo '<li class="treeview">

				<a href="#">

					<i class="fa fa-scissors"></i>
					
					<span>Cajas y cortes</span>
					
					<span class="pull-right-container">
					
						<i class="fa fa-angle-left pull-right"></i>

					</span>

				</a>

				<ul class="treeview-menu">
					
					<li>

						<a href="cajas">
							
							<i class="fa fa-circle-o"></i>
							<span>Admon. Cajas</span>

						</a>

					</li>

					<li>

						<a href="cortes">
							
							<i class="fa fa-circle-o"></i>
							<span>Admon. Cortes</span>

						</a>

					</li>';

				echo '</ul>

			</li>';

				echo '<li>

				<a href="facturacion">

					<i class="fa fa-th"></i>
					<span>Facturas</span>

				</a>

			</li>';
			}
			?>

		</ul>

	</section>

</aside>