export default {
  env: {
    WS_URL: process.env.WS_URL || 'ws://localhost',
    API_KEY: process.env.API_KEY || '',
  },

  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'NowLoading',
    titleTemplate: '%s - MokuTube',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.svg' }],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: ['~/assets/sass/main.scss'],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    'plugins/axios',
    'plugins/vue-youtube',
    'plugins/persistedState.client',
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    '@nuxtjs/vuetify',
    '@nuxtjs/moment',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    '@nuxtjs/i18n',
  ],

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  // TODO httpsに修正
  axios: {
    baseURL:
      process.env.NODE_ENV === 'production'
        ? 'http://api.mokutube.net'
        : 'http://localhost',
    // credentials: true（デフォルト：false）がないと本番環境でCORSエラーが出る
    // 開発環境はCORS制限が緩いためなくてもCORSエラーは出ないとのこと
    credentials: true,
  },

  auth: {
    redirect: {
      login: '/login',
      logout: '/',
      callback: false,
      home: '/rooms',
    },
    strategies: {
      local: {
        endpoints: {
          login: {
            url: 'api/v1/auth/sign_in',
            method: 'post',
            propertyName: 'token',
          },
          logout: {
            url: '/api/v1/auth/sign_out',
            method: 'delete',
          },
          user: false,
        },
      },
    },
  },

  router: {
    middleware: ['auth'],
  },

  vuetify: {
    customVariables: ['~/assets/sass/variables.scss'],
    treeShake: true,
    theme: {
      themes: {
        light: {
          primary: '4080BE',
          info: '4FC1E9',
          success: '44D69E',
          warning: 'FEB65E',
          error: 'FB8678',
          background: 'f6f6f4',
          appblue: '1867C0',
        },
      },
    },
  },

  // Doc: https://nuxt-community.github.io/nuxt-i18n/basic-usage.html#nuxt-link
  i18n: {
    locales: ['ja', 'en'],
    defaultLocale: 'ja',
    // Doc: https://kazupon.github.io/vue-i18n/api/#properties
    // no_prefix => ルート名に__jaを追加しない
    strategy: 'no_prefix',
    vueI18n: {
      fallbackLocale: 'ja',
      // silentTranslationWarn: true,
      silentFallbackWarn: true,
      messages: {
        ja: require('./locales/ja.json'),
        en: require('./locales/en.json'),
      },
    },
  },

  moment: {
    locales: ['ja'],
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},
}
