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
      @click="$auth.logout()"
    >
      ログアウト
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    }
  }
}
</script>
