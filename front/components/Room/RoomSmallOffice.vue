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
      image: 'small_office',
      x: 0,
      y: 0,
      size: 70,
      coords: [
        '289,592,391,659,386,751,286,742,267,573',
        '563,449,606,418,657,451,646,555,543,490',
      ],
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
  transform: scale(0.9) translate(80px, 80px);
}
</style>
