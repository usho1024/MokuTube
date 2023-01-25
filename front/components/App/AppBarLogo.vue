<template>
  <nuxt-link to="/">
    <v-img height="25" width="130" contain :src="image_src"></v-img>
  </nuxt-link>
</template>


<script>
export default {
  data() {
    return {
      image_src: require('~/assets/img/logo.svg'),
    }
  },
}
</script>
