<template>
  <v-footer padless dark color="blue accent-2" class="text-right text-caption">
    <v-container>
      <span class="mr-16">© {{ new Date().getFullYear() }} - MokuTube</span>
      <span>
        お問い合わせは開発者TwitterのDMまで！ ➡➡
        <v-btn
          small
          text
          href="https://twitter.com/takasho1024"
          target="_blank"
          rel="noopener noreferrer"
          class="text-lowercase font-weight-bold"
        >
          @takasho1024
          <v-icon class="ml-1">mdi-twitter</v-icon>
        </v-btn>
      </span>
    </v-container>
  </v-footer>
</template>
