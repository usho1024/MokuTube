<template>
  <v-avatar
    class="avatar"
    :size="size"
    :style="{
      transform: `translate(${x}px, ${y}px)`,
    }"
  >
    <v-img :src="avatar"/>
  </v-avatar>
</template>

<script>
export default {
  props: {
    size: {
      type: Number,
      default: 0
    },
    x: {
      type: Number,
      default: 0
    },
    y: {
      type: Number,
      default: 0
    },
    avatar: {
      type: String,
      default: ''
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
