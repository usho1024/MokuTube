<template>
  <v-app-bar app dense elevation="1" color="white">
    <app-bar-logo />

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

    <app-bar-account-menu />
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
}
</script>
