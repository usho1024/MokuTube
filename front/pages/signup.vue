<template>
  <user-form-card>
    <template #user-form-card-content>
      <v-form v-model="valid" :disabled="loading" @submit.prevent="signup">
        <user-form-name :name.sync="input.name" />
        <user-form-email :email.sync="input.email" placeholder />
        <user-form-password :password.sync="input.password" set-validation />
        <user-form-password-confirm
          :password-confirm.sync="input.password_confirmation"
        />
        <v-btn
          type="submit"
          :disabled="!valid || loading"
          :loading="loading"
          block
          color="appblue"
          class="white--text"
        >
          登録する
        </v-btn>
      </v-form>
    </template>
  </user-form-card>
</template>

<script>
export default {
  name: 'Signup',
  middleware({ store, redirect }) {
    if (store.$auth.loggedIn) {
      redirect('/rooms')
    }
  },
  auth: false,
  data() {
    return {
      valid: false,
      loading: false,
      input: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      },
    }
  },
  head() {
    return {
      title: '新規登録',
    }
  },
  methods: {
    async signup() {
      this.loading = true
      await this.$axios
        .post('/api/v1/auth', this.input)
        .then(() => this.loginWithAuthModule())
        .catch((error) => this.authFailure(error))
    },
    async loginWithAuthModule() {
      await this.$auth
        .loginWith('local', {
          params: { email: this.input.email, password: this.input.password },
        })
        .then((response) => {
          const user = {
            id: response.data.data.id,
            name: response.data.data.name,
            avatar: response.data.data.avatar,
          }
          this.$store.dispatch('getCurrentUser', user)
          this.$router.replace('/rooms')
          const msgs = ['登録が完了しました']
          const color = 'green'
          this.$store.dispatch('getToast', { msgs, color })
        })
    },
    authFailure({ response }) {
      this.loading = false
      const msgs = response.data.errors.full_messages
      const color = 'red'
      this.$store.dispatch('getToast', { msgs, color })
    },
  },
}
</script>
