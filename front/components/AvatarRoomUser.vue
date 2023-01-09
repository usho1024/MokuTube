<template>
  <v-menu offset-x>
    <template #activator="{ on }">
      <v-btn
        icon
        :width="size"
        :height="size"
        class="avatar"
        :style="{ transform: `translate(${x}px, ${y}px)` }"
        v-on="on"
      >
        <v-avatar :size="size">
          <v-img :src="user.avatar" />
        </v-avatar>
      </v-btn>
    </template>

    <v-card width="200">
      <v-list-item-content class="justify-center">
        <div class="mx-auto text-center">
          <h3 class="text-truncate">{{ user.name }}</h3>
          <v-divider class="my-3"></v-divider>
          <v-btn depressed rounded text>Edit Account</v-btn>
          <v-divider class="my-3"></v-divider>
          <v-btn depressed rounded text>Disconnect</v-btn>
        </div>
      </v-list-item-content>
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
