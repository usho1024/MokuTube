<template>
  <v-app-bar app dense elevation="1" color="white">
    <nuxt-link to="/" class="text-decoration-none">
      <v-app-bar-title class="text-subtitle-1">MokuTube</v-app-bar-title>
    </nuxt-link>

    <v-spacer />

    <div class="mr-10">
      <v-btn
        v-for="menuItem in menuItems"
        :key="menuItem.name"
        text
        tile
        exact
        nuxt
        :to="`/${menuItem.link}`"
        width="150"
      >
        {{ menuItem.name }}
      </v-btn>
    </div>

    <v-btn text tile width="150" @click="logoutWithAuthModule"
      >ログアウト</v-btn
    >
  </v-app-bar>
</template>

<script>
export default {
  data() {
    return {
      menuItems: [
        { name: 'ログイン', link: 'login' },
        { name: '新規登録', link: 'signup' },
      ],
    }
  },
  methods: {
    async logoutWithAuthModule() {
      await this.$auth.logout().then(() => {
        setTimeout(() => {
          this.$store.dispatch('getCurrentUser', null)
        }, 1500)
      })
    },
  },
}
</script>
