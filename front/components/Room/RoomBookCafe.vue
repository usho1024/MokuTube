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
      image: 'book-cafe',
      x: 0,
      y: 0,
      size: 50,
      coords: [
        '75,351,132,343,171,367,170,394,68,454,29,432,30,401',
        '216,431,210,425,145,465,144,516,195,545,314,474,315,419,268,392,211,425',
        '335,517,304,550,303,605,352,634,379,619,378,519',
        '472,573,467,571,404,608,403,662,454,692,575,620,574,561,527,535,463,573',
        '627,654,687,622,733,649,732,706,611,777,562,747,563,694',
        '650,340,640,309,593,335,593,393,715,465,746,449,746,371,639,308',
        '835,450,827,418,950,492,950,544,900,574,779,502,780,445,828,417',
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
  transform: scale(0.9) translate(80px, 90px);
}
</style>
