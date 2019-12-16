// the replaceElement function is a generic function
// it enables to replace an html element in the DOM
// we define the function and we export it to make it available elsewhere

function replaceElement(element ,innerHTML) {
const tag = document.querySelector(element)
tag.innerHTML = innerHTML
}

export {replaceElement}
