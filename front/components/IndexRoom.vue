<template>
  <v-card>
    {{ name }}
  </v-card>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      default: ''
    }
  }
}
</script>
