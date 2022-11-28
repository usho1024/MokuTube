<template>
  <div class="main">
    <div :is="`room-${room}`"/>
    <v-btn
      class="mr-4 warning white--text"
      @click="$auth.logout()"
    >
      ログアウト
    </v-btn>
    {{ $store.state.currentUser.email }}
  </div>
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
  data() {
    return {
      room: 'private-room'
    }
  }
}
</script>

<style lang="scss" scoped>
.main {
  height: 100vh;
  background-color: #b3e5fc;
}
</style>
