<template>
  <v-btn
    :x-large="xLarge"
    :block="block"
    dark
    color="teal accent-4"
    :loading="loading"
    @click="guestLogin"
    >ゲストログインして今すぐ使ってみる！</v-btn
  >
</template>

<script>
export default {
  props: {
    xLarge: {
      type: Boolean,
      default: false,
    },
    block: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      guest: { id: '', pass: '' },
      loading: false,
    }
  },
  computed: {
    guestUser() {
      return {
        name: `ゲスト${this.guest.id}`,
        email: `${this.guest.id}@mokutube.guest`,
        password: this.guest.pass,
        password_confirmation: this.guest.pass,
      }
    },
  },
  methods: {
    getRandomStr() {
      const chars = 'abcdefghijklmnopqrstuvwxyz0123456789'
      let [guestId, guestPass] = ['', '']
      for (let i = 0; i < 8; i++) {
        guestId += chars[Math.floor(Math.random() * chars.length)]
        guestPass += chars[Math.floor(Math.random() * chars.length)]
      }
      ;[this.guest.id, this.guest.pass] = [guestId, guestPass]
    },
    async guestLogin() {
      this.loading = true
      this.getRandomStr()
      await this.$axios
        .post('/api/v1/auth', this.guestUser)
        .then(() => this.login())
        .catch(() => this.authFailure())
    },
    async login() {
      const params = {
        params: {
          email: this.guestUser.email,
          password: this.guestUser.password,
        },
      }
      const response = await this.$auth.loginWith('local', params)
      const user = {
        id: response.data.data.id,
        name: response.data.data.name,
        avatar: response.data.data.avatar,
      }
      this.$store.dispatch('getCurrentUser', user)
      this.$router.replace('/rooms')
      const msgs = ['ゲストユーザーでログインしました']
      const color = 'green'
      this.$store.dispatch('getToast', { msgs, color })
    },
    authFailure() {
      this.loading = false
      const msgs = [
        'ユーザーの作成に失敗しました。',
        'お手数ですが再度ゲストログインボタンをクリックしてください。',
      ]
      const color = 'red'
      this.$store.dispatch('getToast', { msgs, color })
    },
  },
}
</script>
