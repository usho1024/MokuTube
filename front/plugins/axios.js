export default ({ $axios, isDev }) => {
  $axios.onRequest((config) => {
    config.headers.client = localStorage.getItem('client')
    config.headers['access-token'] = localStorage.getItem('access-token')
    config.headers.uid = localStorage.getItem('uid')
    config.headers['token-type'] = localStorage.getItem('token-type')
    if (isDev) {
      console.log(config)
    }
  })

  $axios.onResponse((response) => {
    if (response.headers.client) {
      localStorage.setItem('access-token', response.headers['access-token'])
      localStorage.setItem('client', response.headers.client)
      localStorage.setItem('uid', response.headers.uid)
      localStorage.setItem('token-type', response.headers['token-type'])
    }
    if (isDev) {
      console.log(response)
    }
  })

  $axios.onError((e) => {
    console.log(e.response)
  })
}
