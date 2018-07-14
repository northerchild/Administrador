<template>
	<div>
		<h2>{{texto}}</h2>
		<ul id="libros-list" v-if="libros != null">
			<li v-for="libro in libros">
				<strong>{{libro.nombre}}</strong>
				<p>
					<router-link :to="{name:'libro', params:{id: libro.id}}">Ver</router-link>
					<router-link :to="{name:'libro-edit', params:{id: libro.id}}">Editar</router-link>
          <span v-if="showBorrar != libro.id">
            <a @click="borrarLibro(libro.id)">Eliminar</a>
          </span>
          <span v-else>
            <p>¿Estas seguro de borrar el libro?</p>
            <button @click="cancelarBorrado()" class="borrar">Cancelar </button>
            <button @click="confirmarBorrado(libro.id)" class="eliminar">Borrar</button>
          </span>
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
      libros: null,
      showBorrar: null
    }
  },
  methods:{
  	getLibros(){
  		axios.get('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/libros')
  			 .then((respuesta)=>{
  			 	this.libros = respuesta.data.data
  			 })
  	},
    borrarLibro(id){
      this.showBorrar = id
    },
    cancelarBorrado(){
      this.showBorrar = null,
      this.showBorrar = swal("Libro no borrado!")
    },
    confirmarBorrado(id){
      axios.get('http://localhost:8081/VueAdministrator/vue_administrador/slim/libros-api.php/delete-libro/'+id)
           .then((respuesta)=>{
              this.borrarLibro = null
              this.showBorrar = swal("libro"+id, "Borrado!", "success");
              this.getLibros()
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
            padding: 20px;
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
          button.borrar,button.eliminar{
            border-radius:15px;
            cursor:pointer;
            color:#f2f2f2;
            border:none;
            transition: all 0.6s ease;
            font-size: 18px;
            &:hover{
                text-decoration: underline;
              }
          }
          button.borrar{
            background: #e8910d;
            border: 1px solid #e8910d;
            &:hover{
                background:#bf790d;
                color:#fff;
              }
          }
          button.eliminar{
            background: #ed5650;
            border: 1px solid #ed5650;
            &:hover{
                background:#d62b24;
                color:#fff;
              }
          }
      }
</style>