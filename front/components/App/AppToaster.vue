<template>
  <v-snackbar
    v-model="setSnackbar"
    app
    top
    text
    :timeout="toast.timeout"
    :color="toast.color"
  >
    <div v-for="msg in toast.msgs" :key="msg">・{{ msg }}</div>
    <template #action="{ attrs }">
      <v-btn icon v-bind="attrs" text :color="toast.color" @click="resetToast">
        <v-icon>mdi-close-circle-outline</v-icon>
      </v-btn>
    </template>
  </v-snackbar>
</template>

<script>
export default {
  computed: {
    toast() {
      return this.$store.state.toast
    },
    setSnackbar: {
      get() {
        return !!this.toast.msgs
      },
      set() {
        this.resetToast()
      },
    },
  },
  methods: {
    resetToast() {
      this.$store.dispatch('getToast', { msgs: null })
    },
  },
}
</script>
