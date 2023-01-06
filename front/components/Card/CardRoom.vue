<template>
  <v-card
    nuxt
    :to="`/rooms/${roomId}`"
    rounded="lg"
    elevation="5"
  >
    <v-img
      :src="require(`~/assets/img/room/thumb/${roomImage}.png`)"
      height=150
    />

    <v-divider/>

    <v-list>
      <v-list-item
        dense
      >
        <v-list-item-content>
          <v-list-item-title
            class="text-truncate"
          >
            {{ roomName }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-list-item
        dense
      >
        <v-list-item-avatar
          size=30
        >
          <v-img
            :src="hostAvatar"
          />
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title
            class="grey--text text--darken-2 text-truncate"
          >
            {{ hostName }}
          </v-list-item-title>
        </v-list-item-content>
        <v-icon
          class="mr-3"
        >
          mdi-account-multiple-check
        </v-icon>
        <span>
          {{ activeUsers }} / {{ numberOfSeats }}
        </span>
      </v-list-item>
    </v-list>
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
