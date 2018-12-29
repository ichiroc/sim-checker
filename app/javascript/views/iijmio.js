import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const postIIJMioToken = () => {
  const params = anchorToHash(location.hash)
  axios.post('/setting/iijmio_token', params)
}

const anchorToHash = (_anchorText) => {
  const anchorText = _anchorText.replace('#', '')
  const retHash = {}
  anchorText.split('&').forEach( (keyValue) => {
    const [key, value] = keyValue.split('=')
    retHash[key] = value
  })
  return retHash
}

const onDOMContentLoaded = () => {
  if(document.querySelector('.js-iijmio-token') !== null){
    postIIJMioToken()
  }
}
document.addEventListener('DOMContentLoaded', onDOMContentLoaded)
