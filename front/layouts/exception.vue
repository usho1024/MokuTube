<template>
  <v-app>
    <app-bar-exception />
    <v-main>
      <app-toaster />
      <nuxt />
    </v-main>
    <app-footer />
  </v-app>
</template>

<script>
export default {
  name: 'Exception',
}
</script>
