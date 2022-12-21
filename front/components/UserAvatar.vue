<template>
  <v-avatar
    class="avatar"
    :size="size"
    :style="{
      transform: `translate(${x}px, ${y}px)`,
    }"
  >
    <v-img :src="currentUser.avatar.thumb.url"/>
  </v-avatar>
</template>

<script>
export default {
  props: {
    x: {
      type: Number,
      default: 0
    },
    y: {
      type: Number,
      default: 0
    },
    size: {
      type: Number,
      default: 0
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    }
  }
}
</script>

<style lang="scss" scoped>
.avatar {
  position: absolute;
  left: 0;
  top: 0;
}
</style>
