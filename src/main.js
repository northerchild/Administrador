import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import Home from './Home.vue'
import ListaLibros from './LibrosList.vue'
import LibrosId from './LibrosId.vue'
import Contactos from './Contactos.vue'
Vue.use(VueRouter)

const routes = [
	{path: '/', component: Home},
	{path: '/home', component: Home},
	{path: '/libro-list', component: ListaLibros},
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
