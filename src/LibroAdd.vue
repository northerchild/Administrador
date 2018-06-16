<template>
	<div id="libro-add">
	<h2>Añadir nuevo libro</h2>	
		<form action="">
			<p>
				<label>Nombre</label>
				<input type="text">
			</p>
			<p>
				<label>Dirección</label>
				<input type="text">
			</p>
			<p>
				<label>Descripción</label>
				<textarea></textarea>
			</p>
			<p>
				<label>Carrera</label>
				<select>
					<option value="">Seleciona tu carrera</option>
					<option value="sistemas">Sistemas</option>
					<option value="financiera">Financiera</option>
					<option value="administrativa">Administrativa</option>
				</select>
			</p>
			<input type="submit" value="Guardar Libro">
		</form>
	</div>
</template>
<script></script>
<style>
	textarea{
		min-height: 50px;
		max-height: 150px;
		min-width: 100px;
		max-width: 150px;
	}
</style>