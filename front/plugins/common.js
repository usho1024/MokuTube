export default ({ app }, inject) => {
  inject('SecToTime', (rawsec) => {
    const sec = String(rawsec % 60).padStart(2, 0)
    const min = String(Math.trunc(rawsec / 60) % 60).padStart(2, 0)
    const hour = String(Math.trunc(rawsec / 3600)).padStart(2, 0)
    const time = hour + ':' + min + ':' + sec
    return time
  })
}
