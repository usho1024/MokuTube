<template>
  <div class="room">
    <img :src="require(`~/assets/img/${image}.svg`)" usemap="#ImageMap" />
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
    <user-avatar
      :x="x"
      :y="y"
      :size="size"
    />
  </div>
</template>

<script>
export default {
  data() {
    return {
      image: 'rest-area',
      x: 0,
      y: 0,
      size: 50,
      coords: [
        '195,561,182,536,221,519,278,617,224,649,188,636,182,540',
        '356,655,428,638,429,727,386,753,337,720,343,698',
        '548,370,588,355,662,396,661,422,603,465,577,445,462,428',
        '513,438,577,444,604,467,551,499,549,556,423,481,422,423',
        '617,485,603,464,548,499,548,555,663,622,743,579,741,517,726,507,701,519,601,463',
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
  transform: scale(0.9) translate(80px, 100px);
}
</style>
