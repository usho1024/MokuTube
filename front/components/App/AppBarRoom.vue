<template>
  <v-app-bar app dense elevation="1" color="white">
    <app-bar-logo :room-channel="roomChannel" class="mr-10" />

    <v-app-bar-title
      class="text-subtitle-1 grey--text text--darken-1 font-weight-bold"
      ><v-icon color="grey darken-1" class="mr-2">mdi-home-automation</v-icon
      >{{ name }}</v-app-bar-title
    >
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
    name: {
      type: String,
      default: null,
    },
  },
  methods: {
    goToRooms() {
      this.roomChannel.perform('unsubscribed')
      this.$nextTick(() => {
        this.$router.replace('/rooms')
      })
    },
  },
}
</script>
