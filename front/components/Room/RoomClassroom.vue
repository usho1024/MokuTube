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
    <avatar-room-user
      v-for="(roomUser, i) in roomUsers"
      :key="`roomUser-${i}`"
      :size="size"
      :x="roomUser.x_coord"
      :y="roomUser.y_coord"
      :user="roomUser.detail"
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
      size: 35,
      seats: [
        { x: 337, y: 234 },
        { x: 403, y: 272 },
        { x: 467, y: 310 },
        { x: 337, y: 234 },
        { x: 265, y: 276 },
        { x: 331, y: 314 },
        { x: 395, y: 352 },
        { x: 193, y: 318 },
        { x: 259, y: 356 },
        { x: 323, y: 394 },
        { x: 83, y: 228 },
      ],
    }
  },
  methods: {
    getSeat(e) {
      const seatNum = Number(e.target.getAttribute('id').slice(5))
      const { x, y } = this.seats[seatNum]
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
  width: 604px;
  height: 500px;
  background: url(~/assets/img/room/classroom.svg);
  transform-origin: top left;
  transform: scale(1.6) translate(20px, 20px);
}

.seats {
  background-color: rgba(255, 255, 255, 0.3);
  position: absolute;
  left: 0;
  top: 0;
  cursor: pointer;
  &:hover {
    background-color: rgba(255, 0, 255, 0.3);
  }
}
</style>
