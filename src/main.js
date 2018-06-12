import Vue from 'vue'
import App from './App.vue'
import Home from './Home.vue'
import ListaLibros from './LibrosList.vue'
import LibrosId from './LibrosId.vue'
import Contactos from './Contactos.vue'
Vue.component('home',Home)
Vue.component('libros',ListaLibros)
Vue.component('libro',LibrosId)
Vue.component('contacto',Contactos)
new Vue({
  el: '#app',
  render: h => h(App)
})
