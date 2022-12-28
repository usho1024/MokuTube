<template>
  <v-card
    nuxt
    :to="`/rooms/${roomId}`"
  >
    <v-img
      :src="require(`~/assets/img/room/${roomImage}.svg`)"
      height="250px"
      gradient="rgba(0,0,0,0), #FFFFFF"
      class="grey--text text--darken-3 align-end"
    >
      <v-card-title
        class="font-weight-bold text-truncate py-0"
      >
        {{ roomName }}
      </v-card-title>
      <v-list-item
        dense
      >
        <v-list-item-avatar
          size="30px"
        >
          <v-img
            :src="hostAvatar"
          />
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title
            class="grey--text text--darken-3 text-truncate"
          >
            {{ hostName }}
          </v-list-item-title>
        </v-list-item-content>
        <v-icon
          class="mr-2"
        >
          mdi-account-multiple-check
        </v-icon>
        <span>
          {{ activeUsers }} / {{ numberOfSeats }}
        </span>
      </v-list-item>
    </v-img>
  </v-card>
</template>

<script>
export default {
  props: {
    roomId: {
      type: Number,
      default: null
    },
    roomName: {
      type: String,
      default: null
    },
    roomImage: {
      type: String,
      default: null
    },
    hostName: {
      type: String,
      default: null
    },
    hostAvatar: {
      type: String,
      default: null
    },
    activeUsers: {
      type: Number,
      default: 0
    },
    numberOfSeats: {
      type: Number,
      default: null
    }
  }
}
</script>
