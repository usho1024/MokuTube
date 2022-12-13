<template>
  <div class="room">
    <img :src="require(`~/assets/img/room/${image}.svg`)" usemap="#ImageMap" />
    <map name="ImageMap" @click.prevent="getSeat">
      <area
        v-for="(coord, i) in coords"
        :id="`seat-${i}`"
        :key="`seat-${i}`"
        shape="poly"
        :coords="coord"
        href=""
      />
    </map>
    <user-avatar :x="x" :y="y" :size="size" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      image: 'large-office',
      x: 0,
      y: 0,
      size: 50,
      coords: [
        '327,435,348,413,388,462,386,472,345,497,316,481,316,433,348,413',
        '471,353,492,331,532,380,530,390,489,415,460,399,460,351,492,331',
        '633,505,691,493,690,594,615,595,616,539',
        '524,560,582,548,581,649,506,650,507,594',
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
  transform: scale(0.9) translate(80px, 70px);
}
</style>
