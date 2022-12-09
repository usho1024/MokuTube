<template>
  <div>
    <button @click="test">テスト</button>
  </div>
</template>

<script>
import ActionCable from 'actioncable'

export default {
  auth: false,
  created() {
    // 接続を生成（引数は、'ws://[Railsの接続URL]/cable'
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
    // chatチャンネルのサブスクリプションを作成
    this.chatChannel = cable.subscriptions.create(
      { channel: 'ChatChannel', room: 'チャットルーム１' },
      {
        // 配信された時のメソッド
        received(response) {
          console.log(response)
        }
      }
    )
  },
  methods: {
    // 接続確認
    test() {
      this.chatChannel.perform('test')
    }
  }
}
</script>
