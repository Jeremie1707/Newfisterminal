const printTableFirst = () => {
  document.getElementById("btnPrintTableFirst").addEventListener('click', (event) => {
    console.log(event);
    event.preventDefault();
    printElement(document.querySelector(".printTableFirst"));
  });
}
const printTableSecond = () => {
  document.getElementById("btnPrintTableSecond").addEventListener('click', (event) => {
    console.log(event);
    event.preventDefault();
    printElement(document.querySelector(".printTableSecond"));
  });
}

function printElement(elem) {
    var domClone = elem.cloneNode(true);

    var $printSection = document.getElementById("printSection");

    if (!$printSection) {
        var $printSection = document.createElement("div");
        $printSection.id = "printSection";
        document.body.appendChild($printSection);
    }

    $printSection.innerHTML = "";
    $printSection.appendChild(domClone);
    window.print();
}

export {printTableFirst,printTableSecond }

