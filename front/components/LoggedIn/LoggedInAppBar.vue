<template>
  <v-app-bar app dense elevation="1" color="white">
    <v-app-bar-title class="text-subtitle-1">MokuTube</v-app-bar-title>

    <v-spacer />

    <div class="mr-10">
      <v-btn
        v-for="menu in menus"
        :key="menu.name"
        text
        tile
        exact
        nuxt
        :to="`/${menu.link}`"
        width="150"
      >
        {{ menu.name }}
      </v-btn>
    </div>

    <logged-in-app-bar-account-menu />
  </v-app-bar>
</template>

<script>
export default {
  data() {
    return {
      menus: [
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
}
</script>
