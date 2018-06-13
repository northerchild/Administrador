<template>
	<h2>{{texto}} : {{id_libro}}</h2>
</template>
<script>
export default {
  name: 'home',
  mounted(){
  	this.id_libro = this.$route.params.id;
  },
  data () {
    return {
      texto: 'Libro ID',
      id_libro: null
    }
  }
}
</script>
<style></style>