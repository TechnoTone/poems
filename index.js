import { Elm } from './src/Main.elm'

var app = Elm.Main.init({
  node: document.querySelector('main')
})

app.ports.setTitle.subscribe(function (title) {
  document.title = title
  document.head.querySelector('meta[property="og:title"]').setAttribute('content', title)
})

app.ports.setDescription.subscribe(function (description) {
  document.head.querySelector('meta[name="description"]').setAttribute('content', description)
  document.head.querySelector('meta[property="og:description"]').setAttribute('content', description)
})

app.ports.resetTitleAndDescription.subscribe(function () {
  document.title = 'Poems by Tony Hunt'
  document.head.querySelector('meta[property="og:title"]').setAttribute('content', 'Poems by Tony Hunt')
  document.head.querySelector('meta[name="description"]').setAttribute('content', 'A collection of poems by Tony Hunt')
  document.head.querySelector('meta[property="og:description"]').setAttribute('content', 'A collection of poems by Tony Hunt')
})