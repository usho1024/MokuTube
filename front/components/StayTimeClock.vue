<template>
  <div>
    <div class="mb-5 font-weight-bold text-body-1 grey--text text--darken-1">
      <span class="mr-5">StayTime:</span>
      <span class="mr-10">{{ stayTime }}</span>
      <v-btn v-show="timerOn" width="100" class="error mr-3" @click="stop"
        >一時停止</v-btn
      >
      <v-btn v-show="!timerOn" width="100" class="primary mr-3" @click="start"
        >再開</v-btn
      >
      <v-tooltip top>
        <template #activator="{ on }">
          <v-icon color="grey darken-1" dark v-on="on">
            mdi-information
          </v-icon>
        </template>
        <span>退室後、StayTime分が総利用時間に加算されます</span>
      </v-tooltip>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sec: 0,
      timerOn: false,
      timerObj: null,
    }
  },
  computed: {
    stayTime() {
      return this.secToTime(this.sec)
    },
    currentUser() {
      return this.$store.state.currentUser
    },
  },
  mounted() {
    this.start()
  },
  destroyed() {
    this.addStayTime()
  },
  methods: {
    countUp() {
      this.sec += 1
    },
    start() {
      this.timerOn = true
      this.timerObj = setInterval(() => {
        this.countUp()
      }, 1000)
    },
    stop() {
      this.timerOn = false
      clearInterval(this.timerObj)
    },
    secToTime(rawsec) {
      const sec = String(rawsec % 60).padStart(2, 0)
      const min = String(Math.trunc(rawsec / 60) % 60).padStart(2, 0)
      const hour = String(Math.trunc(rawsec / 3600)).padStart(2, 0)
      const time = hour + ':' + min + ':' + sec
      return time
    },
    addStayTime() {
      const params = { stay_time: this.sec }
      this.$axios.patch(`/api/v1/users/${this.currentUser.id}`, params)
    },
  },
}
</script>
