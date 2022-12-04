<template>
  <div class="main">
    <v-row no-gutters>
      <div :is="`room-${room}`" />
      <youtube
        ref="youtube"
        :video-id="videoId"
      />
      <v-slider
        v-model="media"
      >
        <template #prepend>
          <v-icon
            @click="toggle"
          >
          {{ isMuted ? 'mdi-volume-off' : 'mdi-volume-high' }}
          </v-icon>
        </template>
      </v-slider>
    </v-row>
  </div>
</template>

<script>
import Vue from 'vue'
import VueYoutube from 'vue-youtube'

import RoomBookCafe from '~/components/Room/RoomBookCafe'
import RoomCafe from '~/components/Room/RoomCafe'
import RoomClassroom from '~/components/Room/RoomClassroom'
import RoomKitchen from '~/components/Room/RoomKitchen'
import RoomLargeOffice from '~/components/Room/RoomLargeOffice'
import RoomLounge from '~/components/Room/RoomLounge'
import RoomNightBar from '~/components/Room/RoomNightBar'
import RoomPrivateRoom from '~/components/Room/RoomPrivateRoom'
import RoomRestArea from '~/components/Room/RoomRestArea'
import RoomSmallOffice from '~/components/Room/RoomSmallOffice'

Vue.use(VueYoutube)

export default {
  components: {
    RoomBookCafe,
    RoomCafe,
    RoomClassroom,
    RoomKitchen,
    RoomLargeOffice,
    RoomLounge,
    RoomNightBar,
    RoomPrivateRoom,
    RoomRestArea,
    RoomSmallOffice
  },
  layout: 'logged-in',
  data() {
    return {
      room: 'rest-area',
      videoId: 'uZ0dceZdSK8',
      media: 20,
      isMuted: true
    }
  },
  computed: {
    player() {
      return this.$refs.youtube.player
    }
  },
  watch: {
    media(newVal) {
      this.setVolume(newVal)
    }
  },
  mounted() {
    this.playVideo()
    this.mute()
  },
  methods: {
    playVideo() {
      this.player.playVideo()
    },
    setVolume(val) {
      this.player.setVolume(val)
    },
    mute() {
      this.player.mute()
      this.isMuted = true
    },
    unMute() {
      this.player.unMute()
      this.isMuted = false
    },
    toggle() {
      this.isMuted ? this.unMute() : this.mute()
    }
  }
}
</script>

<style lang="scss" scoped>
.main {
  height: 100%;
  background-color: #b3e5fc;
}
</style>
