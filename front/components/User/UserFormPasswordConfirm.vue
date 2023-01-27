<template>
  <v-text-field
    v-model="setPasswordConfirm"
    :rules="rules"
    label="確認のためパスワードを再入力"
    outlined
    hide-details
    class="mb-8"
    required
  />
</template>

<script>
export default {
  props: {
    passwordConfirm: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      rules: [(v) => !!v || '', (v) => /^[\w-]{6,72}$/.test(v) || ''],
    }
  },
  computed: {
    setPasswordConfirm: {
      get() {
        return this.passwordConfirm
      },
      set(newVal) {
        return this.$emit('update:passwordConfirm', newVal)
      },
    },
  },
}
</script>
