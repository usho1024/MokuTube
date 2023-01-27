<template>
  <v-text-field
    v-model="setEmail"
    :rules="rules"
    label="メールアドレスを入力"
    placeholder="your@email.com"
    outlined
    hide-details
    class="mb-8"
    required
  />
</template>

<script>
export default {
  props: {
    email: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      rules: [(v) => !!v || '', (v) => /.+@.+/.test(v) || ''],
    }
  },
  computed: {
    setEmail: {
      get() {
        return this.email
      },
      set(newVal) {
        return this.$emit('update:email', newVal)
      },
    },
  },
}
</script>
