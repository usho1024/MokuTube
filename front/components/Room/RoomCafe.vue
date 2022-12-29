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
    <user-avatar
      v-for="(roomUser, i) in roomUsers"
      :key="`roomUser-${i}`"
      :size="size"
      :x="roomUser.x_coord"
      :y="roomUser.y_coord"
      :avatar="roomUser.detail.avatar"
    />
  </div>
</template>

<script>
export default {
  props: {
    roomChannel: {
      type: Object,
      default: null,
    },
    roomUsers: {
      type: Array,
      default: null,
    },
  },
  data() {
    return {
      image: 'cafe',
      x: 0,
      y: 0,
      size: 40,
      coords: [
        '572,235,613,238,611,331,573,331',
        '516,263,557,266,555,359,517,359',
        '460,292,501,295,499,388,461,388',
        '403,320,444,323,442,416,404,416',
        '269,405,321,404,321,471,287,487,256,472,256,404',
        '128,487,180,486,180,553,146,569,115,554,115,486',
        '366,452,393,448,418,451,417,540,345,538,345,472',
        '230,482,276,485,276,570,211,568,212,494',
        '341,561,377,549,377,584,393,592,338,616,335,615,335,572',
        '290,589,324,576,325,610,338,618,337,684,315,683,283,665,283,599',
        '448,610,500,610,501,681,462,699,444,688,444,634',
        '390,638,443,638,444,710,405,727,373,709,373,669',
        '608,462,619,445,633,439,689,469,678,476,677,507,645,524,588,494',
        '690,505,679,476,691,468,757,502,756,562,703,589,679,577,680,540,647,524,678,508,679,474',
        '490,516,475,520,460,527,460,588,517,616,518,556,531,549,564,566,571,562,513,533',
        '569,565,564,567,572,560,636,595,636,622,582,649,518,616,518,555,532,548',
      ],
    }
  },
  methods: {
    getSeat(e) {
      const seatNum = Number(e.target.getAttribute('id').slice(5))
      const [x, y] = e.target.getAttribute('coords').split(',').map(Number)
      this.x = x
      this.y = y
      this.roomChannel.perform('get_seat', {
        // work: ,
        seat_number: seatNum,
        x_coord: this.x,
        y_coord: this.y,
      })
    },
  },
}
</script>

<style lang="scss" scoped>
.room {
  transform-origin: top left;
  transform: scale(0.9) translate(80px, 90px);
}
</style>
