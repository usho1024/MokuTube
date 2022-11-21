<template>
  <div class="room">
    <img :src="require(`~/assets/img/${image}.svg`)" usemap="#ImageMap" />
    <map name="ImageMap" @click.prevent="getSeat">
      <area
        v-for="(coord, i) in coords"
        :id="`seat-${i + 1}`"
        :key="`seat-${i + 1}`"
        shape="poly"
        :coords="coord"
        href=""
      />
    </map>
    <UserAvatar :x="x" :y="y" :size="size"></UserAvatar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      image: 'private_room',
      x: 0,
      y: 0,
      size: 80,
      coords: ['383,413,352,382,355,563,488,565,488,471,407,407,350,380'],
    }
  },
  methods: {
    getSeat(e) {
      const seatNum = Number(e.target.getAttribute('id').slice(5))
      const [x, y] = e.target.getAttribute('coords').split(',').map(Number)
      this.x = x
      this.y = y
      console.log(seatNum)
      console.log(this.x)
      console.log(this.y)
    },
  },
}
</script>

<style lang="scss" scoped>
.room {
  transform-origin: top left;
  transform: scale(0.8) translate(100px, 100px);
}
</style>
