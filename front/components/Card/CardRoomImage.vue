<template>
  <v-card outlined :ripple="false" class="rounded-0" @click="send">
    <v-img
      :src="require(`~/assets/img/room/thumb/${imageName}.png`)"
      height="120"
    />

    <v-divider />

    <v-list-item dense>
      <v-list-item-content>
        <v-list-item-title class="text-truncate">
          {{ name }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
    <v-list-item dense>
      <v-list-item-content>
        <v-list-item-title class="text-truncate">
          席数：{{ numberOfSeats }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </v-card>
</template>

<script>
export default {
  props: {
    id: {
      type: Number,
      default: null,
    },
    name: {
      type: String,
      default: null,
    },
    imageName: {
      type: String,
      default: null,
    },
    numberOfSeats: {
      type: Number,
      default: null,
    },
  },
  methods: {
    send() {
      this.$emit('setImage', this.id, this.name)
    },
  },
}
</script>
