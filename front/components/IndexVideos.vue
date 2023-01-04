<template>
  <div>
    再生リスト
  </div>
</template>

<script>
export default {
  props: {
    // id: {
    //   type: Number,
    //   default: null
    // }
  },
  methods: {
    send() {
      this.$emit("my-click", this.name, this.id)
    }
  }
}
</script>
