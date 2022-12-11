<template>
  <v-app-bar
    app
    dense
    elevation="1"
    color="white"
  >
    MokuTube
    <v-spacer />
    <v-btn
      class="mr-4 warning white--text"
      @click="$auth.logout()"
    >
      ログアウト
    </v-btn>
    {{ userInfo }}
  </v-app-bar>
</template>

<script>
export default {
  computed: {
    userInfo() {
      return this.$store.state.currentUser.email
    }
  }
}
</script>
