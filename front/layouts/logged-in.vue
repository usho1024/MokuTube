<template>
  <v-app>
    <app-bar-logged-in />
    <v-main>
      <app-toaster />
      <nuxt />
    </v-main>
    <app-footer />
  </v-app>
</template>

<script>
export default {
  name: 'Default',
}
</script>
