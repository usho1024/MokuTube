<template>
  <v-app-bar
    app
    dense
    elevation="1"
    color="white"
  >
    MokuTube

    <v-spacer />

    <nuxt-link to="/edit">
      <v-avatar
        size="36px"
      >
        <img
          :src="currentUser.avatar.thumb.url"
        >
      </v-avatar>
    </nuxt-link>
    <v-btn
      class="mx-4 warning white--text"
      nuxt
      @click="goToRooms"
    >
      退出する
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  props: {
    roomChannel: {
      type: Object,
      default: null,
    },
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    }
  },
  methods: {
    goToRooms() {
      this.roomChannel.perform('unsubscribed')
      setTimeout(() => {
        this.$router.push('/rooms')
        }, 500)
    }
  }
}
</script>
