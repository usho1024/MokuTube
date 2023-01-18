<template>
  <v-card @click="goToRoom">
    <v-row no-gutters>
      <v-col cols="2">
        <div class="pa-1">
          <v-img
            :src="require(`~/assets/img/room/thumb/${room.image.name}.png`)"
            height="88"
          />
        </div>
      </v-col>

      <v-divider vertical />

      <v-col cols="10">
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="text-truncate text-body-1">
              {{ room.name }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item class="grey--text text--darken-2">
          <v-list-item-avatar size="30" class="mr-0 mr-2">
            <v-img :src="room.host.avatar" />
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="grey--text text--darken-2">
              {{ room.host.name }}
            </v-list-item-title>
          </v-list-item-content>
          <div class="ml-6 mr-3">
            <v-row justify="end">
              <span class="mr-5">{{ dateFormat(room.created_at) }}</span>
              <div v-if="room.active_users === room.image.number_of_seats">
                <v-icon color="red" class="mr-2"
                  >mdi-account-multiple-check</v-icon
                >
                <span class="red--text">
                  {{ room.active_users }} / {{ room.image.number_of_seats }}
                </span>
              </div>
              <div v-else>
                <v-icon class="mr-2">mdi-account-multiple-check</v-icon>
                <span>
                  {{ room.active_users }} / {{ room.image.number_of_seats }}
                </span>
              </div>
            </v-row>
          </div>
        </v-list-item>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
import moment from 'moment'

export default {
  props: {
    room: {
      type: Object,
      default: null,
    },
  },
  methods: {
    dateFormat(date) {
      return moment(date).fromNow()
    },
    goToRoom() {
      if (this.room.active_users === this.room.image.number_of_seats) {
        alert(
          '只今満室のため一時的に入室できません。\n恐れ入りますが他のルームをご利用ください。'
        )
      } else {
        this.$router.push(`/rooms/${this.room.id}`)
      }
    },
  },
}
</script>
