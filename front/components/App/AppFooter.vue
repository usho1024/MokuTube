<template>
  <v-footer padless dark color="blue accent-2" class="text-right text-caption">
    <v-container>
      <span class="mr-10">
        お問い合わせは開発者TwitterのDMまで！ ➡➡
        <v-btn
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
      <v-btn text nuxt to="/terms" class="mr-5">利用規約</v-btn>
      <v-btn text nuxt to="/privacy_policy" class="mr-5"
        >プライバシーポリシー</v-btn
      >
      <span>© {{ new Date().getFullYear() }} - MokuTube</span>
    </v-container>
  </v-footer>
</template>
