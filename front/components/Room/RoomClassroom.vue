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
      image: 'classroom',
      x: 0,
      y: 0,
      size: 50,
      coords: [
        '565,395,620,393,619,450,582,486,555,470,553,433',
        '674,459,729,457,728,514,691,550,664,534,662,497',
        '781,519,836,517,835,574,798,610,771,594,769,557',
        '444,463,499,461,498,518,461,554,434,538,432,501',
        '552,526,607,524,606,581,569,617,542,601,540,564',
        '660,588,715,586,714,643,677,679,650,663,648,626',
        '326,533,381,531,380,588,343,624,316,608,314,571',
        '434,597,489,595,488,652,451,688,424,672,422,635',
        '542,658,597,656,596,713,559,749,532,733,530,696',
        '142,385,163,351,204,419,132,461,134,367,163,352',
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
