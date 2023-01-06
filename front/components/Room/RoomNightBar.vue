<template>
  <div class="room">
    <v-avatar
      v-for="(seat, i) in seats"
      :id="`seat-${i}`"
      :key="`seat-${i}`"
      class="seats"
      :size="size"
      :style="{ transform: `translate(${seat.x}px, ${seat.y}px)` }"
      @click.prevent="getSeat"
    />
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
      size: 40,
      seats: [
        {x: 133, y: 250},
        {x: 185, y: 274},
        {x: 239, y: 298},
        {x: 291, y: 322}
      ]
    }
  },
  methods: {
    getSeat(e) {
      const seatNum = Number(e.target.getAttribute('id').slice(5))
      const {x, y} = this.seats[seatNum]
      this.roomChannel.perform('get_seat', {
        seat_number: seatNum,
        x_coord: x,
        y_coord: y,
      })
    },
  },
}
</script>

<style lang="scss" scoped>
.room {
  width: 499px;
  height: 500px;
  background: url(~/assets/img/room/night-bar.svg);
  transform-origin: top left;
  transform: scale(1.6) translate(30px, 20px);
}

.seats {
  background-color: rgba(255,255,255,0.3);
  position: absolute;
  left: 0;
  top: 0;
  cursor: pointer;
  &:hover {
    background-color: rgba(255,0,255,0.3);
  }
}
</style>
