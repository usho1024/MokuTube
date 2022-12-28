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
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      image: 'lounge',
      x: 0,
      y: 0,
      size: 40,
      coords: [
        '501,209,538,211,538,312,501,312',
        '456,235,495,238,495,339,458,339',
        '412,260,451,263,451,364,414,364',
        '368,286,407,289,407,390,370,390',
        '323,311,363,314,363,415,326,415',
        '278,337,318,340,318,441,281,441',
        '179,332,218,334,218,435,181,435',
        '135,307,174,310,174,411,137,411',
        '549,326,573,303,617,361,568,406,529,384,530,326,573,305',
        '424,398,448,375,492,433,443,478,404,456,405,398,448,377',
        '298,472,322,449,366,507,317,552,278,530,279,472,322,451',
        '727,431,751,408,795,466,746,511,707,489,708,431,751,410',
        '601,503,625,480,669,538,620,583,581,561,582,503,625,482',
        '475,577,499,554,543,612,494,657,455,635,456,577,499,556',
        '677,401,658,431,658,461,702,484,703,432,740,410,740,401',
        '552,473,533,503,533,533,577,556,578,504,615,482,615,473',
        '426,547,407,577,407,607,451,630,452,578,489,556,489,547',
        '859,510,837,537,836,568,877,591,924,561,924,509',
        '733,582,711,609,710,640,751,663,798,633,798,581',
        '607,655,585,682,584,713,625,736,672,706,672,654',
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
  transform: scale(0.9) translate(80px, 120px);
}
</style>
