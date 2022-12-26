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
  },
  data() {
    return {
      image: 'small-office',
      x: 0,
      y: 0,
      size: 70,
      coords: [
        '289,592,391,659,386,751,286,742,267,573',
        '563,449,606,418,657,451,646,555,543,490',
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
  transform: scale(0.8) translate(100px, 60px);
}
</style>
