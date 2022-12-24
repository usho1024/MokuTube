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
      :avatar="roomUser.avatar"
    />
  </div>
</template>

<script>
export default {
  props: {
    roomChannel: {
      type: Object,
      default: null
    }
  },
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
  computed: {
    roomUsers() {
      return this.$store.state.roomUsers
    },
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
  transform: scale(0.9) translate(80px, 60px);
}
</style>
