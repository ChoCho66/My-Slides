window.RevealMyrevealjs = function () {
  return {
    id: "RevealMyrevealjs",
    init: function (deck) {
      fontsizechange(deck)
    },
  };
};

function updateFontSize(delta) {
  const fontSizeRegexp = /^(?<size>\d+)(?<unit>\D*)$/, // the beauty of named capturing groups 😍
    fontSize = getComputedStyle(Reveal.getViewportElement()).getPropertyValue('--r-main-font-size'),
    { size, unit } = fontSize.match(fontSizeRegexp).groups;

  Reveal.getViewportElement().style.setProperty('--r-main-font-size', (parseInt(size) + delta) + unit);
}
function resetFontSize() {
  Reveal.getViewportElement().style.removeProperty('--r-main-font-size');
}

const fontsizechange = function (Reveal) {
  Reveal.addKeyBinding(
    { keyCode: 189, key: '-', description: 'smaller font size' }, () => {
      updateFontSize(-2)
    }
  )
  Reveal.addKeyBinding(
    { keyCode: 187, key: '+', description: 'larger font size' }, () => {
      updateFontSize(+2)
    }
  )
  Reveal.addKeyBinding(
    { keyCode: 48, key: '0', description: 'reset font size' }, () => {
      resetFontSize()
    }
  )
};

document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll('.fragment').forEach(function(element) {
    element.classList.add('custom');
  });
});