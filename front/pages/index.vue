<template>
  <div>
    <h2>
      Messageテーブルの取得
    </h2>
    <table v-if="messages.length">
      <thead>
        <tr>
          <th>id</th>
          <th>投稿者</th>
          <th>body</th>
          <th>created_at</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(message, i) in messages"
          :key="`message-${i}`"
        >
          <td>{{ message.id }}</td>
          <td>{{ message.name }}</td>
          <td>{{ message.body }}</td>
          <td>{{ dateFormat(message.created_at) }}</td>
        </tr>
      </tbody>
    </table>

    <div v-else>
      メッセージが取得できませんでした
    </div>
  </div>
</template>

<script>
export default {
  auth: false,
  async asyncData ({ $axios }) {
    let messages = []
    await $axios.$get('/api/v1/messages')
      .then(response => (messages = response))
    return { messages }
  },
  computed: {
    dateFormat () {
      return (date) => {
        const dateTimeFormat = new Intl.DateTimeFormat(
          'ja', { dateStyle: 'medium', timeStyle: 'short' }
        )
        return dateTimeFormat.format(new Date(date))
      }
    }
  }
}
</script>
