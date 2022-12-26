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
      image: 'kitchen',
      x: 0,
      y: 0,
      size: 60,
      coords: [
        '258,403,317,374,315,452,255,485,254,407',
        '160,459,219,430,217,508,157,541,156,463',
        '403,501,478,480,478,611,391,612,391,546',
        '307,556,382,535,382,666,295,667,295,601',
        '733,569,794,569,797,613,788,686,763,700,738,686,729,614',
        '799,532,860,532,863,576,854,649,829,663,804,649,795,577',
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
  transform: scale(0.9) translate(80px, 40px);
}
</style>
