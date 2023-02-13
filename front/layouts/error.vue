<template>
  <v-container class="pa-0">
    <v-row no-gutters justify="center">
      <v-col xl="4" md="6">
        <v-card height="30vh" class="pa-8 text-center">
          <h2>{{ error.statusCode }} Error</h2>
          <v-card-title class="justify-center">{{ notice.title }}</v-card-title>
          <p class="mb-12">{{ notice.body }}</p>
          <v-btn
            v-if="error.statusCode === 404"
            dark
            color="appblue"
            @click="goToHome"
            >ホームに戻る</v-btn
          >
          <v-btn v-else dark color="appblue" @click="logout"
            >再ログインする</v-btn
          >
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'exception',
  props: {
    error: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      notice: { title: '', body: '' },
    }
  },
  head() {
    return {
      title: this.notice.title,
    }
  },
  created() {
    this.setNotice()
  },
  methods: {
    setNotice() {
      switch (this.error.statusCode) {
        case 401:
          this.notice.title = 'ユーザー認証に失敗しました'
          this.notice.body = 'ログアウト後、再度ログインしてください'
          break
        case 404:
          this.notice.title = 'お探しのページが見つかりませんでした'
          this.notice.body = 'URLに誤りがないか今一度ご確認ください'
          break
        case 500:
          this.notice.title = 'ユーザーの読み込みに失敗しました'
          this.notice.body = 'ログアウト後、再度ログインしてください'
          break
        default:
          this.notice.title = this.error.message
      }
    },
    goToHome() {
      this.$store.$auth.loggedIn
        ? this.$router.push('/rooms')
        : this.$router.push('/')
    },
    async logout() {
      await this.$auth.logout().then(() => {
        setTimeout(() => {
          this.$router.replace('/login')
          const msgs = ['ログアウトしました']
          const color = 'green'
          this.$store.dispatch('getToast', { msgs, color })
          this.$store.dispatch('getCurrentUser', null)
        }, 100)
      })
    },
  },
}
</script>
