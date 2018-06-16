<template>
	<div>
		<h1>Detalle del Libro {{id}}</h1>
		<div id="libro-detalle" v-if="libro != null">
			<h2>{{libro.nombre}}</h2>
			<p>{{libro.descripcion}}</p>
		</div>
		<span v-else>Cargando Libros</span>
	</div>
</template>
<script>
	import axios from 'axios'
	export default{
		name:'libro-detalle',
		mounted(){
			this.id = this.$route.params.id
			axios.get('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/libro/' + this.id)
				 .then((respuesta)=>{
				 	this.libro = respuesta.data.data
				 })
		},
		data(){
			return{
				id:null,
				libro:null
			}
		}
	}
</script>
<style></style>