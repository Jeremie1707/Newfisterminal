
const printArea = () => {
  document.getElementById("btnPrint").addEventListener('click', (event) => {
    console.log(event);
    event.preventDefault();
    printElement(document.getElementById("printModal"));
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

export {printElement, printArea}
