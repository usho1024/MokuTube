<template>
  <v-container class="pa-0">
    <v-row no-gutters justify="center">
      <v-col xl="3" md="5">
        <v-card class="pa-8">
          <v-row no-gutters class="mb-8">
            <v-col v-for="menu in menus" :key="menu.name" cols="6">
              <v-btn
                block
                text
                tile
                exact
                nuxt
                :to="`/${menu.link}`"
                exact-active-class="link--active"
              >
                {{ menu.name }}
              </v-btn>
            </v-col>
          </v-row>
          <slot name="user-form-card-content" />
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      menus: [
        { name: 'ログイン', link: 'login' },
        { name: '新規登録', link: 'signup' },
      ],
    }
  },
}
</script>

<style lang="scss" scoped>
.link--active {
  background-color: #607d8b;
  color: white;
}
</style>
