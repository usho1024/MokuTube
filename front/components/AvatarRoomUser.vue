<template>
  <v-menu offset-x>
    <template #activator="{ on: menu }">
      <v-tooltip top color="indigo">
        <template #activator="{ on: tooltip }">
          <v-btn
            icon
            :width="size"
            :height="size"
            class="avatar"
            :style="{ transform: `translate(${x}px, ${y}px)` }"
            v-on="{ ...tooltip, ...menu }"
          >
            <v-avatar :size="size">
              <v-img :src="user.avatar" />
            </v-avatar>
          </v-btn>
        </template>
        <span>{{ user.name }}</span>
      </v-tooltip>
    </template>

    <v-card min-width="200">
      <v-tooltip top>
        <template #activator="{ on }">
          <v-list-item nuxt :to="`/users/${user.id}`" v-on="on">
            <v-list-item-icon class="mr-3">
              <v-icon size="22">mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>{{ user.name }}</v-list-item-title>
          </v-list-item>
        </template>
        <span>クリックでユーザー詳細を表示</span>
      </v-tooltip>
      <v-list-item>
        <v-list-item-icon class="mr-3">
          <v-icon size="22">mdi-lead-pencil</v-icon>
        </v-list-item-icon>
        <v-list-item-title v-if="user.work" class="text-body-1">{{
          user.work
        }}</v-list-item-title>
        <v-list-item-title v-else class="text-body-1">未設定</v-list-item-title>
      </v-list-item>
    </v-card>
  </v-menu>
</template>

<script>
export default {
  props: {
    size: {
      type: Number,
      default: null,
    },
    x: {
      type: Number,
      default: null,
    },
    y: {
      type: Number,
      default: null,
    },
    user: {
      type: Object,
      default: null,
    },
  },
}
</script>

<style lang="scss" scoped>
.avatar {
  position: absolute;
  left: 0;
  top: 0;
}
</style>
