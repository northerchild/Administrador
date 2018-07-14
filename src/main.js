import Vue from 'vue'
import VueRouter from 'vue-router'
import SweetAlert from 'sweetalert/dist/sweetalert.min.js'
import App from './App.vue'
import Home from './Home.vue'
import ListaLibros from './LibrosList.vue'
import LibrosId from './LibrosId.vue'
import Contactos from './Contactos.vue'
import Libro from './libro.vue'
import LibroAdd from './LibroAdd.vue'
import LibroEdit from './LibroEdit.vue'
Vue.use(VueRouter)

const routes = [
	{path: '/', component: Home},
	{path: '/home', component: Home},
	{path: '/libro-list', component: ListaLibros},
	{path: '/libro-id/:id', name:'libro-id', component: LibrosId},
	{path: '/libro/:id', name:'libro', component: Libro},
	{path: '/editar-libro/:id', name:'editar-libro-id', component: LibrosId},
	{path: '/crear-libro/:id', name:'crear-libro', component: LibroAdd},
	{path: '/editar-libro/:id', name:'libro-edit', component: LibroEdit},
	{path: '/contacto', component: Contactos}
];

const router = new VueRouter({
	routes,
	mode: 'history'
})

Vue.component('home',Home)
Vue.component('libros',ListaLibros)
Vue.component('libro',LibrosId)
Vue.component('contacto',Contactos)
new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
