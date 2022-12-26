<template>
  <v-card
    nuxt
    :to="`/rooms/${id}`"
  >
    {{ name }}
  </v-card>
</template>

<script>
export default {
  props: {
    id: {
      type: Number,
      default: null
    },
    name: {
      type: String,
      default: null
    }
  }
}
</script>
