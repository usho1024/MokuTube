<template>
  <v-text-field
    v-model="setPassword"
    :rules="rules"
    hint="半角英数字6文字以上"
    label="パスワードを入力"
    :append-icon="toggle.icon"
    :type="toggle.type"
    outlined
    counter
    class="mb-1"
    required
    @click:append="show = !show"
  />
</template>

<script>
export default {
  props: {
    password: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      show: false,
      rules: [(v) => !!v || '', (v) => /^[\w-]{6,72}$/.test(v) || ''],
    }
  },
  computed: {
    setPassword: {
      get() {
        return this.password
      },
      set(newVal) {
        return this.$emit('update:password', newVal)
      },
    },
    toggle() {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    },
  },
}
</script>
