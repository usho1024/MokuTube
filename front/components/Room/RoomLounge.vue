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
        {x: 323, y: 132},
        {x: 294, y: 148},
        {x: 265, y: 164},
        {x: 237, y: 181},
        {x: 209, y: 198},
        {x: 180, y: 214},
        {x: 114, y: 210},
        {x: 86, y: 194},
        {x: 357, y: 210},
        {x: 435, y: 258},
        {x: 275, y: 256},
        {x: 353, y: 304},
        {x: 193, y: 304},
        {x: 271, y: 352},
        {x: 473, y: 278},
        {x: 551, y: 326},
        {x: 391, y: 324},
        {x: 469, y: 372},
        {x: 309, y: 372},
        {x: 387, y: 420},
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
  width: 648px;
  height: 500px;
  background: url(~/assets/img/room/lounge.svg);
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
