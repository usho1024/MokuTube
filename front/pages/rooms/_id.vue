<template>
  <v-sheet
    class="light-blue lighten-4 vh-100"
  >
    <v-row
      no-gutters
    >
      <v-sheet :is="`room-${room}`" />
      <youtube
        ref="youtube"
        :video-id="videoId"
        width=0
        height=0
        @playing="playing"
        @ended="ended"
      />
      <v-col
        cols=3
        class="ml-auto"
      >
        <v-sheet
          elevation="1"
          class="vh-100"
        >
          <v-list
            id="chat-list"
            class="overflow-y-auto"
            dense
            max-height=70%
          >
            <v-list-item
              v-for="(message, i) in messages"
              :key="`message-${i}`"
            >
              <v-list-item-content
              >
                <v-list-item-title
                  class="font-weight-bold grey--text text--darken-1"
                >
                  {{ message.name }}
                </v-list-item-title>
                <v-list-item-action-text
                  class="grey--text text--darken-4"
                >
                  {{ message.body }}
                </v-list-item-action-text>
              </v-list-item-content>
            </v-list-item>
          </v-list>
          <v-divider/>
          <v-sheet
            class="pa-3"
            height=30%
          >
            <v-slider
              v-model="media"
              thumb-label
            >
              <template #prepend>
                <v-icon
                  @click="toggle"
                >
                {{ isMuted ? 'mdi-volume-off' : 'mdi-volume-high' }}
                </v-icon>
              </template>
            </v-slider>
          </v-sheet>
        </v-sheet>
      </v-col>
    </v-row>
  </v-sheet>
</template>

<script>
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
  async asyncData ({ $axios, store }) {
    await $axios.$get('/api/v1/messages')
      .then(response => store.dispatch('getChatMessages', response))
  },
  data() {
    return {
      room: 'rest-area',
      videoId: 'uZ0dceZdSK8',
      media: 5,
      isMuted: true
    }
  },
  computed: {
    messages() {
      return this.$store.state.chatMessages
    },
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
    this.scrollToBottom()
  },
  methods: {
    playVideo() {
      this.player.playVideo()
    },
    loop() {
      this.player.seekTo(0)
    },
    setVolume(int) {
      this.player.setVolume(int)
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
    },
    playing() {
      this.setVolume(5)
    },
    ended() {
      this.loop()
    },
    scrollToBottom() {
      const el = document.getElementById('chat-list')
      el.scrollTo(0, el.scrollHeight)
    }
  }
}
</script>

<style lang="scss" scoped>
.vh-100 {
  height: calc(100vh - 48px);
}
</style>
