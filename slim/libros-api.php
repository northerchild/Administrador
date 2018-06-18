<?php

require_once 'vendor/autoload.php';

$app = new \Slim\Slim();

$db = new mysqli("localhost", "root", "", "librosu");

$app->get("/libros", function() use($db, $app) {
	// sleep(3);
	$query = $db->query("SELECT * FROM libros ORDER BY id DESC;");
	$restaurantes = array();
	while ($fila = $query->fetch_assoc()) {
		$restaurantes[] = $fila;
	}

	$result = array("status" => "success",
		"data" => $restaurantes);

	echo json_encode($result);
});

$app->get("/libro/:id", function($id) use($db, $app) {
	// sleep(3);
	$query = $db->query("SELECT * FROM libros WHERE id = $id;");
	$restaurante = $query->fetch_assoc();

	if ($query->num_rows == 1) {
		$result = array("status" => "success",
			"data" => $restaurante);
	} else {
		$result = array(
			"status" => "error",
			"message" => "El restaurante no existe");
	}

	echo json_encode($result);
});

$app->get("/random-libro", function() use($db, $app) {
	// sleep(3);
	$query = $db->query("SELECT * FROM libros ORDER BY RAND() LIMIT 1;");
	$restaurante = $query->fetch_assoc();

	if ($query->num_rows == 1) {
		$result = array("status" => "success",
			"data" => $restaurante);
	} else {
		$result = array(
			"status" => "error",
			"message" => "El libro no existe");
	}

	echo json_encode($result);
});


$app->post("/libros", function() use($db, $app) {

	$json = $app->request->post("json");
	$data = json_decode($json, true);
	/*
	$query = "INSERT INTO restaurantes VALUES(NULL,"
			. "'{$data["nombre"]}',"
			. "'{$data["direccion"]}',"
			. "'{$data["descripcion"]}',"
			. "'{$data["imagen"]}', "
			. "'{$data["precio"]}'"
			. ")";
	*/
	 $query = "INSERT INTO libros VALUES(NULL,"
	  . "'{$app->request->post("nombre")}',"
	  . "'{$app->request->post("descripcion")}',"
	  . "NULL, "
	  . "'{$app->request->post("carrera")}'"
	  . ")";
	 
	$insert = $db->query($query);

	if ($insert) {
		$result = array("status" => "success",
			"message" => "Libro creado correctamente!!!");
	} else {
		$result = array("status" => "error", "message" => "Libro NO SE HA creado!!!");
	}

	echo json_encode($result);
});

$app->post("/update-libro/:id", function($id) use($db, $app) {
	header("Access-Control-Allow-Origin: *");
	$json = $app->request->post("json");
	$data = json_decode($json, true);

	$query = "UPDATE libros SET "
			. "nombre = '{$data["nombre"]}', "
			. "descripcion = '{$data["descripcion"]}', "
			. "carrera = '{$data["carrera"]}', "
			. "imagen = '{$data["imagen"]}' "
			. " WHERE id={$id}";
	$update = $db->query($query);

	if ($update) {
		$result = array("status" => "success", "message" => "El libro se ha actualizado correctamente!!!");
	} else {
		$result = array("status" => "error", "message" => "El libro NO SE HA actualizado!!!");
	}

	echo json_encode($result);
});

$app->get("/delete-libro/:id", function($id) use($db, $app) {
	$query = "DELETE FROM libros WHERE id = {$id}";
	$delete = $db->query($query);

	if ($delete) {
		$result = array("status" => "success", "message" => "El libro se ha borrado correctamente!!!");
	} else {
		$result = array("status" => "error", "message" => "El libro NO SE HA borrado!!!");
	}

	echo json_encode($result);
});


$app->post("/upload-file", function() use($db, $app) {
	
	$result = array("status" => "error", "message" => "The file could not be uploaded");

	if (isset($_FILES["uploads"])) {
		$piramideUploader = new PiramideUploader();

		$upload = $piramideUploader->upload("image", "uploads", "uploads", array("image/jpeg", "image/png", "image/gif"));
		$file = $piramideUploader->getInfoFile();
		$file_name = $file["complete_name"];
		
		if (isset($upload) && $upload["uploaded"] == false) {
			$result = array("status" => "error",
				"message" => $upload["error"]);
		} else {
			$result = array("status" => "success",
				"message" => "Fichero subido correctamente",
				"filename"=>$file_name);
		}
	}
	
	echo json_encode($result);
});

$app->run();

