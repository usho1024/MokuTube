<template>
  <v-container
    fluid
    class="pa-0"
  >
    <v-sheet
      class="main pa-10"
    >
      <v-row
        no-gutters
      >
        <v-col
          cols="9"
        >
          <v-sheet :is="`room-${room.type}`" />
          <youtube
            ref="youtube"
            :video-id="videoId"
            width=0
            height=0
            @playing="playing"
            @ended="ended"
          />
        </v-col>
        <v-col
          cols="3"
        >
          <v-card
            rounded="lg"
            class="sidebar"
          >
            <v-toolbar
              dense
              flat
            >
              <v-toolbar-title
                class="text-caption"
              >
                トップチャット
              </v-toolbar-title>
            </v-toolbar>

            <v-divider/>

            <v-sheet
              id="chat-list"
              class="overflow-y-auto grey lighten-5 text-caption font-weight-medium pt-4"
              height=70%
            >
              <template
                v-for="(message, i) in messages"
              >
                <div
                  :key="`message-${i}`"
                  class="px-4 mb-4"
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
                        <v-img :src="message.avatar"/>
                      </v-avatar>
                    </v-col>
                    <v-col
                      cols="11"
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
                </div>
              </template>
            </v-sheet>

            <v-divider/>

            <v-sheet
              class="pa-4"
              height=30%
            >
              <v-form
                class="mb-2"
                @submit.prevent="speak"
              >
                <v-text-field
                  v-model="inputMessage"
                  type="text"
                  label="メッセージを入力する"
                  counter="200"
                  dense
                  append-icon="mdi-send"
                  @click:append="speak"
                />
              </v-form>

              <v-slider
                v-model="media"
                thumb-label
                dense
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
          </v-card>
        </v-col>
      </v-row>
    </v-sheet>
  </v-container>
</template>

<script>
import ActionCable from 'actioncable'

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
  async asyncData ({ $axios, store, route }) {
    await $axios.$get('/api/v1/messages', {
      params: {
        id: route.params.id
      }
    })
      .then(response => store.dispatch('getChatMessages', response))
  },
  data() {
    return {
      room: {
        id: this.$route.params.id,
        type: 'kitchen'
      },
      videoId: 'uZ0dceZdSK8',
      media: 5,
      isMuted: true,
      sampleAvatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
      inputMessage: ''
    }
  },
  computed: {
    messages() {
      return this.$store.state.chatMessages
    },
    player() {
      return this.$refs.youtube.player
    },
    currentUser() {
      return this.$store.state.currentUser
    },
    getWebSocketURL() {
      const id = this.currentUser.id
      return `ws://localhost:3000/cable?id=${id}`
    }
  },
  watch: {
    media(newVal) {
      this.setVolume(newVal)
    }
  },
  created() {
    const cable = ActionCable.createConsumer(this.getWebSocketURL)
    this.roomChannel = cable.subscriptions.create(
      {
        channel: 'RoomChannel',
        room: this.room.id
      },
      {
        received: response => {
          this.$store.dispatch('getChatMessages', response)
          this.$nextTick(() => {
            this.scrollToBottom()
          })
        }
      }
    )
  },
  mounted() {
    this.playVideo()
    this.mute()
    this.scrollToBottom()
  },
  beforeDestroy() {
    alert(`${this.currentUser.name}さん、おつかれさまです🙇‍♂️\n今回のルーム利用時間はn時間でした🎉\nこの調子で頑張りましょう❗️`)
    location.reload()
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
    },
    speak() {
      this.roomChannel.perform('speak', {
        message: this.inputMessage
      })
      this.inputMessage = ''
    },
    getSeat() {
      this.roomChannel.perform('get_seat', {
        // room: ,
        // user: ,
        // work: ,
        // seat_number: ,
        // x_coord: ,
        // y_coord:
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.main {
  height: calc(100vh - 48px);
	background: url(~/assets/img/cloud-pattern.png);
  background-size: 900px 900px;
	animation: bg-loop 80s linear infinite;
}

@keyframes bg-loop {
  100% {
    background-position: 900px 0px;
  }
}

.sidebar {
  height: calc(100vh - 176px);
}

.message {
  line-height: 18px;
}
</style>
