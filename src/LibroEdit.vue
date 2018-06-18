<template>
	<div id="libro-add">
	<h2>Añadir nuevo libro</h2>	
		<form @submit.prevent="guardarLibro">
			<p>
				<label>Nombre</label>
				<input type="text" v-model="libro.nombre">
			</p>
			<p>
				<label>Descripción</label>
				<textarea v-model="libro.descripcion"></textarea>
			</p>
			<p>
				<label>Carrera</label>
				<select v-model="libro.carrera">
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
<script>
	import axios from 'axios'
	export default{
		name:'libro-add',
		mounted(){
			this.id = this.$route.params.id
			axios.get('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/libro/' + this.id)
				 .then((respuesta)=>{
				 	this.libro = respuesta.data.data
				 })
		},
		data(){
			return {
				id: null,
				libro:{
					nombre:'',
					descripcion:'',
					carrera:''
				}
			}
		},
		methods:{
			guardarLibro(){
				console.log(this.libro)
				let router = this.$router;
				let params = 'json='+JSON.stringify(this.libro)
				let id = this.id;
				axios.post('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/update-libro/'+id,params)
					 .then((respuesta)=>{
					 	if(respuesta.data.status == 'success'){
				     		// redirigir
				     		router.push('/libro/'+id);
					 		console.log(respuesta)
				     	}
					 })
					 .catch((error)=>{
					 	console.log(error)
					 })
			}
		}
	}
</script>
<style>
	textarea{
		min-height: 50px;
		max-height: 150px;
		min-width: 100px;
		max-width: 150px;
	}
</style>