<template>
  <user-form-card>
    <template #user-form-card-content>
      <v-form
        v-model="valid"
        :disabled="loading"
        @submit.prevent="loginWithAuthModule"
      >
        <user-form-email :email.sync="input.params.email" />
        <user-form-password :password.sync="input.params.password" />
        <v-btn
          type="submit"
          :disabled="!valid || loading"
          :loading="loading"
          block
          color="appblue"
          class="white--text mt-3"
        >
          ログインする
        </v-btn>
      </v-form>
    </template>
  </user-form-card>
</template>

<script>
export default {
  name: 'Login',
  data() {
    return {
      valid: false,
      loading: false,
      input: { params: { email: '', password: '' } },
    }
  },
  head() {
    return {
      title: 'ログイン',
    }
  },
  methods: {
    async loginWithAuthModule() {
      this.loading = true
      await this.$auth.loginWith('local', this.input).then((response) => {
        const user = {
          id: response.data.data.id,
          name: response.data.data.name,
          avatar: response.data.data.avatar,
        }
        this.$store.dispatch('getCurrentUser', user)
      })
    },
  },
}
</script>
