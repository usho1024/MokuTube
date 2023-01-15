<template>
  <v-card outlined :ripple="false" class="rounded-0" @click="send">
    <div class="pa-1">
      <v-img
        :src="require(`~/assets/img/room/thumb/${roomImage.imageName}.png`)"
        height="120"
      />
    </div>

    <v-divider />

    <v-list-item dense>
      <v-list-item-content>
        <v-list-item-title class="text-truncate">
          {{ roomImage.name }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
    <v-list-item dense>
      <v-list-item-content>
        <v-list-item-title class="text-truncate">
          席数：{{ roomImage.numberOfSeats }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </v-card>
</template>

<script>
export default {
  props: {
    roomImage: {
      type: Object,
      default: null,
    },
  },
  methods: {
    send() {
      this.$emit('setImage', this.roomImage.id, this.roomImage.name)
    },
  },
}
</script>
