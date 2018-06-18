<template>
	<div>
		<h2>{{texto}}</h2>
		<ul id="libros-list" v-if="libros != null">
			<li v-for="libro in libros">
				<strong>{{libro.nombre}}</strong>
				<p>
					<router-link :to="{name:'libro', params:{id: libro.id}}">Ver</router-link>
					<router-link :to="{name:'libro-edit', params:{id: libro.id}}">Editar</router-link>
				</p>
			</li>
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
  		axios.get('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/libros')
  			 .then((respuesta)=>{
  			 	this.libros = respuesta.data.data
  			 })
  	}
  }
}
</script>
</script>
<style lang="scss">
      #libros-list{
        padding: 5px;
        li{
            margin-top: 10px;
            width: 30%;
            height: 120px;
            border: 1px solid #ddd;
            background: #eee;
            overflow: hidden;
            border-radius: 10px;
            transition: all ease .7s;
            &:hover{
              box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
              background: #fbfbfb;
            }
            strong{
           		margin-top: 8px;
           		display: inline-block
           	}
          } 
          p{
            font-size: 1em;
            a{
              margin-right: 15px;
              text-decoration: none;
              cursor:pointer;
              &:hover{
                text-decoration: underline;
              }
            }
          }
      }
</style>