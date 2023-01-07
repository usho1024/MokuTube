<template>
  <v-card nuxt :to="`/rooms/${roomId}`">
    <v-row no-gutters>
      <v-col cols="2">
        <v-img
          :src="require(`~/assets/img/room/thumb/${roomImage}.png`)"
          height="80"
        />
      </v-col>

      <v-divider vertical />

      <v-col cols="10">
        <v-list-item dense>
          <v-list-item-content>
            <v-list-item-title class="text-truncate font-weight-bold">
              {{ roomName }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item dense>
          <v-list-item-avatar size="24" class="mr-0 mr-2">
            <v-img :src="hostAvatar" />
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="grey--text text--darken-2 text-truncate">
              {{ hostName }}
            </v-list-item-title>
          </v-list-item-content>
          <v-icon class="mr-3"> mdi-account-multiple-check </v-icon>
          <span> {{ activeUsers }} / {{ numberOfSeats }} </span>
        </v-list-item>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props: {
    roomId: {
      type: Number,
      default: null,
    },
    roomName: {
      type: String,
      default: null,
    },
    roomImage: {
      type: String,
      default: null,
    },
    hostName: {
      type: String,
      default: null,
    },
    hostAvatar: {
      type: String,
      default: null,
    },
    activeUsers: {
      type: Number,
      default: 0,
    },
    numberOfSeats: {
      type: Number,
      default: null,
    },
  },
}
</script>
