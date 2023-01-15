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
            :style="{
              transform: `translate(${roomUser.x_coord}px, ${roomUser.y_coord}px)`,
            }"
            v-on="{ ...tooltip, ...menu }"
          >
            <v-avatar :size="size">
              <v-img :src="roomUser.detail.avatar" />
            </v-avatar>
          </v-btn>
        </template>
        <span>{{ roomUser.detail.name }}</span>
      </v-tooltip>
    </template>

    <v-list dense min-width="200">
      <v-list-item>
        <v-list-item-icon class="mr-3">
          <v-icon size="22">mdi-account</v-icon>
        </v-list-item-icon>
        <v-list-item-title class="text-caption">{{
          roomUser.detail.name
        }}</v-list-item-title>
      </v-list-item>
      <v-list-item>
        <v-list-item-icon class="mr-3">
          <v-icon size="22">mdi-lead-pencil</v-icon>
        </v-list-item-icon>
        <v-list-item-title v-if="roomUser.detail.work" class="text-caption">{{
          roomUser.detail.work
        }}</v-list-item-title>
        <v-list-item-title v-else class="text-caption"
          >未設定</v-list-item-title
        >
      </v-list-item>
      <v-list-item>
        <v-list-item-icon class="mr-3">
          <v-icon size="22">mdi-database-clock</v-icon>
        </v-list-item-icon>
        <v-list-item-title class="text-caption">{{
          secToTime(roomUser.detail.time)
        }}</v-list-item-title>
      </v-list-item>
      <v-list-item>
        <dialog-user-detail />
      </v-list-item>
    </v-list>
  </v-menu>
</template>

<script>
export default {
  props: {
    size: {
      type: Number,
      default: null,
    },
    roomUser: {
      type: Object,
      default: null,
    },
  },
  methods: {
    secToTime(rawsec) {
      const min = String(Math.trunc(rawsec / 60) % 60).padStart(2, 0)
      const hour = String(Math.trunc(rawsec / 3600)).padStart(2, 0)
      const time = hour + '時間' + min + '分'
      return time
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
