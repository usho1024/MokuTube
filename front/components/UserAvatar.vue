<template>
  <v-avatar
    class="avatar"
    color="primary"
    :size="size"
    :style="{
      transform: `translate(${x}px, ${y}px)`,
    }"
  />
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
