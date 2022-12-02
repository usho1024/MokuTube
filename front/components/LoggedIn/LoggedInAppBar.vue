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
    {{ $store.state.currentUser.email }}
  </v-app-bar>
</template>

<script>
export default {
}
</script>
