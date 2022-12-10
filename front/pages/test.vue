<template>
  <div>
    <v-row>
      <v-col
        cols="6"
      >
        <!-- メッセージ一覧 -->
        <div
          v-for="(message, i) in messages"
          :key="`message-${i}`"
        >
          {{ message.name }}：  {{ message.message }}
          <small>{{ message.spoke_at }}</small>
        </div>
      </v-col>
      <v-col
        cols="6"
      >
        <!-- 入力 -->
        <v-row justify="center">
          <v-col
            cols="6"
          >
            <h2>名前</h2>
              <v-text-field
                v-model="name"
                type="text"
              />
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-col
            cols="6"
          >
            <h2>内容</h2>
              <v-text-field
                v-model="input_message"
                type="text"
              />
              <v-btn
                class="primary"
                block
                @click="speak">
                投稿
              </v-btn>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import ActionCable from 'actioncable'

export default {
  auth: false,
  data() {
    return {
      name: '',
      input_message: '',
      messages: []
    }
  },
  created() {
    const messages = this.messages
    // 接続を生成（引数は、'ws://[Railsの接続URL]/cable'
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
    // chatチャンネルのサブスクリプションを作成
    this.chatChannel = cable.subscriptions.create(
      // TODO 後でroomにthis.$route.params.idを代入してルーム毎にチャットを別けるようにする
      { channel: 'ChatChannel', room: 'チャットルーム１' },
      {
        received({ type, body }) {
          switch (type) {
            case 'speak':
              messages.push(body)
              break
          }
        }
      }
    )
  },
  methods: {
    // performの第二引数でサーバー側の関数の引数を設定できる
    speak() {
      this.chatChannel.perform('speak', {
        name: this.name,
        message: this.input_message,
      })
      this.input_message = ''
    }
  }
}
</script>
