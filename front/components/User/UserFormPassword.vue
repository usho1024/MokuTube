<template>
  <v-text-field
    v-model="setPassword"
    :rules="form.rules"
    :hint="form.hint"
    label="パスワードを入力"
    :placeholder="form.placeholder"
    :counter="setValidation"
    :append-icon="toggle.icon"
    :type="toggle.type"
    outlined
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
    setValidation: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      show: false,
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
    form() {
      const min = '6文字以上'
      const msg = `${min}。半角英数字•ﾊｲﾌﾝ•ｱﾝﾀﾞｰﾊﾞｰが使えます`
      const required = (v) => !!v || ''
      const format = (v) => /^[\w-]{6,72}$/.test(v) || msg
      const rules = this.setValidation ? [format] : [required]
      const hint = this.setValidation ? msg : undefined
      const placeholder = this.setValidation ? min : undefined
      return { rules, hint, placeholder }
    },
  },
}
</script>
