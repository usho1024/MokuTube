<template>
  <v-app>
    <app-bar-logged-in v-if="currentUser" />
    <app-bar v-else />
    <v-main>
      <nuxt />
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'Default',
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    },
  },
}
</script>
