<template>
  <v-container fluid class="pa-0">
    <app-bar-room :room-channel="roomChannel" :name="room.name" />
    <v-row no-gutters>
      <v-col cols="9">
        <div
          :is="`room-${room.image.name}`"
          :room-channel="roomChannel"
          :room-users="roomUsers"
        />
        <youtube
          ref="youtube"
          :video-id="room.bgm_resource"
          width="0"
          height="0"
          @playing="playing"
          @ended="ended"
        />
      </v-col>
      <v-col cols="3">
        <v-card rounded="lg" class="sidebar">
          <v-toolbar dense flat>
            <v-toolbar-title class="text-caption">
              トップチャット
            </v-toolbar-title>
          </v-toolbar>

          <v-divider />

          <v-sheet
            id="chat-list"
            class="overflow-y-auto grey lighten-5 text-caption font-weight-medium pt-4"
            height="70%"
          >
            <list-message
              v-for="(message, i) in chatMessages"
              :key="`message-${i}`"
              :message="message"
            />
          </v-sheet>

          <v-divider />

          <v-sheet class="pa-4" height="30%">
            <v-form v-model="valid" class="mb-2" @submit.prevent="speak">
              <v-text-field
                v-model="inputMessage"
                :rules="messageRules"
                type="text"
                label="メッセージを入力する"
                counter="200"
                dense
                append-icon="mdi-send"
                @click:append="speak"
              />
            </v-form>

            <v-row no-gutters class="mb-3">
              <v-col cols="1">
                <v-tooltip top>
                  <template #activator="{ on }">
                    <v-icon class="mt-1" v-on="on" @click="toggle">
                      {{ isMuted ? 'mdi-volume-off' : 'mdi-volume-high' }}
                    </v-icon>
                  </template>
                  <span>クリックでミュートの切り替え</span>
                </v-tooltip>
              </v-col>

              <v-col cols="11">
                <v-slider v-model="media" thumb-label dense />
              </v-col>
            </v-row>

            <stay-time-clock />
          </v-sheet>
        </v-card>
      </v-col>
    </v-row>
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
  name: 'RoomsShow',
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
    RoomSmallOffice,
  },
  layout: 'room',
  async asyncData({ $axios, route }) {
    const chatMessages = []
    let roomUsers, room
    await $axios
      .$get('/api/v1/messages', {
        params: {
          id: route.params.id,
        },
      })
      .then((response) => chatMessages.push(...response.reverse()))
    await $axios
      .$get('/api/v1/rooms_users', {
        params: {
          id: route.params.id,
        },
      })
      .then((response) => (roomUsers = response))
    await $axios
      .$get(`/api/v1/rooms/${route.params.id}`)
      .then((response) => (room = response))
    return { chatMessages, roomUsers, room }
  },
  data() {
    return {
      roomChannel: null,
      media: 15,
      isMuted: true,
      inputMessage: '',
      valid: false,
      messageRules: [(v) => v.length <= 200 || ''],
    }
  },
  head() {
    return {
      title: this.room.name,
    }
  },
  computed: {
    player() {
      return this.$refs.youtube.player
    },
    currentUser() {
      return this.$store.state.currentUser
    },
    getWebSocketURL() {
      const uid = window.localStorage.getItem('uid')
      const token = window.localStorage.getItem('access-token')
      const client = window.localStorage.getItem('client')
      return `ws://localhost:3000/cable?uid=${uid}&token=${token}&client=${client}`
    },
  },
  watch: {
    media(newVal) {
      this.setVolume(newVal)
    },
  },
  created() {
    this.cable = ActionCable.createConsumer(this.getWebSocketURL)
    this.roomChannel = this.cable.subscriptions.create(
      {
        channel: 'RoomChannel',
        room: this.room.id,
      },
      {
        received: ({ type, body }) => {
          switch (type) {
            case 'speak':
              this.chatMessages.push(body)
              this.$nextTick(() => {
                this.scrollToBottom()
              })
              break
            case 'getSeat':
              this.roomUsers = body
              break
          }
        },
      }
    )
  },
  mounted() {
    this.playVideo()
    this.mute()
    this.scrollToBottom()
  },
  destroyed() {
    this.cable.disconnect()
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
      if (this.inputMessage && this.valid) {
        this.roomChannel.perform('speak', {
          message: this.inputMessage,
        })
        this.inputMessage = ''
      }
    },
  },
}
</script>

<style lang="scss" scoped>
.v-main__wrap {
  height: calc(100vh - 48px);
}

.sidebar {
  height: calc(100vh - 176px);
}

.message {
  line-height: 18px;
}
</style>
