<template>
  <v-app-bar app dense elevation="1" color="white">
    <v-app-bar-title class="text-subtitle-1">
    </v-app-bar-title>

    <v-spacer />

    <v-btn class="green white--text mr-10" @click="goToRooms">
      <v-icon class="mr-2">mdi-exit-run</v-icon>
      退室する</v-btn
    >
    <app-bar-account-menu />
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
  methods: {
    goToRooms() {
      this.roomChannel.perform('unsubscribed')
      this.$nextTick(() => {
        this.$router.push('/rooms')
      })
    },
  },
}
</script>
