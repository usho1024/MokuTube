<template>
  <v-btn
    outlined
    width="100"
    :disabled="!value"
    color="indigo"
    class="mr-5"
    @click="$emit('btnClick')"
  >
    進む
  </v-btn>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      default: null,
    },
  },
}
</script>
