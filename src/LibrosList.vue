<template>
	<div>
		<h2>{{texto}}</h2>
		<ul id="libros-list" v-if="libros != null">
			<li v-for="libro in libros"><strong>{{libro.nombre}}</strong></li>
		</ul>	
			<span v-else>Cargando...</span>
	</div>
</template>
<script>
import axios from 'axios'	
export default {
  name: 'libros-list',
  mounted(){
  	this.getLibros();
  },
  data () {
    return {
      texto: 'Lista de libros',
      libros: null
    }
  },
  methods:{
  	getLibros(){
  		axios.get('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/restaurantes')
  			 .then((respuesta)=>{
  			 	this.libros = respuesta.data.data
  			 })
  	}
  }
}
</script>
<style></style>