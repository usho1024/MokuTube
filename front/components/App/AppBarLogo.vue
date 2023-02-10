<template>
  <v-btn text tile @click="goToHome">
    <v-img height="25" width="130" contain :src="image_src" />
  </v-btn>
</template>

<script>
export default {
  props: {
    roomChannel: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      image_src: require('~/assets/img/logo.svg'),
    }
  },
  methods: {
    goToHome() {
      if (this.$route.path === `/rooms/${this.$route.params.id}`) {
        this.roomChannel.perform('unsubscribed')
        this.$nextTick(() => {
          this.$router.replace('/rooms')
        })
      } else if (this.$store.$auth.loggedIn) {
        this.$router.push('/rooms')
      } else {
        this.$router.push('/')
      }
    },
  },
}
</script>
