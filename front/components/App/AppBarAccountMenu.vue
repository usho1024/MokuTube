<template>
  <v-menu app offset-x offset-y max-width="200">
    <template #activator="{ on }">
      <v-btn icon class="mr-5" v-on="on">
        <v-avatar size="35">
          <img :src="currentUser.avatar.thumb.url" />
        </v-avatar>
      </v-btn>
    </template>

    <v-list dense>
      <v-subheader>ログイン中のユーザー</v-subheader>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-subtitle class="text-truncate">
            {{ currentUser.name }}
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider />

      <v-subheader>アカウント</v-subheader>
      <template v-for="(menu, i) in menus">
        <v-divider v-if="menu.divider" :key="`menu-divider-${i}`" />
        <v-list-item :key="`menu-${i}`" @click="menu.method">
          <v-list-item-icon class="mr-2">
            <v-icon size="22">{{ menu.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-title>{{ menu.name }}</v-list-item-title>
        </v-list-item>
      </template>
    </v-list>
  </v-menu>
</template>

<script>
export default {
  data() {
    return {
      menus: [
        {
          name: 'マイページ',
          icon: 'mdi-account-edit',
          method: this.goToMypage,
        },
        {
          name: 'ログアウト',
          icon: 'mdi-logout-variant',
          method: this.logout,
          divider: true,
        },
      ],
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    },
  },
  methods: {
    async logout() {
      await this.$auth.logout().then(() => {
        setTimeout(() => {
          const msgs = ['ログアウトしました']
          const color = 'green'
          this.$store.dispatch('getToast', { msgs, color })
          this.$store.dispatch('getCurrentUser', null)
        }, 100)
      })
    },
    goToMypage() {
      this.$router.push('/mypage')
    },
  },
}
</script>
