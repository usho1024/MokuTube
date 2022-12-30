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
      size: 50,
      seats: [{x: 183, y: 200}]
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
  width: 503px;
  height: 500px;
  background: url(~/assets/img/room/private-room.svg);
  transform-origin: top left;
  transform: scale(1.5) translate(50px, 50px);
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
