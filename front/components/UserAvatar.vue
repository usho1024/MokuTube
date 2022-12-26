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
      default: null
    },
    x: {
      type: Number,
      default: null
    },
    y: {
      type: Number,
      default: null
    },
    avatar: {
      type: String,
      default: null
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
