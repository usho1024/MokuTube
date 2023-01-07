<template>
  <v-app-bar app dense elevation="1" color="white">
    <v-app-bar-title class="text-subtitle-1">MokuTube</v-app-bar-title>

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

    <v-btn text tile width="150" class="mr-10" @click="logoutWithAuthModule"
      >ログアウト</v-btn
    >

    <nuxt-link to="/users/mypage">
      <v-avatar size="35" class="mr-5">
        <img :src="currentUser.avatar.thumb.url" />
      </v-avatar>
    </nuxt-link>
  </v-app-bar>
</template>

<script>
export default {
  data() {
    return {
      menuItems: [
        { name: 'ルーム一覧', link: 'rooms' },
        { name: 'ルーム作成', link: 'rooms/create' },
      ],
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    },
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
