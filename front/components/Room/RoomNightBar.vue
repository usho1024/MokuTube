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
    <UserAvatar :x="x" :y="y" :size="size"></UserAvatar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      image: 'night_bar',
      x: 0,
      y: 0,
      size: 80,
      coords: [
        '265,500,345,504,354,708,257,708,261,649',
        '370,550,450,556,459,760,362,760,366,701',
        '477,597,556,597,564,801,469,801,477,599',
        '583,650,662,650,670,854,575,854,583,652',
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
  transform: scale(0.8) translate(100px, 100px);
}
</style>
