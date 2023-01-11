<template>
  <div>
    <div class="mb-5 font-weight-bold text-body-1">
      <span class="mr-5">StayTime:</span>
      <span class="mr-10">{{ formatTime }}</span>
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
    formatTime() {
      return this.$SecToTime(this.sec)
    },
  },
  mounted() {
    this.start()
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
  },
}
</script>
