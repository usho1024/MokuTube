<template>
  <v-row justify="center">
    <v-col
      cols="3"
    >
      <v-form ref="form">
        <v-text-field
          v-model="input_message"
          type="text"
          label="メッセージを入力する"
        />
        <v-btn
          block
          class="primary"
          @click="speak"
        >
          送信
        </v-btn>
      </v-form>
    </v-col>
  </v-row>
</template>

<script>
import ActionCable from 'actioncable'

export default {
  auth: false,
  data() {
    return {
      name: '',
      input_message: '',
    }
  },
  created() {
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
        // TODO 後でroom_idにthis.$route.params.idを代入するようにする
        room_id: 1,
        user_id: 1,
        message: this.input_message
      })
      this.input_message = ''
    }
  }
}
</script>
