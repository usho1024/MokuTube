<template>
  <v-avatar
    class="avatar"
    color="primary"
    :size="size"
    :style="{
      transform: `translate(${x}px, ${y}px)`,
    }"
  ></v-avatar>
</template>

<script>
export default {
  props: {
    x: { type: Number },
    y: { type: Number },
    size: { type: Number },
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
