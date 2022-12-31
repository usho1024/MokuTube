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
      size: 30,
      seats: [
        {x: 366, y: 148},
        {x: 330, y: 166},
        {x: 294, y: 186},
        {x: 256, y: 204},
        {x: 170, y: 254},
        {x: 232, y: 286},
        {x: 78, y: 308},
        {x: 142, y: 308},
        {x: 186, y: 378},
        {x: 218, y: 362},
        {x: 248, y: 408},
        {x: 284, y: 390},
        {x: 316, y: 330},
        {x: 370, y: 360},
        {x: 388, y: 296},
        {x: 442, y: 322},
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
  width: 642px;
  height: 500px;
  background: url(~/assets/img/room/cafe.svg);
  transform-origin: top left;
  transform: scale(1.6) translate(20px, 20px);
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
