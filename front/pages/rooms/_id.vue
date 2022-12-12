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
            class="overflow-y-auto grey lighten-5 text-caption font-weight-medium px-2"
            max-height=70%
          >
            <template
              v-for="(message, i) in messages"
            >
              <v-list-item
                :key="`message-${i}`"
                class="py-1"
              >
                <v-row
                  no-gutters
                >
                  <v-col
                    cols="1"
                    align-self="start"
                  >
                    <v-avatar
                      size="35px"
                    >
                      <v-img :src="sampleAvatar"></v-img>
                    </v-avatar>
                  </v-col>
                  <v-col
                    cols="11"
                    align-self="start"
                  >
                    <div
                      class="ml-3"
                    >
                      <span
                        class="grey--text text--darken-1 mr-2"
                      >
                        {{ message.name }}
                      </span>
                      <span
                        class="grey--text text--darken-4"
                      >
                        {{ message.body }}
                      </span>
                    </div>
                  </v-col>
                </v-row>
              </v-list-item>
            </template>
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
      isMuted: true,
      sampleAvatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg'
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

.message {
  line-height: 18px;
}
</style>
