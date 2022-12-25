<template>
  <div>
    <h2>
      Roomsテーブルの取得
    </h2>
    <table v-if="rooms.length">
      <thead>
        <tr>
          <th>id</th>
          <th>name</th>
          <th>email</th>
          <th>created_at</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(room, i) in rooms"
          :key="`room-${i}`"
        >
          <td>{{ room.id }}</td>
          <td>{{ room.name }}</td>
          <td>{{ room.email }}</td>
          <td>{{ dateFormat(room.created_at) }}</td>
        </tr>
      </tbody>
    </table>

    <div v-else>
      ルームが取得できませんでした
    </div>
  </div>
</template>

<script>
export default {
  name: 'Rooms',
  async asyncData ({ $axios }) {
    let rooms = []
    await $axios.$get('/api/v1/rooms')
      .then(response => (rooms = response))
    return { rooms }
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
