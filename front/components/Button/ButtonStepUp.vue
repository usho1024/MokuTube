<template>
  <v-btn
    outlined
    width="100"
    :disabled="disabled"
    color="indigo"
    class="mr-5"
    @click="$emit('stepUp')"
  >
    進む
  </v-btn>
</template>

<script>
export default {
  props: {
    disabled: {
      type: Boolean,
      default: true,
    },
  },
}
</script>
